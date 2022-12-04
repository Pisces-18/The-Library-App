import 'package:dio/dio.dart';
import 'package:the_library_app/data/vos/book_category_vo.dart';
import 'package:the_library_app/data/vos/book_vo.dart';
import 'package:the_library_app/data/vos/google_book_vo.dart';
import 'package:the_library_app/network/dataagents/book_data_agent.dart';
import 'package:the_library_app/network/google_book_api.dart';

import '../api_constants.dart';
import '../the_book_api.dart';

class RetrofitDataAgentImpl extends BookDataAgent{
  TheBookApi? bApi;
  GoogleBookApi? gApi;
  static final RetrofitDataAgentImpl _singleton =
  RetrofitDataAgentImpl._internal();

  factory RetrofitDataAgentImpl() {
    return _singleton;
  }

  RetrofitDataAgentImpl._internal() {
    // final dio = Dio();

    final dio = Dio(
      BaseOptions(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
        headers: {
          HEADER_REQUESTED_WITH: XML_HTTP_REQUEST,
        },
      ),
    );
    bApi = TheBookApi(dio);
    gApi=GoogleBookApi(dio);

  }
  @override
  Future<List<BookCategoryVO>?>? getBookListName() {
    return bApi
        ?.getBookList(API_KEY)
        .asStream()
        .map((response) => response.results?.lists)
        .first;
  }

  @override
  Future<List<GoogleBookVO>?>? getBookListFromGoogle(String searchBookName) {
    return gApi
        ?.getBookListFromGoogle(searchBookName)
        .asStream()
        .map((response) => response.items)
        .first;
  }

  @override
  Future<List<BookVO>?>? getBookList(String listName) {
    // TODO: implement getBookList
    throw UnimplementedError();
  }

}