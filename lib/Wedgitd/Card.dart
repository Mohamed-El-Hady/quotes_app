// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../main.dart';

class QuoteCard extends StatelessWidget {
  final BestQuotes item;
  final Function delete;
  const QuoteCard({Key? key, required this.item, required this.delete})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: Color.fromARGB(255, 130, 146, 169),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                item.title,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[300]),
                textDirection: TextDirection.rtl,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        delete(item);
                      },
                      // ignore: prefer_const_constructors
                      icon: Icon(
                        Icons.delete,
                        color: Color.fromARGB(255, 240, 153, 147),
                        size: 30,
                      )),
                  Text(
                    item.author,
                    style: TextStyle(fontSize: 20, color: Colors.grey[800]),
                    // textDirection: TextDirection.rtl,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
