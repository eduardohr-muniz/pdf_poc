import 'package:pdf/pdf.dart';
import 'package:flutter_pdf_poc/src/interfaces/i_stateless_pdf.dart';
import 'package:pdf/widgets.dart';

class AtestadoPdfBuilder extends StatelessPdf {
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
              "Atestado Médico",
              style: baseStyle.copyWith(fontSize: fontSize(1.5), fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 28),
          Text("Atesto para os devidos fins que o(a):", style: baseStyle),
          SizedBox(height: baseStyle.lineSpacing),
          RichText(
            text: TextSpan(
              style: baseStyle,
              children: [
                TextSpan(text: "Sr(a): ", style: baseStyle),
                WidgetSpan(baseline: -4, child: textWithUnderline(underlineLength: 30, content: "", style: baseStyle)),
                TextSpan(text: ", portador(a): ", style: baseStyle),
                WidgetSpan(
                  baseline: -4,
                  child: textWithUnderline(underlineLength: 15, content: "", style: baseStyle),
                ),
                TextSpan(text: ",", style: baseStyle),
              ],
            ),
          ),
          spacer(),
          RichText(
            text: TextSpan(
              style: baseStyle,
              children: [
                TextSpan(text: "residente em ", style: baseStyle),
                WidgetSpan(baseline: -4, child: textWithUnderline(underlineLength: 50, content: "", style: baseStyle)),
              ],
            ),
          ),
          spacer(),
          styledText(
              "esteve sob meus cuidados profissionais do periodo das _13:30_ ás _14:00_ horas do dia _28 de fevereiro de 2024_. Necesssitando o(a) mesmo(a) de _ 2 dias _ de convalescença, por motivo de ",
              baseStyle: baseStyle,
              children: [
                WidgetSpan(
                  baseline: -4,
                  child: textWithUnderline(underlineLength: 30, content: "", style: baseStyle),
                ),
                TextSpan(text: ".", style: baseStyle)
              ]),
        ],
      )
    ];
  }
}
