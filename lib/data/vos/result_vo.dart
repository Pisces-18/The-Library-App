import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:the_library_app/data/vos/book_category_vo.dart';
import 'package:the_library_app/persistence/hive_constants.dart';

import 'book_category_vo.dart';
import 'book_category_vo.dart';
import 'book_category_vo.dart';
import 'book_vo.dart';

part 'result_vo.g.dart';
@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_RESULT_VO,adapterName: "ResultVOAdapter")
class ResultVO{
  @JsonKey(name: "bestsellers_date")
  @HiveField(0)
  String? bestSellersDate;

  @JsonKey(name: "published_date")
  @HiveField(1)
  String? publishedDate;

  @JsonKey(name: "published_date_description")
  @HiveField(2)
  String? publishedDateDescription;

  @JsonKey(name: "previous_published_date")
  @HiveField(3)
  String? previousPublishedDate;

  @JsonKey(name: "next_published_date")
  @HiveField(4)
  String? nextPublishedDate;

  @JsonKey(name: "lists")
  @HiveField(5)
  List<BookCategoryVO>? lists;

  ResultVO(
      this.bestSellersDate,
      this.publishedDate,
      this.publishedDateDescription,
      this.previousPublishedDate,
      this.nextPublishedDate,
      this.lists);

  factory ResultVO.fromJson(Map<String, dynamic> json) =>
      _$ResultVOFromJson(json);

  Map<String, dynamic> toJson() => _$ResultVOToJson(this);
}
// "bestsellers_date": "2022-11-19",
// "published_date": "2022-12-04",
// "published_date_description": "latest",
// "previous_published_date": "2022-11-27",
// "next_published_date": "",
// "lists":