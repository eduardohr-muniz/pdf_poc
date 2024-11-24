import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_pdf_poc/src/examples/exam_request_pdf_builder.dart';
import 'package:flutter_pdf_poc/src/examples/receita_pdf_builder.dart';

import 'package:printing/printing.dart';

class PdfPreviewPage extends StatelessWidget {
  const PdfPreviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Visualizar PDF'),
      ),
      body: FutureBuilder<Uint8List>(
        future: ExamRequestPdfBuilder().loadPdf(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro ao gerar PDF: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            return PdfPreview(
              build: (format) => snapshot.data!,
            );
          } else {
            return const Center(child: Text('Nenhum PDF disponível.'));
          }
        },
      ),
    );
  }
}
