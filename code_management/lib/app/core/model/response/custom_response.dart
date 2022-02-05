import 'package:json_annotation/json_annotation.dart';

part 'custom_response.g.dart';

@JsonSerializable()
class CustomResponse {
  final int page;
  final Object results;
  @JsonKey(name: "total_pages")
  final int totalPages;
  @JsonKey(name: "total_results")
  final int totalResults;

  CustomResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory CustomResponse.fromJson(Map<String, dynamic> json) =>
      _$CustomResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CustomResponseToJson(this);
}
