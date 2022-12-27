import 'package:example/views/custom_grid.dart';
import 'package:example/views/custom_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_navigation/flutter_adaptive_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(
          secondary: Colors.red,
        ),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return FlutterAdaptiveNavigationScaffold(
      labelDisplayType: LabelDisplayType.all,
      appBar: AppBar(
        title: const Text('Adaptive Navigation'),
      ),
      drawerWidthFraction: 0.15,
      destinations: [
        NavigationElement(
          icon: const Icon(Icons.home_outlined),
          selectedIcon: const Icon(Icons.home),
          label: 'Home',
          builder: () => const CustomListView(
            count: 10,
            color: Colors.pinkAccent,
          ),
        ),
        NavigationElement(
          icon: const Icon(Icons.group),
          label: 'Group',
          builder: () => const CustomListView(
            count: 10,
            color: Colors.red,
          ),
          breakpointBasedBuilder: {
            Breakpoint.tablet: () => const CustomGridView(
                  count: 10,
                  color: Colors.blue,
                )
          },
        ),
        NavigationElement(
          icon: const Icon(Icons.settings),
          label: 'Settings',
          builder: () => const CustomListView(
            count: 10,
            color: Colors.amberAccent,
          ),
          breakpointBasedBuilder: {
            Breakpoint.desktop: () => const CustomGridView(
                  count: 10,
                  color: Colors.orange,
                )
          },
        ),
        NavigationElement(
          icon: const Icon(Icons.account_circle),
          label: 'Profile',
          builder: () => const CustomListView(
            count: 10,
            color: Colors.indigo,
          ),
        ),
      ],
    );
  }
}
