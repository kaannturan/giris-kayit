import "package:flutter/material.dart";
import "package:yasam_beklen/view/register/register_view.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Register(),
    );
  }
}
