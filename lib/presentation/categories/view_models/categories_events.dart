sealed class CategoriesEvents {}

class GetCategoriesEvent extends CategoriesEvents {}

class GetAllProductsEvent extends CategoriesEvents {}

class GetProductsByCategoryEvent extends CategoriesEvents {}

class ProductsSearchEvent extends CategoriesEvents {

    String? search;
    ProductsSearchEvent({this.search});
}

class ProductsFilterEvent extends CategoriesEvents {
    String? sort;
    ProductsFilterEvent({this.sort});

}

class InitTabBarEvent extends CategoriesEvents {}
