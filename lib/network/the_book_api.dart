import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:the_library_app/network/responses/book_list_response.dart';

import '../data/vos/book_category_vo.dart';
import 'api_constants.dart';
part 'the_book_api.g.dart';

@RestApi(baseUrl: BASE_URL_DIO)
abstract class TheBookApi{
  factory TheBookApi(Dio dio)=_TheBookApi;



  @GET(ENDPOINT_GET_BOOK_LISTS)
  Future<BookListResponse> getBookList(
      @Query(PARAM_API_KEY) String apiKey,
      );



}