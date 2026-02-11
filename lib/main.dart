import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:set_use/providers/counter_provider.dart';

void main() {
  runApp(MyCore());
}

class MyCore extends StatelessWidget {
  const MyCore({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CounterProvider()),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyCounter());
  }
}

class MyCounter extends StatelessWidget {
  const MyCounter({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("build is called ");
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Consumer<CounterProvider>(
          builder: (context, value, child) =>
              Text("${value.count}", style: TextStyle(fontSize: 32)),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CounterProvider>().increment();
        },
      ),
    );
  }
}

// change notifier provider --
// multi provider
