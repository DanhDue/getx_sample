import 'package:freezed_annotation/freezed_annotation.dart';

part 'resolution_data_object.freezed.dart';
part 'resolution_data_object.g.dart';

@freezed
class ResolutionDataObject with _$ResolutionDataObject {
  factory ResolutionDataObject({
    String? organization,
    String? docNumber,
    String? createdAt,
    String? resolution,
    String? resolutionDes,
    String? author,
    List<String>? basises,
    List<String>? resolutions,
    List<String>? consumers,
    String? delegate,
  }) = _ResolutionDataObject;

  factory ResolutionDataObject.fromJson(Map<String, dynamic> json) =>
      _$ResolutionDataObjectFromJson(json);
}
