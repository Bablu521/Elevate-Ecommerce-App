import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final int? rateAvg;
  final int? rateCount;
  final String? id;
  final String? title;
  final String? slug;
  final String? description;
  final String? imgCover;
  final List<String>? images;
  final int? price;
  final int? priceAfterDiscount;
  final int? quantity;
  final String? category;
  final String? occasion;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final bool? isSuperAdmin;
  final int? sold;

  const ProductEntity({
    this.rateAvg,
    this.rateCount,
    this.id,
    this.title,
    this.slug,
    this.description,
    this.imgCover,
    this.images,
    this.price,
    this.priceAfterDiscount,
    this.quantity,
    this.category,
    this.occasion,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.isSuperAdmin,
    this.sold,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'slug': slug,
      'description': description,
      'imgCover': imgCover,
      'images': images,
      'price': price,
      'priceAfterDiscount': priceAfterDiscount,
      'quantity': quantity,
      'category': category,
      'occasion': occasion,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'v': v,
      'isSuperAdmin': isSuperAdmin,
      'sold': sold,
      'rateAvg': rateAvg,
      'rateCount': rateCount,
    };
  }

  factory ProductEntity.fromMap(Map<String, dynamic> map) {
    return ProductEntity(
      id: map['id'] as String?,
      title: map['title'] as String?,
      slug: map['slug'] as String?,
      description: map['description'] as String?,
      imgCover: map['imgCover'] as String?,
      images: List<String>.from(map['images']),
      price: map['price'] as int?,
      priceAfterDiscount: map['priceAfterDiscount'] as int?,
      quantity: map['quantity'] as int?,
      category: map['category'] as String?,
      occasion: map['occasion'] as String?,
      createdAt: _parseDate(map['createdAt']),
      updatedAt: _parseDate(map['updatedAt']),
      v: map['v'] as int?,
      isSuperAdmin: map['isSuperAdmin'] as bool?,
      sold: map['sold'] as int?,
      rateAvg: map['rateAvg'] as int?,
      rateCount: map['rateCount'] as int?,
    );
  }

  static DateTime? _parseDate(dynamic value) {
    if (value == null) return null;
    if (value is Timestamp) return value.toDate();
    if (value is String) return DateTime.tryParse(value);
    return null;
  }

  @override
  List<Object?> get props {
    return [
      rateAvg,
      rateCount,
      id,
      title,
      slug,
      description,
      imgCover,
      images,
      price,
      priceAfterDiscount,
      quantity,
      category,
      occasion,
      createdAt,
      updatedAt,
      v,
      isSuperAdmin,
      sold,
      id,
    ];
  }
}

      