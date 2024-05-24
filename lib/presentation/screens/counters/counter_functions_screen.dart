import 'package:flutter/material.dart';

class CounterFunctionsScreen extends StatefulWidget {
  const CounterFunctionsScreen({super.key});

  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {
  int clickCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Counter Functions Screen')),
        actions: [
          IconButton(
            onPressed: () {
              clickCounter = 0;
              setState(() {});
            },
            icon: const Icon(Icons.refresh_rounded),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$clickCounter',
              style:
                  const TextStyle(fontSize: 160, fontWeight: FontWeight.w100),
            ),
            Text('Click${clickCounter == 1 ? '' : 's'}',
                style: const TextStyle(fontSize: 25)),
          ],
        ),
      ),
      floatingActionButton:
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        CustomButton(
          onPressed: () {
            setState(() {
              clickCounter = 0;
            });
          },
          icon: Icons.refresh_outlined,
        ),
        const SizedBox(height: 10),
        CustomButton(
          onPressed: () {
            setState(() {
              if (clickCounter > 1) clickCounter--;
            });
          },
          icon: Icons.exposure_minus_1_outlined,
        ),
        const SizedBox(height: 10),
        CustomButton(
          onPressed: () {
            setState(() {
              clickCounter++;
            });
          },
          icon: Icons.plus_one,
        ),
      ]),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const CustomButton({super.key, required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const StadiumBorder(),
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
