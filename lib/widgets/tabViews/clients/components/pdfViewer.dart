//view a pdf

import 'package:flutter/material.dart';
import 'package:native_pdf_view/native_pdf_view.dart';

final pdfController = PdfController(
  document: PdfDocument.openAsset('assets/sample.pdf'),
);


Widget pdfView() => PdfView(
  controller: pdfController,
);

class PDFView extends StatelessWidget{
  final pdf;
  PDFView(this.pdf);
  @override
  Widget build(BuildContext context) {

    throw UnimplementedError();
  }

}