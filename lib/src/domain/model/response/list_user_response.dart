import 'package:json_annotation/json_annotation.dart';
import 'package:reqres/src/domain/model/response/user.dart';

part 'list_user_response.g.dart';

@JsonSerializable()
class ListUserResponse {
  @JsonKey(name: 'page')
  final int? page;
  @JsonKey(name: 'per_page')
  final int? perPage;
  @JsonKey(name: 'total')
  final int? total;
  @JsonKey(name: 'total_pages')
  final int? totalPages;
  @JsonKey(name: 'data')
  final List<User>? data;

  ListUserResponse({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
  });

  factory ListUserResponse.fromJson(Map<String, dynamic> json) => _$ListUserResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ListUserResponseToJson(this);
}