import 'package:getx_sample/app/modules/document_preview/views/widgets/consumer.dart';
import 'package:getx_sample/data/bean/consumer_object/consumer_object.dart';
import 'package:pdf/widgets.dart' as pw;

import 'package:dart_extensions/dart_extensions.dart';
import 'package:get/get.dart';
import 'package:getx_sample/generated/locales.g.dart';
import 'package:pdf/pdf.dart';

class ResolutionFooter extends pw.StatelessWidget {
  ResolutionFooter({this.consumers, required this.position, required this.delegate});

  final List<ConsumerObject?>? consumers;
  final String position;
  final String delegate;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Padding(
      padding: const pw.EdgeInsets.only(top: 20),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.start,
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        mainAxisSize: pw.MainAxisSize.max,
        children: [
          pw.Expanded(
            flex: 1,
            child: consumers?.isEmptyOrNull == true
                ? pw.SizedBox()
                : pw.Column(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    mainAxisSize: pw.MainAxisSize.min,
                    children: [
                      pw.Text(
                        "${LocaleKeys.consumer.tr}:",
                        style: pw.Theme.of(context)
                            .defaultTextStyle
                            .copyWith(color: PdfColors.black, fontWeight: pw.FontWeight.bold),
                      ),
                      pw.SizedBox(height: 6),
                      // for (var consumer in consumers!) Consumer(consumer: consu),
                      for (var i = 0; i < (consumers?.length ?? 0);i++) Consumer(consumer: consumers?[i]?.editTextController?.text ?? ''),
                    ],
                  ),
          ),
          pw.Expanded(
            flex: 1,
            child: pw.Column(
              mainAxisAlignment: pw.MainAxisAlignment.center,
              crossAxisAlignment: pw.CrossAxisAlignment.center,
              mainAxisSize: pw.MainAxisSize.min,
              children: [
                pw.Text(
                  position,
                  textAlign: pw.TextAlign.center,
                  style: pw.Theme.of(context)
                      .defaultTextStyle
                      .copyWith(color: PdfColors.black, fontWeight: pw.FontWeight.bold),
                ),
                pw.SizedBox(height: 79),
                pw.Text(
                  delegate,
                  textAlign: pw.TextAlign.center,
                  style: pw.Theme.of(context)
                      .defaultTextStyle
                      .copyWith(color: PdfColors.black, fontWeight: pw.FontWeight.bold),
                ),
                pw.SizedBox(height: 69),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
