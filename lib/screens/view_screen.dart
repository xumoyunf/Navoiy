import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:navoiy/models/data_model.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import '../../utils/colors.dart';
import '../../utils/styles.dart';

class ViewScreen extends StatelessWidget {
  final Book book;

  const ViewScreen({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    final ext = book.path.split('.').last;
    print(ext);
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Text(book.name, style: largeTextStyle()),
        backgroundColor: background,
        iconTheme: const IconThemeData(
          color: light,
        ),
      ),
      body: ext == 'pdf'
          ? SfPdfViewer.asset(
              book.path,
            )
          : Text("$ext fayl turini o'qib bo'lmadi", style: smallTextStyle()),
    );
  }
}
