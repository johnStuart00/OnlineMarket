// To parse this JSON data, do
//
//     final categoriesDto = categoriesDtoFromJson(jsonString);

import 'dart:convert';

CategoriesDto categoriesDtoFromJson(String str) =>
    CategoriesDto.fromJson(json.decode(str));

String categoriesDtoToJson(CategoriesDto data) => json.encode(data.toJson());

class CategoriesDto {
  List<Datum>? data;
  Meta? meta;

  CategoriesDto({
    this.data,
    this.meta,
  });

  factory CategoriesDto.fromJson(Map<String, dynamic> json) => CategoriesDto(
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "meta": meta?.toJson(),
      };
}

class Datum {
  String? id;
  String? name;
  List<Subcategory>? subcategories;

  Datum({
    this.id,
    this.name,
    this.subcategories,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        subcategories: json["subcategories"] == null
            ? []
            : List<Subcategory>.from(
                json["subcategories"]!.map((x) => Subcategory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "subcategories": subcategories == null
            ? []
            : List<dynamic>.from(subcategories!.map((x) => x.toJson())),
      };
}

class Subcategory {
  String? id;
  String? name;

  Subcategory({
    this.id,
    this.name,
  });

  factory Subcategory.fromJson(Map<String, dynamic> json) => Subcategory(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class Meta {
  int? limit;
  int? itemCount;
  int? pageCount;
  int? page;
  bool? hasPrevPage;
  bool? hasNextPage;

  Meta({
    this.limit,
    this.itemCount,
    this.pageCount,
    this.page,
    this.hasPrevPage,
    this.hasNextPage,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        limit: json["limit"],
        itemCount: json["itemCount"],
        pageCount: json["pageCount"],
        page: json["page"],
        hasPrevPage: json["hasPrevPage"],
        hasNextPage: json["hasNextPage"],
      );

  Map<String, dynamic> toJson() => {
        "limit": limit,
        "itemCount": itemCount,
        "pageCount": pageCount,
        "page": page,
        "hasPrevPage": hasPrevPage,
        "hasNextPage": hasNextPage,
      };
}
