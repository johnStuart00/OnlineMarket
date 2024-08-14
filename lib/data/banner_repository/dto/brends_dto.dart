// To parse this JSON data, do
//
//     final brendsDto = brendsDtoFromJson(jsonString);

import 'dart:convert';

BrendsDto brendsDtoFromJson(String str) => BrendsDto.fromJson(json.decode(str));

String brendsDtoToJson(BrendsDto data) => json.encode(data.toJson());

class BrendsDto {
  List<Datum>? data;
  Meta? meta;

  BrendsDto({
    this.data,
    this.meta,
  });

  factory BrendsDto.fromJson(Map<String, dynamic> json) => BrendsDto(
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
  String? logo;
  String? name;

  Datum({
    this.id,
    this.logo,
    this.name,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        logo: json["logo"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "logo": logo,
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
