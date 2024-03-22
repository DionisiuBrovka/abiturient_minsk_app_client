import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_eduapp_new/pages/documents_deadline/deadline_markdown_data.dart';
import 'package:flutter_eduapp_new/widgets/appbar/custom_appbar.dart';
import 'package:flutter_eduapp_new/widgets/drawer/custom_drawer.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class PageDocumentDeadline extends StatelessWidget {
  const PageDocumentDeadline({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        customTitle: const Text("Сроки подачи документов"),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Image.asset(
            "assets/faq-time.jpg",
            fit: BoxFit.cover,
            height: 200,
            width: double.infinity,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 1000,
                child: MarkdownBody(
                  data: DEADLINE_MARKDOWN_DATA,
                  selectable: false,
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: const CustomDrawer(
        selectedIndex: 5,
      ),
    );
  }
}
