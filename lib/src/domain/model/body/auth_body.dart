import 'package:json_annotation/json_annotation.dart';

part 'auth_body.g.dart';

@JsonSerializable()
class AuthBody {
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'password')
  final String password;

  AuthBody({
    required this.email,
    required this.password,
  });

  factory AuthBody.fromJson(Map<String, dynamic> json) => _$AuthBodyFromJson(json);
  Map<String, dynamic> toJson() => _$AuthBodyToJson(this);
}