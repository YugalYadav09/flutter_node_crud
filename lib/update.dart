import 'package:flutter/material.dart';
import 'service/http.dart';
import 'model/product_model.dart';

class UPDATE extends StatelessWidget {
  const UPDATE({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("UPDATE data")),
      body: FutureBuilder(
        future: Http.getProduct(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            List<Product> data = snapshot.data;

            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return UPDATEPOST(itemName: data[index].name);
                      },
                    ));
                  },
                  child: ListTile(
                    leading: const Icon(Icons.shopping_bag),
                    title: Text(data[index].name),
                    subtitle: Text(data[index].desc),
                    trailing: Text("₹ ${data[index].price}"),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

class UPDATEPOST extends StatefulWidget {
  final String itemName;
  const UPDATEPOST({super.key, required this.itemName});

  @override
  State<UPDATEPOST> createState() => _POSTState();
}

TextEditingController editName = TextEditingController();
TextEditingController editPrice = TextEditingController();
TextEditingController editDesc = TextEditingController();

class _POSTState extends State<UPDATEPOST> {
  @override
  void initState() {
    editName.text = widget.itemName;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("UPDATE ONLINE")),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: editName,
                decoration: const InputDecoration(label: Text("Product-name")),
              ),
              const SizedBox(
                height: 50,
              ),
              TextField(
                controller: editPrice,
                decoration: const InputDecoration(label: Text("Product-price")),
              ),
              const SizedBox(
                height: 50,
              ),
              TextField(
                controller: editDesc,
                decoration: const InputDecoration(label: Text("Product-desc")),
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  onPressed: () async {
                    var data =
                        Product(editName.text, editPrice.text, editDesc.text);
                    await Http.updateProduct(data);
                  },
                  child: const Text("POST"))
            ],
          ),
        ),
      ),
    );
  }
}
