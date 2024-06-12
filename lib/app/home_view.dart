import 'package:flutter/material.dart';
import 'package:flutter_task3/app/calculator_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[700],
      body: SafeArea(
        child: CalculatorView(),
      ),
    );
  }
}
