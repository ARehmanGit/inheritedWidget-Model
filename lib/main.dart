import 'package:flutter/material.dart';
import 'package:inherited_widget_demo/inheritedwidget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyCounterWidget(child: MyHomePage()),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text("Inherited Widget Demo"),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            InheritedModel.inheritFrom<MyInheritedWidget>(context, aspect: 1)!
                .data!
                .countValue
                .toString(),
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
              child: ElevatedButton(
                  onPressed: () {
                    InheritedModel.inheritFrom<MyInheritedWidget>(context,
                            aspect: 2)!
                        .data!
                        .incrementCounter();
                  },
                  child: const Text(
                    "Increment",
                    style: TextStyle(fontSize: 24),
                  )))
        ],
      ),
    );
  }
}
