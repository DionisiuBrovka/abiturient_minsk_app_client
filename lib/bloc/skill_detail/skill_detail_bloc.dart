import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_eduapp_new/data/models/skill_model.dart';
import 'package:flutter_eduapp_new/data/repositories/skill_repository.dart';
import 'package:meta/meta.dart';

part 'skill_detail_event.dart';
part 'skill_detail_state.dart';

class SkillDetailBloc extends Bloc<SkillDetailEvent, SkillDetailState> {
  SkillDetailBloc() : super(SkillDetailInitialState()) {
    on<SkillDetailEvent>((event, emit) {
      log("flutter: SkillDetailBloc Event ${event.toString()}");
    });

    on<LoadSkillDetailEvent>((event, emit) async {
      emit(SkillDetailLoadingState());
      try {
        SkillModel? skill = await SkillRepository.getSkill(event.id);
        if (skill != null) {
          emit(SkillDetailSucsessState(skill: skill));
        } else {
          throw 'Empty skill';
        }
      } catch (e) {
        log(e.toString());
        emit(SkillDetailErrorState());
      }
    });
  }
}