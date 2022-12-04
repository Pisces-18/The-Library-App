import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:the_library_app/data/vos/book_category_vo.dart';
import 'package:the_library_app/persistence/hive_constants.dart';

import 'book_category_vo.dart';
import 'book_category_vo.dart';
import 'book_category_vo.dart';
import 'book_vo.dart';

part 'image_links_vo.g.dart';
@JsonSerializable()
class ImageLinksVO{
  @JsonKey(name: "smallThumbnail")
  String? smallThumbnail;

  @JsonKey(name: "thumbnail")
  String? thumbnail;


  ImageLinksVO(this.smallThumbnail, this.thumbnail);

  factory ImageLinksVO.fromJson(Map<String, dynamic> json) =>
      _$ImageLinksVOFromJson(json);

  Map<String, dynamic> toJson() => _$ImageLinksVOToJson(this);
}
