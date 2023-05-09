


import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class BasisLine extends pw.StatelessWidget {
  BasisLine({required this.basis});

  final String basis;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Padding(
      padding: const pw.EdgeInsets.only(bottom: 6),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.start,
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        mainAxisSize: pw.MainAxisSize.max,
        children: <pw.Widget>[
          pw.SizedBox(width: 20),
          pw.Text(
            "\u2022",
            style: pw.Theme.of(context)
                .tableCell
                .copyWith(color: PdfColors.black, fontWeight: pw.FontWeight.bold),
          ),
          pw.SizedBox(width: 10),
          pw.Expanded(
            child: pw.Text(
              basis,
              style: pw.Theme.of(context).tableCell.copyWith(color: PdfColors.black),
            ),
          ),
        ],
      ),
    );
  }
}
