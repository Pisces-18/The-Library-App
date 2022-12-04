// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_category_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookListVOAdapter extends TypeAdapter<BookCategoryVO> {
  @override
  final int typeId = 2;

  @override
  BookCategoryVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookCategoryVO(
      fields[0] as int?,
      fields[1] as String?,
      fields[2] as String?,
      fields[3] as String?,
      fields[4] as String?,
      (fields[5] as List?)?.cast<BookVO>(),
    );
  }

  @override
  void write(BinaryWriter writer, BookCategoryVO obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.listId)
      ..writeByte(1)
      ..write(obj.listName)
      ..writeByte(2)
      ..write(obj.listNameEncoded)
      ..writeByte(3)
      ..write(obj.displayName)
      ..writeByte(4)
      ..write(obj.updated)
      ..writeByte(5)
      ..write(obj.books);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookListVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookCategoryVO _$BookCategoryVOFromJson(Map<String, dynamic> json) =>
    BookCategoryVO(
      json['list_id'] as int?,
      json['list_name'] as String?,
      json['list_name_encoded'] as String?,
      json['display_name'] as String?,
      json['updated'] as String?,
      (json['books'] as List<dynamic>?)
          ?.map((e) => BookVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BookCategoryVOToJson(BookCategoryVO instance) =>
    <String, dynamic>{
      'list_id': instance.listId,
      'list_name': instance.listName,
      'list_name_encoded': instance.listNameEncoded,
      'display_name': instance.displayName,
      'updated': instance.updated,
      'books': instance.books,
    };
