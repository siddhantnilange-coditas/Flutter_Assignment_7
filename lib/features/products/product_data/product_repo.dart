// import 'dart:math';
import 'package:fakestore_api/features/products/product_data/product_data_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer';


class ProductRepositories {
  static Future<List<ProductModel>> fetchProducts(String category) async {
    var client = http.Client();
    var response;
    try {
      if(category == 'All'){
        response = await client.get(Uri.parse('https://fakestoreapi.com/products'));

      }
      else{
        response = await client.get(Uri.parse('https://fakestoreapi.com/products/category/$category'));

      }
      if (response.statusCode == 200) {
        List<dynamic> productsJson = jsonDecode(response.body);
        List<ProductModel> products = productsJson.map((json) => ProductModel.fromJson(json)).toList();
        return products;
      } else {
        log('Failed to fetch products: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      log('Error fetching products: $e');
      return [];
    } finally {
      client.close();
    }
  }
}
// class ProductRepositeries{

//   static Future<List<String>> fetchProducts() async {
//     var client = http.Client();
//     try {
//       var response = await client.get(Uri.parse('https://fakestoreapi.com/products/categories'));
//       if (response.statusCode == 200) {
//         List<dynamic> categories = jsonDecode(response.body);
//         // Assuming categories are already strings, no need to convert them
//         return List<String>.from(categories);
//       } else {
//         log('Failed to fetch categories: ${response.statusCode}');
//         return [];
//       }
//     } catch (e) {
//       log('Error fetching categories: $e');
//       return [];
//     } finally {
//       client.close(); 
//     }
//   }
// }






//   static Future<List<String>> fetchPost() async{
//      var client = http.Client();
//     List<String> posts=[];
//     try {
//       var response = await client.get(
//           Uri.parse('https://fakestoreapi.com/products/categories'),
//       );
//       List result = jsonDecode(response.body);
//       print(result);
//       List<dynamic> result = jsonDecode(response.body);
// // print(result);
//       for(int counter = 0; counter<result.length; counter++){
//         List<String> post = 
//         List<String>.fromMap(result[counter] as Map<String, dynamic>);
//         posts.add(post);
//       }
//       print(posts);
//       return [];
//       // return posts;
//   }
//   catch(e){
//     log(e.toString());
//     return [];
//   }
//   }

//     static Future<bool> addPost() async{
//      var client = http.Client();
//     List<PostDataUiModel> posts=[];
//     try {
//       var response = await client.post(
//           Uri.parse('https://jsonplaceholder.typicode.com/posts/'),
//           body: {
//             "title" : "Sidd",
//             "body": "Sidd make",
//             "userId": 10,
//           }
//       );

//       if(response.statusCode>=200 && response.statusCode<=300){
//         return true;
//       }
//       else{
//         return false;
//       }

    
//   }

  
//     catch(e){
//     log(e.toString());
//     return false;
//   }
// }
// }