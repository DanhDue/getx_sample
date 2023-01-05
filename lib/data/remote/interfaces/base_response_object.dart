// Copyright (c) 2023, one of the D3F outsourcing projects. All rights reserved.

// coverage:ignore-file

import 'package:equatable/equatable.dart';
import 'package:fimber/fimber.dart';
import 'package:getx_sample/data/bean/user_object/user_object.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_response_object.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseResponseObject<T> extends Equatable {
  final String? code;
  final String? message;
  final T? result;

  const BaseResponseObject({this.code, this.message, this.result});

  factory BaseResponseObject.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) jsonToT,
  ) {
    return _$BaseResponseObjectFromJson<T>(json, jsonToT);
  }

  Map<String, dynamic> toJson(
    Map<String, dynamic> Function(T value) toJsonT,
  ) {
    return _$BaseResponseObjectToJson<T>(this, toJsonT);
  }

  @override
  List<Object?> get props => [code, message, result];
}

extension NetworkResponseConverter on BaseResponseObject {
  BaseResponseObject? decodeJson(Map<String, dynamic> json) {
    if (this is BaseResponseObject<UserObject>) {
      return BaseResponseObject<UserObject>.fromJson(json, jsonToUserObject);
    }
    if (this is BaseResponseObject<UserObject?>) {
      return BaseResponseObject<UserObject?>.fromJson(json, jsonToNullableUserObject);
    }
    if (this is BaseResponseObject<List<UserObject>>) {
      return BaseResponseObject<List<UserObject>>.fromJson(json, jsonToListUserObjects);
    }
    if (this is BaseResponseObject<List<UserObject?>>) {
      return BaseResponseObject<List<UserObject?>>.fromJson(json, jsonToListNullableUserObjects);
    }
    if (this is BaseResponseObject<List<UserObject>?>) {
      return BaseResponseObject<List<UserObject>?>.fromJson(json, jsonToListUserObjects);
    }
    if (this is BaseResponseObject<List<UserObject?>?>) {
      return BaseResponseObject<List<UserObject?>?>.fromJson(json, jsonToListNullableUserObjects);
    }
    Fimber.e('You need to implement the decodeJson method');
    return null;
  }
}
