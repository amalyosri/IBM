import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  @override
  final bool ismale;
  final int age;
  final double result;

  Result({this.ismale, this.age, this.result});

  String get resultphrase {
    String textresult = "";

    if (result >= 30)
      textresult = "obese";
    else if (result > 25 && result < 30)
      textresult = "overweight";
    else if (result >= 18.5 && result <= 24.9)
      textresult = "normal";
    else if (result >= 30) textresult = "obese";

    return textresult;
  }

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("result"),
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "result: ${result.toStringAsFixed(2)}",
              style: Theme.of(context).textTheme.headline2,
            ),
            Text(
              "age: $age ",
              style: Theme.of(context).textTheme.headline2,
            ),
            Text(
              "gender: ${ismale ? "male" : "female"}",
              style: Theme.of(context).textTheme.headline2,
            ),
            Text(
              "healthness: $resultphrase",
              style: Theme.of(context).textTheme.headline2,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      )),
    );
  }
}
