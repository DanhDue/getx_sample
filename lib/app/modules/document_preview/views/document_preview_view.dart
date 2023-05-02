// ignore_for_file: must_be_immutable

import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:getx_sample/app/modules/base/base.dart';
import 'package:getx_sample/data/bean/resolution_data_object/resolution_data_object.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../controllers/document_preview_controller.dart';

class DocumentPreviewView extends BaseView<DocumentPreviewController> {
  DocumentPreviewView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PdfPreview(
        build: (format) => generateResume(context, format, null),
      ),
    );
  }
}

Future<Uint8List> generateResume(
    BuildContext buildContext, PdfPageFormat format, ResolutionDataObject? resolution) async {
  final doc = pw.Document(title: 'Resolution', author: 'Peter Dao');
  final pageTheme = await _myPageTheme(format);
  doc.addPage(pw.MultiPage(
    pageTheme: pageTheme,
    build: (pw.Context context) => [
      pw.Partitions(children: [
        pw.Partition(
          child: pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.start,
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: <pw.Widget>[
                pw.Expanded(
                  flex: 4,
                  child: pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      mainAxisSize: pw.MainAxisSize.max,
                      children: <pw.Widget>[
                        pw.Text(
                          // resolution?.organization ?? "",
                          "Công ty cổ phần\nTập đoàn đầu tư địa ốc NoVa".toUpperCase(),
                          style: pw.Theme.of(context).header4.copyWith(color: PdfColors.black),
                          textAlign: pw.TextAlign.center,
                        ),
                        pw.SizedBox(height: 7),
                        pw.Container(height: 1, width: 120, color: PdfColors.grey),
                        pw.SizedBox(height: 13),
                        pw.Text(
                          "Số: 31/2023 NQ-HĐQT-NVL",
                          style: pw.Theme.of(context)
                              .defaultTextStyle
                              .copyWith(color: PdfColors.black),
                          textAlign: pw.TextAlign.center,
                        ),
                      ]),
                ),
                pw.Expanded(
                  flex: 5,
                  child: pw.Column(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                    mainAxisSize: pw.MainAxisSize.max,
                    children: [
                      pw.Text("Cộng hòa xã hội chủ nghĩa Việt Nam".toUpperCase(),
                          style: pw.Theme.of(context).header4.copyWith(color: PdfColors.black)),
                      pw.SizedBox(height: 3),
                      pw.Text(
                        "Độc lập - Tự Do - Hạnh phúc",
                        style: pw.Theme.of(context).header5.copyWith(color: PdfColors.black),
                      ),
                      pw.SizedBox(height: 7),
                      pw.Container(
                        height: 1,
                        width: 286,
                        color: PdfColors.grey,
                      ),
                      pw.SizedBox(height: 13),
                      pw.Text(
                        "TP.Hồ Chí Minh, ngày 25, tháng 12, năm 2022",
                        style: pw.Theme.of(context)
                            .defaultTextStyle
                            .copyWith(color: PdfColors.black, height: 1.6),
                        textAlign: pw.TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ]),
        )
      ])
    ],
  ));
  return doc.save();
}

Future<pw.PageTheme> _myPageTheme(PdfPageFormat format) async {
  final bgShape = await rootBundle.loadString('assets/images/resume.svg');

  format = format.applyMargin(
      left: 0.1 * PdfPageFormat.cm,
      top: 1.0 * PdfPageFormat.cm,
      right: 0.1 * PdfPageFormat.cm,
      bottom: 1.0 * PdfPageFormat.cm);
  return pw.PageTheme(
    pageFormat: format,
    theme: pw.ThemeData.withFont(
      base: await PdfGoogleFonts.openSansRegular(),
      bold: await PdfGoogleFonts.openSansBold(),
      icons: await PdfGoogleFonts.materialIcons(),
    ),
    buildBackground: (pw.Context context) {
      return pw.FullPage(
        ignoreMargins: true,
        child: pw.Stack(
          children: [
            pw.Positioned(
              child: pw.SvgImage(svg: bgShape),
              left: 0,
              top: 0,
            ),
            pw.Positioned(
              child: pw.Transform.rotate(angle: pi, child: pw.SvgImage(svg: bgShape)),
              right: 0,
              bottom: 0,
            ),
          ],
        ),
      );
    },
  );
}