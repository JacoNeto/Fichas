import 'package:json_annotation/json_annotation.dart';

part 'result_response.g.dart';

@JsonSerializable()
class ResultResponse {
  int? code;
  String? description;
  bool? isList;
  List<dynamic>? list;
  dynamic object;
  double? time;
  String? log;

  ResultResponse({
    this.code,
    this.description,
    this.isList,
    this.list,
    this.object,
    this.time,
    this.log,
  });

  factory ResultResponse.fromJson(Map<String, dynamic> json) =>
      _$ResultResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ResultResponseToJson(this);
}
