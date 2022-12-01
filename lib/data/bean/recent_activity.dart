import 'package:freezed_annotation/freezed_annotation.dart';

part 'recent_activity.freezed.dart';
part 'recent_activity.g.dart';

@freezed
class RecentActivity with _$RecentActivity {
  factory RecentActivity({
    String? title,
    String? icon,
    String? content,
  }) = _RecentActivity;

  factory RecentActivity.fromJson(Map<String, dynamic> json) => _$RecentActivityFromJson(json);
}
