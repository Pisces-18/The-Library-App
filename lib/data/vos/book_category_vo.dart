import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../persistence/hive_constants.dart';
import 'book_vo.dart';

part 'book_category_vo.g.dart';
@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_BOOK_CATEGORY_VO,adapterName: "BookListVOAdapter")
class BookCategoryVO{
  @JsonKey(name: "list_id")
  @HiveField(0)
  int? listId;

  @JsonKey(name: "list_name")
  @HiveField(1)
  String? listName;

  @JsonKey(name: "list_name_encoded")
  @HiveField(2)
  String? listNameEncoded;

  @JsonKey(name: "display_name")
  @HiveField(3)
  String? displayName;

  @JsonKey(name: "updated")
  @HiveField(4)
  String? updated;

  @JsonKey(name: "books")
  @HiveField(5)
  List<BookVO>? books;


  BookCategoryVO(this.listId, this.listName, this.listNameEncoded, this.displayName,
      this.updated, this.books);

  factory BookCategoryVO.fromJson(Map<String, dynamic> json) =>
      _$BookCategoryVOFromJson(json);

  Map<String, dynamic> toJson() => _$BookCategoryVOToJson(this);
}
// "list_id": 704,
// "list_name": "Combined Print and E-Book Fiction",
// "list_name_encoded": "combined-print-and-e-book-fiction",
// "display_name": "Combined Print & E-Book Fiction",
// "updated": "WEEKLY",
// "list_image": null,
// "list_image_width": null,
// "list_image_height": null,
// "books"