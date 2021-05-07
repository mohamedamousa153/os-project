import 'package:flutter/material.dart';
import 'package:heritage/routes/app_pages.dart';
import 'package:heritage/utilities/app_ui.dart';

void main() {
  runApp(Heritage());
}

class Heritage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => SafeArea(child: child),
      debugShowCheckedModeBanner: false,
      theme: AppUi.theme,
      initialRoute: AppPages.initialRoute,
      routes: AppPages.routes,
    );
  }
}
