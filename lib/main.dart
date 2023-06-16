import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text(
            "Chess UI",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          )),
      body: ListView.builder(
        itemCount: 8,
        itemBuilder: (BuildContext context, int parentIndex) {
          return Center(
            child: SizedBox(
              height: 40,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 8,
                itemBuilder: (BuildContext context, int index) {
                  int change = parentIndex.isEven ? 1 : 0;
                  return (index + change).isEven
                      ? UnconstrainedBox(child: chessBox(white: true))
                      : UnconstrainedBox(
                          child: chessBox(white: false),
                        );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget chessBox({bool white = false}) {
  return Container(
    height: 40,
    width: 40,
    color: white ? Colors.yellow : Colors.black,
  );
}
