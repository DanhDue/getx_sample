import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PreviewResolutionView extends pw.StatelessWidget {
  PreviewResolutionView({required this.resolution, required this.index});

  final String? resolution;
  final int? index;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Padding(
      padding: const pw.EdgeInsets.only(bottom: 6),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.start,
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        mainAxisSize: pw.MainAxisSize.max,
        children: <pw.Widget>[
          pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.center,
            crossAxisAlignment: pw.CrossAxisAlignment.center,
            mainAxisSize: pw.MainAxisSize.min,
            children: [
              pw.Text(
                "Điều $index:",
                style: pw.Theme.of(context)
                    .tableHeader
                    .copyWith(color: PdfColors.black, fontWeight: pw.FontWeight.bold),
              ),
              pw.SizedBox(height: 2),
              pw.Container(
                height: 1,
                width: 28,
                color: PdfColors.grey,
              ),
            ],
          ),
          pw.SizedBox(width: 10),
          pw.Expanded(
            child: pw.Text(
              resolution ?? "",
              style: pw.Theme.of(context).tableCell.copyWith(color: PdfColors.black),
            ),
          ),
        ],
      ),
    );
  }
}
