import 'dart:convert';
import 'dart:developer';

import '/delete.dart';
import '/model/product_model.dart';
import '/post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Http {
  static String url = "http://localhost:3000/api/";

  static postProduct(Map pdata) async {
    try {
      final res = await http.post(Uri.parse("${url}add_product"), body: pdata);

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body.toString());
        print(data);
      } else {
        print("Failed to load data");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  static getProduct() async {
    List<Product> product = [];
    try {
      final res = await http.get(Uri.parse("${url}get_product"));

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);

        data['product'].forEach((value) => {
              product.add(
                Product(
                  value['name'],
                  value['price'],
                  value['desc'],
                ),
              )
            });
        return product;
      } else {
        return [];
      }
    } catch (e) {
      log(e.toString());
    }
  }

  static deleteProduct(String name, BuildContext context) async {
    try {
      final res = await http.delete(Uri.parse("${url}delete_product/$name"));

      if (res.statusCode == 200) {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return const DELETE();
          },
        ));
      } else {
        log("Failed to load data");
      }
    } catch (e) {
      log(e.toString());
    }
  }

  static updateProduct(Product updatedProduct) async {
    try {
      final response = await http.put(
        Uri.parse("${url}update_product/${updatedProduct.name}"),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(updatedProduct.toJson()),
      );

      if (response.statusCode == 200) {
        print('Product updated successfully');
      } else if (response.statusCode == 404) {
        print('Product not found');
      } else {
        print('Failed to update product. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
