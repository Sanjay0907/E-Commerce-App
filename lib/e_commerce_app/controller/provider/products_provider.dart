import 'package:e_commerce_app/e_commerce_app/controller/model/local_storage.dart';
import 'package:e_commerce_app/e_commerce_app/controller/model/products_model.dart';
import 'package:e_commerce_app/e_commerce_app/controller/services/get_products_service.dart';
import 'package:flutter/cupertino.dart';

class ProductsProvider extends ChangeNotifier {
  var isLoading = true;
  List<ProductsModel> products = [];

  ProductsProvider() {
    fetchData();
  }

  void fetchData() async {
    List<dynamic> _products = await API.getProducts();
    List<int> favorites = await LocalStorage.fetchFavorite();
    List<ProductsModel> temp = [];

    for (var product in _products) {
      ProductsModel newProduct = ProductsModel.fromJson(product);

      if (favorites.contains(newProduct.id!.toString())) {
        newProduct.isFavorite = true;
      }
      temp.add(newProduct);
    }

    products = temp;
    isLoading = false;
    notifyListeners();
  }

  ProductsModel fetchProductById(int id) {
    ProductsModel product =
        products.where((element) => element.id == id).toList()[0];
    return product;
  }

  void addFavorite(ProductsModel product) async {
    int indexofProduct = products.indexOf(product);
    products[indexofProduct].isFavorite = true;
    await LocalStorage.addFavorite(product.id!);
    notifyListeners();
  }

  void removeFavorite(ProductsModel product) async {
    int indexofProduct = products.indexOf(product);
    products[indexofProduct].isFavorite = false;
    await LocalStorage.removeFavorite(product.id!);
    notifyListeners();
  }
}
