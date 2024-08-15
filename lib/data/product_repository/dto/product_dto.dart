// To parse this JSON data, do
//
//     final productDto = productDtoFromJson(jsonString);

import 'dart:convert';

ProductDto productDtoFromJson(String str) =>
    ProductDto.fromJson(json.decode(str));

String productDtoToJson(ProductDto data) => json.encode(data.toJson());

class ProductDto {
  List<Datum>? data;
  Meta? meta;

  ProductDto({
    this.data,
    this.meta,
  });

  factory ProductDto.fromJson(Map<String, dynamic> json) => ProductDto(
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
  String? availability;
  Brand? brand;
  String? color;
  String? deliveryTime;
  String? description;
  int? discountPrice;
  String? id;
  List<dynamic>? media;
  String? name;
  int? price;
  int? purchases;
  String? size;
  int? views;

  Datum({
    this.availability,
    this.brand,
    this.color,
    this.deliveryTime,
    this.description,
    this.discountPrice,
    this.id,
    this.media,
    this.name,
    this.price,
    this.purchases,
    this.size,
    this.views,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        availability: json["availability"],
        brand: json["brand"] == null ? null : Brand.fromJson(json["brand"]),
        color: json["color"],
        deliveryTime: json["deliveryTime"],
        description: json["description"],
        discountPrice: json["discountPrice"],
        id: json["id"],
        media: json["media"] == null
            ? []
            : List<dynamic>.from(json["media"]!.map((x) => x)),
        name: json["name"],
        price: json["price"],
        purchases: json["purchases"],
        size: json["size"],
        views: json["views"],
      );

  Map<String, dynamic> toJson() => {
        "availability": availability,
        "brand": brand?.toJson(),
        "color": color,
        "deliveryTime": deliveryTime,
        "description": description,
        "discountPrice": discountPrice,
        "id": id,
        "media": media == null ? [] : List<dynamic>.from(media!.map((x) => x)),
        "name": name,
        "price": price,
        "purchases": purchases,
        "size": size,
        "views": views,
      };
}

class Brand {
  String? id;
  String? name;

  Brand({
    this.id,
    this.name,
  });

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
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
