import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:set_use/providers/counter_provider.dart';
import 'package:set_use/providers/slider_provider.dart';
import 'package:set_use/providers/theme_provider.dart';

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
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, value, child) => MaterialApp(
        title: "Providers",
        initialRoute: "/",
        routes: {
          "/": (context) => MyHome(),
          "/counter": (context) => MyCounter(),
        },
        themeMode: value.theme,
        theme: ThemeData(brightness: Brightness.light),
        darkTheme: ThemeData(brightness: Brightness.dark),
        themeAnimationCurve: Curves.easeInOutCubic,
      ),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, "/counter");
            },
            child: Text("Counter"),
          ),
        ],
      ),
    );
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
          Consumer<ThemeProvider>(
            builder: (context, value, child) => SwitchListTile(
              title: Text("Dark Mode"),
              value: value.theme == ThemeMode.dark,
              onChanged: (val) {
                value.themeOnChange(val);
              },
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