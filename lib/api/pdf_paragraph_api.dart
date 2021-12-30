import 'dart:io';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:todo_list/api/pdf_api.dart';

class ParagraphApi {
  // late final String note;
  // late final String task;
  static Future<File> generate(String note, String task) async {
    final pdf = Document();
    pdf.addPage(
      MultiPage(
        build: (context) => <Widget>[
          Header(
            child: Text(note,
                style: TextStyle(
                  color: PdfColors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                )),
          ),
          Paragraph(text: task),
        ],
        footer: (context) {
          final text = 'Page ${context.pageNumber} of ${context.pagesCount}';
          return Container(
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.only(top: 1 * PdfPageFormat.cm),
            child: Text(
              text,
              style: const TextStyle(color: PdfColors.black),
            ),
          );
        },
      ),
    );

    return PdfApi.saveDocument(name: '$note.pdf', pdf: pdf);
  }
}
