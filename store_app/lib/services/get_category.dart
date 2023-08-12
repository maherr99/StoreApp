import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class GetCategory {
  Future<List<ProductModal>> getCategory({required String categoryname}) async {
    List<dynamic> data = await Api()
        .get(url: 'https://fakestoreapi.com/products/category/$categoryname');

    List<ProductModal> ProductList = [];
    for (var i = 0; i < data.length; i++) {
      ProductList.add(ProductModal.fromJson(data[i]));
    }

    return ProductList;
  }
}
