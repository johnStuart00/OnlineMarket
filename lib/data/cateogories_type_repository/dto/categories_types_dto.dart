// To parse this JSON data, do
//
//     final categoriesTypeDto = categoriesTypeDtoFromJson(jsonString);

import 'dart:convert';

CategoriesTypeDto categoriesTypeDtoFromJson(String str) =>
    CategoriesTypeDto.fromJson(json.decode(str));

String categoriesTypeDtoToJson(CategoriesTypeDto data) =>
    json.encode(data.toJson());

class CategoriesTypeDto {
  List<Datum>? data;
  Meta? meta;

  CategoriesTypeDto({
    this.data,
    this.meta,
  });

  factory CategoriesTypeDto.fromJson(Map<String, dynamic> json) =>
      CategoriesTypeDto(
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
  List<Category>? categories;
  String? id;
  String? name;

  Datum({
    this.categories,
    this.id,
    this.name,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        categories: json["categories"] == null
            ? []
            : List<Category>.from(
                json["categories"]!.map((x) => Category.fromJson(x))),
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x.toJson())),
        "id": id,
        "name": name,
      };
}

class Category {
  String? id;
  String? name;

  Category({
    this.id,
    this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
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
//