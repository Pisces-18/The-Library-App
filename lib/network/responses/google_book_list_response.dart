import 'package:json_annotation/json_annotation.dart';

import '../../data/vos/google_book_vo.dart';
import '../../data/vos/result_vo.dart';

part 'google_book_list_response.g.dart';
@JsonSerializable()
class GoogleBookListResponse{
  @JsonKey(name: "kind")
  String? kind;

  @JsonKey(name: "totalItems")
  int? totalItems;

  @JsonKey(name: "items")
  List<GoogleBookVO>? items;


  GoogleBookListResponse(this.kind, this.totalItems, this.items);

  factory GoogleBookListResponse.fromJson(Map<String,dynamic> json)=>_$GoogleBookListResponseFromJson(json);

  Map<String,dynamic> toJson()=>_$GoogleBookListResponseToJson(this);
}
