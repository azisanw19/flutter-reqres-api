import 'package:dio/dio.dart';
import 'package:reqres/src/domain/model/body/auth_body.dart';
import 'package:reqres/src/domain/model/response/auth_response.dart';
import 'package:reqres/src/domain/model/response/list_user_response.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import '../../utils/constants/string.dart';

part 'reqres_api_service.g.dart';


@RestApi(baseUrl: baseUrl, parser: Parser.JsonSerializable)
abstract class ReqresApiService {
  factory ReqresApiService(Dio dio, {String baseUrl}) = _ReqresApiService;
  
  @POST('/register')
  Future<HttpResponse<AuthResponse>> register(
    @Body() AuthBody authBody,
  );

  @POST('/login')
  Future<HttpResponse<AuthResponse>> login(
    @Body() AuthBody authBody,
  );

  @GET('/users')
  Future<HttpResponse<ListUserResponse>> getUsers(
    @Query('page') int page,
  );
}