// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultResponse _$ResultResponseFromJson(Map<String, dynamic> json) =>
    ResultResponse(
      code: json['code'] as int?,
      description: json['description'] as String?,
      isList: json['isList'] as bool?,
      list: json['list'] as List<dynamic>?,
      object: json['object'],
      time: (json['time'] as num?)?.toDouble(),
      log: json['log'] as String?,
    );

Map<String, dynamic> _$ResultResponseToJson(ResultResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'description': instance.description,
      'isList': instance.isList,
      'list': instance.list,
      'object': instance.object,
      'time': instance.time,
      'log': instance.log,
    };
