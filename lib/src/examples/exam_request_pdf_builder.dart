import 'package:pdf/pdf.dart';
import 'package:flutter_pdf_poc/src/interfaces/i_stateless_pdf.dart';
import 'package:pdf/widgets.dart';

class ExamRequestPdfBuilder extends StatelessPdf {
  @override
  TextStyle get baseStyle => super.baseStyle.copyWith(fontSize: 14, lineSpacing: 20);

  double? fontSize(double factor) {
    if (baseStyle.fontSize == null) return null;

    return baseStyle.fontSize! * factor;
  }

  Widget spacer() => SizedBox(height: baseStyle.lineSpacing);
  @override
  List<Widget> build() {
    return [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nome da unidade de atendimento",
                      style: baseStyle.copyWith(fontSize: fontSize(1.5), fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text("Endereço:", style: baseStyle),
                    Text("Data:", style: baseStyle),
                    Text("Hora:", style: baseStyle),
                    SizedBox(height: 28),
                  ],
                ),
              ),
              Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    border: Border.all(color: PdfColor.fromHex('#000000')),
                  ))
            ],
          ),
          Divider(),
          Center(
            child: Text(
              "Pedido de Exame",
              style: baseStyle.copyWith(fontSize: fontSize(1.5), fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 28),
          Text("Paciente:", style: baseStyle),
          spacer(),
          Text("CPF:", style: baseStyle),
          spacer(),
          Text("Endereço:", style: baseStyle),
          spacer(),
          Text("Solicita os seguintes exames:", style: baseStyle),
        ],
      )
    ];
  }
}
