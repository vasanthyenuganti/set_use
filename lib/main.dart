import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:set_use/providers/counter_provider.dart';
import 'package:set_use/providers/slider_provider.dart';

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
        ChangeNotifierProvider(create: (context) => SliderProvider()),
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Consumer<CounterProvider>(
              builder: (context, value, child) =>
                  Text("${value.count}", style: TextStyle(fontSize: 32)),
            ),
          ),
          Consumer<SliderProvider>(
            builder: (context, value, child) => Column(
              children: [
                Slider(
                  value: value.sliderValue,
                  min: 1,
                  max: 1000,
                  onChanged: value.onSlideChange,
                ),
                Text(
                  value.sliderValue.toStringAsFixed(2),
                  style: TextStyle(fontSize: 32),
                ),
                
              ],
            ),
          ),
        ],
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
