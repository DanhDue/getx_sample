import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:getx_sample/data/bean/basis_object/basis_object.dart';
import 'package:getx_sample/data/bean/consumer_object/consumer_object.dart';
import 'package:getx_sample/data/bean/resolution_object/resolution_object.dart';

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
    List<BasisObject?>? basises,
    String? resolve,
    String? resolveDescription,
    List<ResolutionObject?>? resolutions,
    List<ConsumerObject?>? consumers,
    String? rightPositionOfDelegate,
    String? delegate,
  }) = _ResolutionDataObject;

  factory ResolutionDataObject.fromJson(Map<String, dynamic> json) =>
      _$ResolutionDataObjectFromJson(json);
}
