import 'package:pdf/pdf.dart';
import 'package:pdf_poc/src/interfaces/i_stateless_pdf.dart';
import 'package:pdf/widgets.dart';

class AtestadoPdfBuilder extends StatelessPdf {
  @override
  TextStyle get baseStyle => super.baseStyle.copyWith();

  @override
  Widget build() {
    return Column(
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
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text("Endereço:"),
                  Text("Data:"),
                  Text("Hora:"),
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
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 28),
        Text(
          "Atesto para os devidos fins que o(a):",
        ),
        SizedBox(height: 8),
        RichText(
          text: TextSpan(
            children: [
              const TextSpan(
                text: "Sr(a): ",
              ),
              WidgetSpan(
                  baseline: -4,
                  child: textWithUnderline(
                    underlineLength: 30,
                    content: "",
                  )),
              const TextSpan(
                text: ", portador(a): ",
              ),
              WidgetSpan(
                baseline: -4,
                child: textWithUnderline(
                  underlineLength: 25,
                  content: "",
                ),
              ),
              const TextSpan(
                text: ",",
              ),
            ],
          ),
        ),
        SizedBox(height: 8),
        RichText(
          text: TextSpan(
            children: [
              const TextSpan(
                text: "residente em ",
              ),
              WidgetSpan(
                  baseline: -4,
                  child: textWithUnderline(
                    underlineLength: 60,
                    content: "",
                  )),
            ],
          ),
        ),
        SizedBox(height: 8),
        styledText(
            "esteve sob meus cuidados profissionais do periodo das _13:30_ ás _14:00_ horas do dia _28 de fevereiro de 2024_. Necesssitando o(a) mesmo(a) de _ 2 dias _ de convalescença, por motivo de ",
            baseStyle: const TextStyle(lineSpacing: 8),
            children: [
              WidgetSpan(
                baseline: -4,
                child: textWithUnderline(underlineLength: 30, content: ""),
              ),
              const TextSpan(
                text: ".",
              )
            ]),
      ],
    );
  }
}
