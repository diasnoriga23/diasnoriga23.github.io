import 'package:flutter/material.dart';
import 'package:portofolio/presentation/page/home_page.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portofolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Colors.transparent),
      ),
      builder:
          (context, child) => ResponsiveBreakpoints.builder(
            child: BouncingScrollWrapper.builder(context, child!),
            breakpoints: [
              const Breakpoint(start: 0, end: 550, name: PHONE),
              const Breakpoint(start: 551, end: 894, name: MOBILE),
              const Breakpoint(start: 895, end: 1350, name: TABLET),
              const Breakpoint(start: 1351, end: 1439, name: DESKTOP),
              const Breakpoint(start: 1440, end: double.infinity, name: '4K'),
            ],
          ),
      home: const HomePage(),
    );
  }
}
