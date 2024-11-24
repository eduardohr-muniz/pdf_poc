import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

abstract class StatelessPdf {
  pw.TextStyle get baseStyle => const pw.TextStyle(lineSpacing: 8, fontSize: 14);

  Future<Uint8List> loadPdf() async {
    final pdf = pw.Document();
    pdf.addPage(
      pw.MultiPage(
        build: (context) => build(),
      ),
    );

    return await pdf.save();
  }

  List<pw.Widget> build();
}

pw.Widget textWithUnderline({
  required int underlineLength,
  String? content,
  pw.TextStyle? style,
  double? offSet,
}) {
  if (content != null && content.length > underlineLength) {
    underlineLength = content.length + 1;
  }
  final underline = List.generate(underlineLength, (_) => "_").join();
  return pw.Stack(
    children: [
      pw.Text(
        underline,
        style: style,
      ),
      if (content != null && content.isNotEmpty)
        pw.Positioned.fill(
          child: pw.Align(
            alignment: pw.Alignment.centerLeft,
            child: pw.Transform.translate(
              offset: PdfPoint(0, (offSet ?? 0.5)),
              child: pw.Text(" $content", style: style),
            ),
          ),
        ),
    ],
  );
}

pw.RichText styledText(String input, {pw.TextStyle? baseStyle, List<pw.InlineSpan>? children}) {
  final spans = <pw.InlineSpan>[];

  final regex = RegExp(r"(\*.*?\*|_.*?_|[^\*_]+)"); // Captura *negrito*, _sublinhado_ e texto normal
  final matches = regex.allMatches(input);

  for (final match in matches) {
    final text = match.group(0)!;

    if (text.startsWith('*') && text.endsWith('*')) {
      // Texto em negrito
      spans.add(
        pw.TextSpan(
          text: text.substring(1, text.length - 1),
          style: baseStyle?.copyWith(fontWeight: pw.FontWeight.bold) ?? pw.TextStyle(fontWeight: pw.FontWeight.bold),
        ),
      );
    } else if (text.startsWith('_') && text.endsWith('_')) {
      // Texto sublinhado
      spans.add(
        pw.TextSpan(
          text: text.substring(1, text.length - 1),
          style: baseStyle?.copyWith(decoration: pw.TextDecoration.underline) ?? const pw.TextStyle(decoration: pw.TextDecoration.underline),
        ),
      );
    } else {
      // Texto normal
      spans.add(
        pw.TextSpan(
          text: text,
          style: baseStyle,
        ),
      );
    }
  }

  return pw.RichText(
    text: pw.TextSpan(
      children: [...spans, if (children != null) ...children],
    ),
  );
}
