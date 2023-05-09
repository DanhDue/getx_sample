// ignore_for_file: must_be_immutable

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_sample/app/modules/base/base.dart';
import 'package:getx_sample/app/modules/document_preview/views/widgets/resolution.dart';
import 'package:getx_sample/data/bean/resolution_data_object/resolution_data_object.dart';
import 'package:getx_sample/generated/locales.g.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../controllers/document_preview_controller.dart';
import 'widgets/basis_line.dart';
import 'widgets/resolution_footer.dart';

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
        pw.Partitions(children: [
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
                              controller.resolutionDataObject.value.organization ??
                                  'Công ty cổ phần\nTập đoàn đầu tư ExOICTIF'.toUpperCase(),
                              // "Công ty cổ phần\nTập đoàn đầu tư ExOICTIF".toUpperCase(),
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
                              style:
                                  pw.Theme.of(context).tableCell.copyWith(color: PdfColors.black),
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
                            style:
                                pw.Theme.of(context).tableHeader.copyWith(color: PdfColors.black),
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
                    for (var i = 0; i < controller.resolutionDataObject.value.basises!.length; i++)
                      BasisLine(
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
                for (var i = 0;
                    i < (controller.resolutionDataObject.value.resolution?.length ?? 0);
                    i++)
                  Resolution(
                      resolution: controller.resolutionDataObject.value.resolutions![i]!
                              .editTextController?.text ??
                          '',
                      index: i),
                // Resolution(
                //     resolution:
                //         "Gia hạn thời gian tổ chức cuộc họp ĐHĐCĐ thường niên năm 2023: dự kiến tổ chức vào ngày 22/06/2023.",
                //     index: 1),
                // Resolution(
                //     resolution:
                //         "Chốt ngày đăng kí cuối cùng để lập danh sách cổ đông có quyền tham dự họp ĐHĐCĐ thường niên là ngày 18/05/2023.",
                //     index: 2),
                // Resolution(
                //     resolution:
                //         "Địa điểm dự kiến tổ chức và nội dung họp: Công ty sẽ thông báo chi tiết tại \"Thư mời\" tham dự họp ĐHĐCĐ thường niên năm 2023.",
                //     index: 3),
                // Resolution(
                //     resolution:
                //         "HĐQT thống nhất trao quyền cho Chủ tịch HĐQT, người đại diện theo pháp luật của Công Ty tiến hành các thủ tục cần thiết theo quy định của pháp luật để hoàn thành các nội dung quy định tại các điều 1, 2, 3 của nghị quyết này.",
                //     index: 4),
                // Resolution(
                //     resolution:
                //         "Các thành viên HĐQT, Ban Tổng Giám Đốc, các Phòng/Ban và cá nhân có liên quan của Công Ty chịu trách nhiệm thi hành Nghị quyết này.",
                //     index: 5),
                ResolutionFooter(
                  // consumers: ["Ban Tổng Giám Đốc;", "Các Phòng/Ban;", "Các cá nhân liên quan;"],
                  consumers: controller.resolutionDataObject.value.consumers,
                  position:
                      (controller.resolutionDataObject.value.rightPositionOfDelegate ?? '(Vi tri)')
                          .toUpperCase(),
                  delegate: (controller.resolutionDataObject.value.delegate ?? 'Full Name'),
                ),
              ],
            ),
          ),
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
        base: await PdfGoogleFonts.tinosRegular(),
        bold: await PdfGoogleFonts.tinosBold(),
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
}
