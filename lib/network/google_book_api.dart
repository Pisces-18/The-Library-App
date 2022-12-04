import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:the_library_app/network/responses/book_list_response.dart';
import 'package:the_library_app/network/responses/google_book_list_response.dart';

import '../data/vos/book_category_vo.dart';
import 'api_constants.dart';
part 'google_book_api.g.dart';

@RestApi(baseUrl: BASE_GOOGLE_URL_DIO)
abstract class GoogleBookApi{
  factory GoogleBookApi(Dio dio)=_GoogleBookApi;


  @GET(ENDPOINT_GET_GOOGLE_BOOK)
  Future<GoogleBookListResponse> getBookListFromGoogle(
      @Query("q") String searchBookName,
      );



}