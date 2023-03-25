// ignore_for_file: prefer_const_constructors, sort_child_properties_last, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:quotes_app/Wedgitd/Card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuotesApp(),
    );
  }
}

class QuotesApp extends StatefulWidget {
  const QuotesApp({super.key});

  @override
  State<QuotesApp> createState() => _QuotesAppState();
}

class BestQuotes {
  String title;
  String author;

  BestQuotes({required this.title, required this.author});
}

class _QuotesAppState extends State<QuotesApp> {
  List AllQuotes = [
    BestQuotes(
        author: "Mohamed Elhady",
        title: "كـــــــــلــــــه رايـــــــــــــح"),
    BestQuotes(
        author: "Mohamed Elhady",
        title: "كـــــــــلــــــه رايـــــــــــــح"),
    BestQuotes(
        author: "Mohamed Elhady",
        title: "كـــــــــلــــــه رايـــــــــــــح"),
    BestQuotes(
        author: "Mohamed Elhady",
        title: "كـــــــــلــــــه رايـــــــــــــح"),
    BestQuotes(
        author: " Mohamed Elhady",
        title: " كـــــــــلــــــه رايـــــــــــــح"),
    BestQuotes(
        author: "Mohamed Elhady",
        title: "كـــــــــلــــــه رايـــــــــــــح"),
  ];

   delete(BestQuotes item){
setState(() {
  AllQuotes.remove(item);
});

   }
 addNewQuote() {
    setState(() {
      AllQuotes.add(
        BestQuotes(author: myController2.text, title: myController.text),
      );
    });
  }
final myController = TextEditingController();
  final myController2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(
          "Quotes",
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800]),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...AllQuotes.map((item) => QuoteCard(
                  item: item,
                  delete: delete,
                )).toList(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () { showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Padding(
                  padding: const EdgeInsets.all(22),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: myController,
                        decoration: InputDecoration(hintText: "Add new quote"),
                        maxLength: 20,
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      TextField(
                        controller: myController2,
                        decoration: InputDecoration(hintText: "Add author"),
                        maxLength: 20,
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            addNewQuote();
                          },
                          child: Text(
                            "ADD",
                            style: TextStyle(fontSize: 22),
                          ))
                    ],
                  ),
                );
              },
              isScrollControlled: true);
        },
        child: Icon(
          Icons.add,
          color: Colors.grey[800],
        ),
        backgroundColor: Colors.grey,
      ),
    );
  }
}
