import 'package:json_annotation/json_annotation.dart';

import '../../data/vos/result_vo.dart';

part 'book_list_response.g.dart';
@JsonSerializable()
class BookListResponse{
  @JsonKey(name: "status")
  String? status;

  @JsonKey(name: "copyright")
  String? copyright;

  @JsonKey(name: "num_results")
  int? numResults;

  @JsonKey(name: "results")
  ResultVO? results;


  BookListResponse(this.status, this.copyright, this.numResults, this.results);

  factory BookListResponse.fromJson(Map<String,dynamic> json)=>_$BookListResponseFromJson(json);

  Map<String,dynamic> toJson()=>_$BookListResponseToJson(this);
}
// "status": "OK",
// "copyright": "Copyright (c) 2022 The New York Times Company.  All Rights Reserved.",
// "num_results": 90,
// "results": {
// "bestsellers_date": "2022-11-19",
// "published_date": "2022-12-04",
// "published_date_description": "latest",
// "previous_published_date": "2022-11-27",
// "next_published_date": "",
// "lists":