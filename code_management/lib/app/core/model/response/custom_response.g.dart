// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomResponse _$CustomResponseFromJson(Map<String, dynamic> json) =>
    CustomResponse(
      page: json['page'] as int,
      results: json['results'] as Object,
      totalPages: json['total_pages'] as int,
      totalResults: json['total_results'] as int,
    );

Map<String, dynamic> _$CustomResponseToJson(CustomResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };
