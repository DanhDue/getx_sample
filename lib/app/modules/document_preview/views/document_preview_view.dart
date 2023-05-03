// ignore_for_file: must_be_immutable

import 'dart:math';
import 'dart:typed_data';

import 'package:dart_extensions/dart_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart';
import 'package:getx_sample/app/modules/base/base.dart';
import 'package:getx_sample/data/bean/resolution_data_object/resolution_data_object.dart';
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
                            // resolution?.organization ?? "",
                            "Công ty cổ phần\nTập đoàn đầu tư ExOICTIF".toUpperCase(),
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
                            "Số: 31/2023 NQ-HĐQT-ExOICTIF",
                            style: pw.Theme.of(context).tableCell.copyWith(color: PdfColors.black),
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
                            style: pw.Theme.of(context)
                                .defaultTextStyle
                                .copyWith(color: PdfColors.black, fontWeight: pw.FontWeight.bold)),
                        pw.SizedBox(height: 3),
                        pw.Text(
                          LocaleKeys.vietnamSlogan.tr,
                          style: pw.Theme.of(context).tableHeader.copyWith(color: PdfColors.black),
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
                    LocaleKeys.resolution.tr.toUpperCase(),
                    textAlign: pw.TextAlign.center,
                    style: pw.Theme.of(context)
                        .defaultTextStyle
                        .copyWith(color: PdfColors.black, fontWeight: pw.FontWeight.bold),
                  ),
                  pw.SizedBox(height: 9),
                  pw.Padding(
                    padding: const pw.EdgeInsets.symmetric(horizontal: 96),
                    child: pw.Text(
                      "V/v CBTT liên quan đến nghị quyết HĐQT của công ty và thông báo về ngày đăng kí cuối cùng",
                      textAlign: pw.TextAlign.center,
                      style: pw.Theme.of(context).tableCell.copyWith(color: PdfColors.black),
                    ),
                  ),
                  pw.SizedBox(height: 6),
                  pw.Container(
                    height: 1,
                    width: 136,
                    color: PdfColors.grey,
                  ),
                  pw.SizedBox(height: 25),
                  pw.Text(
                    LocaleKeys.basisTitle.tr.toUpperCase(),
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
                  _BasisLine(
                      basis:
                          "Luật doanh nghiệp số 59/2020/QH14 được Quốc Hội thông qua ngày 17/06/2020 và các văn bản hướng dẫn thi hành;"),
                  _BasisLine(
                      basis: "Điều lệ của công ty Cổ phần Tập đoàn Đầu tư ExOICTIF(\"Công Ty\");"),
                  _BasisLine(basis: "Quy chế quản trị Công Ty;"),
                  _BasisLine(
                      basis:
                          "Biên bản họp Hội đồng Quản trị Công Ty(\"HĐQT\") số 26/2023-BB.HĐQT-ExOICTIF thông qua ngày 25/04/2023;"),
                ],
              ),
              pw.SizedBox(height: 20),
              pw.Align(
                alignment: pw.Alignment.center,
                child: pw.Text(
                  LocaleKeys.resolve.tr.toUpperCase(),
                  textAlign: pw.TextAlign.center,
                  style: pw.Theme.of(context)
                      .defaultTextStyle
                      .copyWith(color: PdfColors.black, fontWeight: pw.FontWeight.bold),
                ),
              ),
              pw.SizedBox(height: 20),
              pw.Text(
                "Thông qua việc gia hạn thời gian tổ chức cuộc họp Đại hội đồng cổ đông thường niên(\"ĐHĐCĐ thường niên\") năm 2023 và chốt ngày đăng kí cuối cùng để lập danh sách cổ đông có quyền dự họp ĐHĐCĐ thường niên năm 2023, chi tiết như sau:",
                style: pw.Theme.of(context).tableCell.copyWith(color: PdfColors.black),
              ),
              pw.SizedBox(height: 13),
              _Resolution(
                  resolution:
                      "Gia hạn thời gian tổ chức cuộc họp ĐHĐCĐ thường niên năm 2023: dự kiến tổ chức vào ngày 22/06/2023.",
                  index: 1),
              _Resolution(
                  resolution:
                      "Chốt ngày đăng kí cuối cùng để lập danh sách cổ đông có quyền tham dự họp ĐHĐCĐ thường niên là ngày 18/05/2023.",
                  index: 2),
              _Resolution(
                  resolution:
                      "Địa điểm dự kiến tổ chức và nội dung họp: Công ty sẽ thông báo chi tiết tại \"Thư mời\" tham dự họp ĐHĐCĐ thường niên năm 2023.",
                  index: 3),
              _Resolution(
                  resolution:
                      "HĐQT thống nhất trao quyền cho Chủ tịch HĐQT, người đại diện theo pháp luật của Công Ty tiến hành các thủ tục cần thiết theo quy định của pháp luật để hoàn thành các nội dung quy định tại các điều 1, 2, 3 của nghị quyết này.",
                  index: 4),
              _Resolution(
                  resolution:
                      "Các thành viên HĐQT, Ban Tổng Giám Đốc, các Phòng/Ban và cá nhân có liên quan của Công Ty chịu trách nhiệm thi hành Nghị quyết này.",
                  index: 5),
              _Resolution(resolution: "Nghị quyết có hiệu lực kể từ ngày kí.", index: 6),
              _ResolutionFooter(
                consumers: ["Ban Tổng Giám Đốc;", "Các Phòng/Ban;", "Các cá nhân liên quan;"],
                position: "TM. Hội đồng quản trị\nChủ tịch Hội đồng quản trị".toUpperCase(),
                delegate: "DanhDue ExOICTIF",
              ),
            ],
          ),
        ),
      ])
    ],
  ));
  return doc.save();
}

class _ResolutionFooter extends pw.StatelessWidget {
  _ResolutionFooter({this.consumers, required this.position, required this.delegate});

  final List<String>? consumers;
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
                      for (var consumer in consumers!) _Consumer(consumer: consumer),
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

class _BasisLine extends pw.StatelessWidget {
  _BasisLine({required this.basis});

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

class _Resolution extends pw.StatelessWidget {
  _Resolution({required this.resolution, required this.index});

  final String resolution;
  final int index;

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
              resolution,
              style: pw.Theme.of(context).tableCell.copyWith(color: PdfColors.black),
            ),
          ),
        ],
      ),
    );
  }
}

class _Consumer extends pw.StatelessWidget {
  _Consumer({required this.consumer});

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
