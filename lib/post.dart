import 'service/http.dart';
import 'package:flutter/material.dart';

class POST extends StatefulWidget {
  const POST({super.key});

  @override
  State<POST> createState() => _POSTState();
}

TextEditingController name = TextEditingController();
TextEditingController price = TextEditingController();
TextEditingController desc = TextEditingController();

class _POSTState extends State<POST> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("POST data")),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: name,
                decoration: const InputDecoration(label: Text("Product-name")),
              ),
              const SizedBox(
                height: 50,
              ),
              TextField(
                controller: price,
                decoration: const InputDecoration(label: Text("Product-price")),
              ),
              const SizedBox(
                height: 50,
              ),
              TextField(
                controller: desc,
                decoration: const InputDecoration(label: Text("Product-desc")),
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  onPressed: () async {
                    var data = {
                      "name": name.text,
                      "price": price.text,
                      "desc": desc.text
                    };
                    await Http.postProduct(data);
                    name.clear();
                    price.clear();
                    desc.clear();
                  },
                  child: const Text("POST"))
            ],
          ),
        ),
      ),
    );
  }
}
