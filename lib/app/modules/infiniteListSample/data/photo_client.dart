// Copyright (c) 2022, one of the D3F outsourcing projects. All rights reserved.

// coverage:ignore-file

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:getx_sample/data/remote/interfaces/base_client_generator.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

part 'photo_client.freezed.dart';

@freezed
class PhotoClient extends BaseClientGenerator with _$PhotoClient {
  PhotoClient._() : super();

  factory PhotoClient.loadPhotos(int? pageNumber) = _LoadPhotos;

  @override
  String get baseURL => "https://jsonplaceholder.typicode.com";

  @override
  Map<String, dynamic> get body {
    return maybeWhen(
      orElse: () => {},
    );
  }

  @override
  String get method {
    return maybeWhen<String>(
      orElse: () => RequestMethods.get.name,
    );
  }

  @override
  String get path {
    return maybeWhen<String>(
      loadPhotos: (pageNumber) => "/photos?_page=$pageNumber",
      orElse: () => '',
    );
  }

  @override
  Map<String, dynamic>? get queryParameters {
    return maybeWhen(
      orElse: () => null,
    );
  }
}
