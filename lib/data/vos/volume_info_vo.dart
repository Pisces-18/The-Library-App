import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:the_library_app/data/vos/book_category_vo.dart';
import 'package:the_library_app/persistence/hive_constants.dart';

import 'book_category_vo.dart';
import 'book_category_vo.dart';
import 'book_category_vo.dart';
import 'book_vo.dart';
import 'image_links_vo.dart';

part 'volume_info_vo.g.dart';
@JsonSerializable()
class VolumeInfoVO{
  @JsonKey(name: "title")
  String? title;

  @JsonKey(name: "authors")
  List<String>? authors;

  @JsonKey(name: "publishedDate")
  String? publishedDate;

  @JsonKey(name: "description")
  String? description;

  @JsonKey(name: "pageCount")
  int? pageCount;

  @JsonKey(name: "imageLinks")
  ImageLinksVO? imageLinks;


  VolumeInfoVO(this.title, this.authors, this.publishedDate, this.description,
      this.pageCount, this.imageLinks);

  factory VolumeInfoVO.fromJson(Map<String, dynamic> json) =>
      _$VolumeInfoVOFromJson(json);

  Map<String, dynamic> toJson() => _$VolumeInfoVOToJson(this);
}
