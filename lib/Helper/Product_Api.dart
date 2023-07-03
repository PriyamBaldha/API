import 'dart:convert';
import 'package:api/Model/Product.dart';
import 'package:http/http.dart' as http;



class ProductApi {
  // 1. create a private named constructor
  ProductApi._();

  //2. create an object with  the help of private named constructor
  static final ProductApi productApi =
  ProductApi._();

  final String baseURL = "https://fakestoreapi.com";
  final String endPoint = "/products/5";
  final String MULTI_DATA_ENDPOINT = "/products";

  // Future<Product?> fetchSinglePostData() async {
  //   http.Response res = await http.get(
  //     Uri.parse(baseURL + endPoint),
  //   );
  //
  //   if (res.statusCode == 200) {
  //     Map<String, dynamic> decodedData = jsonDecode(res.body);
  //
  //     Product post = Product.fromJSON(json: decodedData);
  //     return post;
  //   }
  //   return null;
  // }

  Future<List<Product>?> fetchMultiplePostData() async {
    http.Response res =
    await http.get(Uri.parse(baseURL + MULTI_DATA_ENDPOINT));

    if (res.statusCode == 200) {
      List decodedData = jsonDecode(res.body);

      List<Product> product = decodedData.map((e) => Product.fromJSON(json: e)).toList();

      return product;
    }
    return null;
  }
}
