import 'package:pdf/widgets.dart' as pw;

import 'package:pdf/pdf.dart';

class ResolutionConsumerView extends pw.StatelessWidget {
  ResolutionConsumerView({required this.consumer});

  final String consumer;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Padding(
      padding: const pw.EdgeInsets.only(bottom: 6),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.start,
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        mainAxisSize: pw.MainAxisSize.max,
        children: <pw.Widget>[
          pw.Text(
            "- ",
            style: pw.Theme.of(context)
                .tableCell
                .copyWith(color: PdfColors.black, fontWeight: pw.FontWeight.bold),
          ),
          pw.SizedBox(width: 7),
          pw.Expanded(
            child: pw.Text(
              consumer,
              style: pw.Theme.of(context).tableCell.copyWith(color: PdfColors.black),
            ),
          ),
        ],
      ),
    );
  }
}