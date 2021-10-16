part 'page.g.dart';

class Page {
  int? size;
  int? totalElements;
  int? totalPages;
  int? number;

  Page({this.size, this.totalElements, this.totalPages, this.number});

  factory Page.fromJson(Map<String, dynamic> json) => _$PageFromJson(json);
  Map<String, dynamic> toJson() => _$PageToJson(this);
}
