import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ibm/result.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool ismale = true;
  int weight = 55;
  int age = 18;
  double heightval = 170.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("home"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    newMethod(context, "male"),
                    const SizedBox(
                      width: 15,
                    ),
                    newMethod(context, "female"),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.pink[100],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "height:",
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            heightval.toStringAsFixed(1),
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          Text(
                            "cM",
                            style: Theme.of(context).textTheme.bodyText1,
                          )
                        ],
                      ),
                      Slider(
                          value: heightval,
                          min: 90,
                          max: 220,
                          onChanged: (val) => setState(() => heightval = val)),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    new1Method(context, "age"),
                    const SizedBox(
                      width: 15,
                    ),
                    new1Method(context, "weight"),
                  ],
                ),
              ),
            ),
            Container(
                color: Colors.teal,
                height: MediaQuery.of(context).size.height / 16,
                width: double.infinity,
                child: TextButton(
                    onPressed: () {
                      var result = weight / pow(heightval / 100, 2);
                      (Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Result(
                              ismale: ismale, age: age, result: result))));
                    },
                    child: Text(
                      "calculator",
                      style: Theme.of(context).textTheme.headline2,
                    )))
          ],
        ),
      ),
    );
  }

  Expanded newMethod(BuildContext context, type) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            ismale = (type == "male") ? true : false;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: (ismale && type == "male") || (!ismale && type == "female")
                ? Colors.blue
                : Colors.pink,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                type == "male" ? Icons.male : Icons.female,
                size: 90,
              ),
              Text(
                type == "male" ? "male" : "female",
                style: Theme.of(context).textTheme.headline1,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded new1Method(BuildContext context, type) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.pink[100],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              type == "age" ? "age" : "weight",
              style: Theme.of(context).textTheme.headline1,
            ),
            Text(
              type == "age" ? "$age" : "$weight",
              style: Theme.of(context).textTheme.headline2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  backgroundColor: Colors.blue[100],
                  heroTag: type == "age" ? "age--" : "weight--",
                  onPressed: () {
                    setState(() {
                      if (age != 0 && type == "age") {
                        age--;
                      } else if (weight != 0 && type == "weight") {
                        weight--;
                      }
                      //(age != 0 && type == "age") ? age-- : weight--;
                    });
                  },
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(
                  width: 15,
                ),
                FloatingActionButton(
                  backgroundColor: Colors.blue[100],
                  heroTag: type == "age" ? "age++" : "weight++",
                  onPressed: () {
                    setState(() {
                      (type == "age") ? age++ : weight++;
                    });
                  },
                  child: const Icon(Icons.add),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
