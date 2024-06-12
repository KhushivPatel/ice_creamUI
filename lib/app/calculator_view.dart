import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  int x = 0;
  int y = 0;
  num z = 0;
  late final AppLifecycleListener _listener;

  final displayOneController = TextEditingController();
  final displayTwoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    displayOneController.text = x.toString();
    displayTwoController.text = y.toString();
    _listener = AppLifecycleListener(
      onShow: _onShow,
      onHide: _onHide,
      onResume: _onResume,
      onDetach: _onDetach,
      onInactive: _onInactive,
      onPause: _onPause,
      onRestart: _onRestart,
      onStateChange: _onStateChange,
    );
  }

  void _onShow() => print("onshow called");
  void _onHide() => print("onhide called");
  void _onResume() => print("onresume called");
  void _onDetach() => print("ondetach called");
  void _onInactive() => print("oninactive called");
  void _onPause() => print("onpause called");
  void _onRestart() => print("onrestart called");
  void _onStateChange(AppLifecycleState State) =>
      print("onstatechange is called: $State");

  @override
  // which resurses you want to clear
  void dispose() {
    displayOneController.dispose();
    displayTwoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          // display
          CalculatorDisplay(
            hint: "Enter the first number",
            controller: displayOneController,
          ),
          const SizedBox(
            height: 30,
          ),
          CalculatorDisplay(
            hint: "Enter the second number",
            controller: displayTwoController,
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            z.toString(),
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const Spacer(),
          Row(
            // style
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    x = int.tryParse(displayOneController.text) ?? 0;
                    y = int.tryParse(displayTwoController.text) ?? 0;
                    z = x + y;
                  });
                },
                child: const Icon(Icons.add),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    x = int.tryParse(displayOneController.text) ?? 0;
                    y = int.tryParse(displayTwoController.text) ?? 0;
                    z = x - y;
                  });
                },
                child: const Icon(CupertinoIcons.minus),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    x = int.tryParse(displayOneController.text) ?? 0;
                    y = int.tryParse(displayTwoController.text) ?? 0;
                    z = x * y;
                  });
                },
                child: const Icon(CupertinoIcons.multiply),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    x = int.tryParse(displayOneController.text) ?? 0;
                    y = int.tryParse(displayTwoController.text) ?? 0;
                    z = y != 0 ? x / y : 0;
                  });
                },
                child: const Icon(CupertinoIcons.divide),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                x = 0;
                y = 0;
                z = 0;
                displayOneController.clear();
                displayTwoController.clear();
              });
            },
            child: const Icon(CupertinoIcons.delete),
          ),
        ],
      ),
    );
  }
}

class CalculatorDisplay extends StatelessWidget {
  const CalculatorDisplay({
    Key? key,
    this.hint = "Enter a Number",
    required this.controller,
  }) : super(key: key);

  final String hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      autofocus: true,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
            width: 4.0,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
            width: 4.0,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white),
      ),
      style: const TextStyle(color: Colors.white),
    );
  }
}
