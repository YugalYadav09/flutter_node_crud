import 'package:flutter/material.dart';
import 'delete.dart';
import 'update.dart';
import 'post.dart';
import 'get.dart';

void main() {
  runApp(const MaterialApp(
    title: "APP",
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const POST();
                      },
                    ),
                  );
                },
                child: const Text("POST")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const GET();
                    },
                  ));
                },
                child: const Text("GET")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const UPDATE();
                    },
                  ));
                },
                child: const Text("UPDATE")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const DELETE();
                    },
                  ));
                },
                child: const Text("DELETE"))
          ],
        ),
      ),
    );
  }
}
