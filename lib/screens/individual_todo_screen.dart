import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list/adapters/todo.dart';
import 'package:todo_list/api/pdf_api.dart';
import 'package:todo_list/constants/popup_button_constants.dart';
import 'package:todo_list/widgets/update_note.dart';

import '../api/pdf_paragraph_api.dart';

class IndividualListScreen extends StatefulWidget {
  final int? index;
  final Todo obj;
  const IndividualListScreen({
    Key? key,
    required this.index,
    required this.obj,
  }) : super(key: key);

  @override
  _IndividualListScreenState createState() => _IndividualListScreenState();
}

late final Box box;
late final Todo todo;

class _IndividualListScreenState extends State<IndividualListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          padding: const EdgeInsets.all(5),
          child: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Padding(
              padding: const EdgeInsets.all(1),
              child: Row(
                children: const [
                  Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                  SizedBox(width: 5),
                ],
              ),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () async {
              // final pdfFile = await PdfApi.generateCenteredText(widget.obj.note+widget.obj.task);
              final pdfFile =
                  await ParagraphApi.generate(widget.obj.task, widget.obj.note);
              PdfApi.openFile(pdfFile);
            },
            splashRadius: 20,
            icon: const Icon(
              Icons.picture_as_pdf,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () async{

            },
            splashRadius: 20,
            icon: const Icon(
              Icons.share,
              color: Colors.black,
            ),
          ),
          PopupMenuButton<String>(
            onSelected: null,
            icon: const Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
            itemBuilder: (BuildContext context) {
              return Constants.popupButton.map((String choice) {
                return PopupMenuItem<String>(
                  child: Text(choice),
                  value: choice,
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: UpdateNoteForm(
          index: widget.index!,
          obj: widget.obj,
        ),
      ),
    );
  }
}
