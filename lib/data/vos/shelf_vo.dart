import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../persistence/hive_constants.dart';
import 'book_vo.dart';

part 'shelf_vo.g.dart';
@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_SHELF_VO,adapterName: "ShelfVOAdapter")
class ShelfVO{

  @HiveField(0)
  int? shelfId;

  @HiveField(1)
  String? shelfName;

  @HiveField(2)
  List<BookVO>? bookList=[];

  @HiveField(3)
  bool? isCheck=false;


  ShelfVO(this.shelfId,this.shelfName, this.bookList, {this.isCheck =false});

  factory ShelfVO.fromJson(Map<String, dynamic> json) =>
      _$ShelfVOFromJson(json);

  Map<String, dynamic> toJson() => _$ShelfVOToJson(this);

}