// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookListResponse _$BookListResponseFromJson(Map<String, dynamic> json) =>
    BookListResponse(
      json['status'] as String?,
      json['copyright'] as String?,
      json['num_results'] as int?,
      json['results'] == null
          ? null
          : ResultVO.fromJson(json['results'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BookListResponseToJson(BookListResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'copyright': instance.copyright,
      'num_results': instance.numResults,
      'results': instance.results,
    };
