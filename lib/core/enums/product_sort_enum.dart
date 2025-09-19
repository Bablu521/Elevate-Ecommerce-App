import 'package:elevate_ecommerce_app/generated/l10n.dart';

import '../constants/end_points.dart';

enum ProductSortEnum {
  lowestPrice(Endpoints.sortByLowestPrice),
  highestPrice(Endpoints.sortByHighestPrice),
  newest(Endpoints.sortByNewest),
  oldest(Endpoints.sortByOldest),
  discount(Endpoints.sortByDiscount);

  final String value;

  const ProductSortEnum(this.value);
}

extension ProductSortExtension on ProductSortEnum {
  String get displayName {
    switch (this) {
      case ProductSortEnum.lowestPrice:
        return AppLocalizations().lowestPrice;
      case ProductSortEnum.highestPrice:
        return AppLocalizations().highestPrice;
      case ProductSortEnum.newest:
        return AppLocalizations().newWord;
      case ProductSortEnum.oldest:
        return AppLocalizations().old;
      case ProductSortEnum.discount:
        return AppLocalizations().discount;
    }
  }
}
