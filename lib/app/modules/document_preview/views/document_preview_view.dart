// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_sample/app/modules/base/base.dart';
import 'package:getx_sample/app/modules/document_preview/views/preview_resolution_view.dart';
import 'package:getx_sample/app/modules/document_preview/views/resolution_base_line_view.dart';
import 'package:getx_sample/app/modules/document_preview/views/resolution_footer_view.dart';
import 'package:getx_sample/data/bean/resolution_data_object/resolution_data_object.dart';
import 'package:getx_sample/data/bean/resolution_object/resolution_object.dart';
import 'package:getx_sample/generated/locales.g.dart';
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

  Future<Uint8List> generateResume(
      BuildContext buildContext, PdfPageFormat format, ResolutionDataObject? resolution) async {
    final doc = pw.Document(title: 'Resolution', author: 'Peter Dao');
    final pageTheme = await _myPageTheme(format);
    doc.addPage(pw.MultiPage(
      pageTheme: pageTheme,
      build: (pw.Context context) => [
        pw.Partitions(
          children: [
            pw.Partition(
              child: pw.Column(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                mainAxisSize: pw.MainAxisSize.max,
                children: <pw.Widget>[
                  pw.Row(
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
                                controller.resolutionDataObject.value.organization ?? "",
                                style: pw.Theme.of(context).defaultTextStyle.copyWith(
                                    color: PdfColors.black,
                                    height: 1.6,
                                    lineSpacing: 3,
                                    fontWeight: pw.FontWeight.bold),
                                textAlign: pw.TextAlign.center,
                              ),
                              pw.SizedBox(height: 5),
                              pw.Container(height: 1, width: 120, color: PdfColors.grey),
                              pw.SizedBox(height: 13),
                              pw.Text(
                                controller.resolutionDataObject.value.docNumber ??
                                    'Số: .../... NQ-.......',
                                style: pw.Theme.of(context)
                                    .tableCell
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
                            pw.Text(LocaleKeys.vietnam.tr.toUpperCase(),
                                textAlign: pw.TextAlign.center,
                                style: pw.Theme.of(context).defaultTextStyle.copyWith(
                                    color: PdfColors.black, fontWeight: pw.FontWeight.bold)),
                            pw.SizedBox(height: 3),
                            pw.Text(
                              LocaleKeys.vietnamSlogan.tr,
                              style: pw.Theme.of(context)
                                  .tableHeader
                                  .copyWith(color: PdfColors.black),
                            ),
                            pw.SizedBox(height: 7),
                            pw.Container(
                              height: 1,
                              width: 120,
                              color: PdfColors.grey,
                            ),
                            pw.SizedBox(height: 13),
                            pw.Text(
                              controller.resolutionDataObject.value.createdAt ??
                                  '..., ngày ..., tháng ..., năm ... ',
                              style: pw.Theme.of(context)
                                  .tableCell
                                  .copyWith(color: PdfColors.black, height: 1.6),
                              textAlign: pw.TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  pw.Column(
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                    mainAxisSize: pw.MainAxisSize.max,
                    children: <pw.Widget>[
                      pw.Container(height: 35),
                      pw.Text(
                        (controller.resolutionDataObject.value.resolution ??
                                LocaleKeys.resolution.tr)
                            .toUpperCase(),
                        textAlign: pw.TextAlign.center,
                        style: pw.Theme.of(context)
                            .defaultTextStyle
                            .copyWith(color: PdfColors.black, fontWeight: pw.FontWeight.bold),
                      ),
                      pw.SizedBox(height: 9),
                      pw.Padding(
                        padding: const pw.EdgeInsets.symmetric(horizontal: 96),
                        child: pw.Text(
                          controller.resolutionDataObject.value.resolutionDes ?? '',
                          textAlign: pw.TextAlign.center,
                          style: pw.Theme.of(context).tableCell.copyWith(color: PdfColors.black),
                        ),
                      ),
                      pw.SizedBox(height: 6),
                      pw.Container(
                        height: 1,
                        width: 120,
                        color: PdfColors.grey,
                      ),
                      pw.SizedBox(height: 25),
                      pw.Text(
                        (controller.resolutionDataObject.value.author ?? LocaleKeys.basisTitle.tr)
                            .toUpperCase(),
                        textAlign: pw.TextAlign.center,
                        style: pw.Theme.of(context)
                            .defaultTextStyle
                            .copyWith(color: PdfColors.black, fontWeight: pw.FontWeight.bold),
                      ),
                    ],
                  ),
                  pw.Column(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    mainAxisSize: pw.MainAxisSize.max,
                    children: [
                      pw.SizedBox(height: 20),
                      pw.Text(
                        "${LocaleKeys.basis.tr}:",
                        style: pw.Theme.of(context)
                            .defaultTextStyle
                            .copyWith(color: PdfColors.black, fontWeight: pw.FontWeight.bold),
                      ),
                      pw.SizedBox(height: 8),
                      for (var i = 0;
                          i < controller.resolutionDataObject.value.basises!.length;
                          i++)
                        ResolutionBasisLineView(
                            basis: controller.resolutionDataObject.value.basises![i]!
                                    .editTextController?.text ??
                                ''),
                    ],
                  ),
                  pw.SizedBox(height: 20),
                  pw.Align(
                    alignment: pw.Alignment.center,
                    child: pw.Text(
                      (controller.resolutionDataObject.value.resolve ?? LocaleKeys.resolve.tr)
                          .toUpperCase(),
                      textAlign: pw.TextAlign.center,
                      style: pw.Theme.of(context)
                          .defaultTextStyle
                          .copyWith(color: PdfColors.black, fontWeight: pw.FontWeight.bold),
                    ),
                  ),
                  pw.SizedBox(height: 20),
                  pw.Text(
                    controller.resolutionDataObject.value.resolveDescription ?? '',
                    style: pw.Theme.of(context).tableCell.copyWith(color: PdfColors.black),
                  ),
                  pw.SizedBox(height: 13),
                  for (var resolution in controller.resolutionDataObject.value.resolutions ?? [])
                    PreviewResolutionView(
                      resolution:
                          (resolution as ResolutionObject?)?.editTextController?.text ?? "",
                      index: ((controller.resolutionDataObject.value.resolutions
                                  ?.indexOf(resolution) ??
                              0) +
                          1),
                    ),
                  ResolutionFooterView(
                    consumers: controller.resolutionDataObject.value.consumers,
                    position: (controller.resolutionDataObject.value.rightPositionOfDelegate ?? '')
                        .toUpperCase(),
                    delegate: (controller.resolutionDataObject.value.delegate ?? ''),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    ));
    return doc.save();
  }

  Future<pw.PageTheme> _myPageTheme(PdfPageFormat format) async {
    format = format.applyMargin(
        left: 0.1 * PdfPageFormat.cm,
        top: 1.0 * PdfPageFormat.cm,
        right: 0.1 * PdfPageFormat.cm,
        bottom: 1.0 * PdfPageFormat.cm);
    return pw.PageTheme(
      pageFormat: format,
      theme: pw.ThemeData.withFont(
        base: await PdfGoogleFonts.tinosRegular(),
        bold: await PdfGoogleFonts.tinosBold(),
        icons: await PdfGoogleFonts.materialIcons(),
      ),
      buildBackground: (pw.Context context) {
        return pw.FullPage(
          ignoreMargins: true,
          child: pw.Stack(
            children: [],
          ),
        );
      },
    );
  }
}
