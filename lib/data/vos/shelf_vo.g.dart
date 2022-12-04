// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shelf_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ShelfVOAdapter extends TypeAdapter<ShelfVO> {
  @override
  final int typeId = 4;

  @override
  ShelfVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ShelfVO(
      fields[0] as int?,
      fields[1] as String?,
      (fields[2] as List?)?.cast<BookVO>(),
      isCheck: fields[3] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, ShelfVO obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.shelfId)
      ..writeByte(1)
      ..write(obj.shelfName)
      ..writeByte(2)
      ..write(obj.bookList)
      ..writeByte(3)
      ..write(obj.isCheck);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShelfVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShelfVO _$ShelfVOFromJson(Map<String, dynamic> json) => ShelfVO(
      json['shelfId'] as int?,
      json['shelfName'] as String?,
      (json['bookList'] as List<dynamic>?)
          ?.map((e) => BookVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      isCheck: json['isCheck'] as bool? ?? false,
    );

Map<String, dynamic> _$ShelfVOToJson(ShelfVO instance) => <String, dynamic>{
      'shelfId': instance.shelfId,
      'shelfName': instance.shelfName,
      'bookList': instance.bookList,
      'isCheck': instance.isCheck,
    };
