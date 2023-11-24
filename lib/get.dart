import 'package:flutter/material.dart';
import 'service/http.dart';
import 'model/product_model.dart';

class GET extends StatelessWidget {
  const GET({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("GET data")),
      body: FutureBuilder(
        future: Http.getProduct(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            List<Product> data = snapshot.data;

            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Icon(Icons.shopping_bag),
                  title: Text(data[index].name),
                  subtitle: Text(data[index].desc),
                  trailing: Text("₹ ${data[index].price}"),
                );
              },
            );
          }
        },
      ),
    );
  }
}
