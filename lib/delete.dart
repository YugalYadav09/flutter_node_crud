import 'package:flutter/material.dart';
import 'service/http.dart';
import 'model/product_model.dart';

class DELETE extends StatelessWidget {
  const DELETE({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("DELETE data")),
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
                  leading: Text(
                    data[index].name,
                    style: TextStyle(color: Colors.red, fontSize: 25),
                  ),
                  title: Text(data[index].desc),
                  subtitle: Text("₹ ${data[index].price}"),
                  trailing: IconButton(
                      onPressed: () async {
                        await Http.deleteProduct(data[index].name, context);
                      },
                      icon: Icon(Icons.delete_forever)),
                );
              },
            );
          }
        },
      ),
    );
  }
}
