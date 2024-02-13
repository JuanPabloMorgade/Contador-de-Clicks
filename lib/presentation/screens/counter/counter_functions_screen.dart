import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
          title: const Text('Función de Contador de Clicks'),
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh_rounded),
              onPressed: () {
                setState(() {
                  clickCounter = 0;
                });
              },
            ),
          ],
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$clickCounter',
                  style: const TextStyle(
                      fontSize: 160, fontWeight: FontWeight.w100)),
              Text('Click${clickCounter == 1 ? '' : 's'}',
                  style: const TextStyle(fontSize: 25))
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButton(
              icon: Icons.refresh_outlined,
              onPress: () {
                HapticFeedback.lightImpact();
                setState(() {
                  clickCounter = 0;
                });
              },
            ),
            const SizedBox(height: 20),
            CustomButton(
              icon: Icons.plus_one_outlined,
              onPress: () {
                HapticFeedback.selectionClick();
                setState(() {
                  clickCounter++;
                });
              },
            ),
            const SizedBox(height: 20),
            CustomButton(
              icon: Icons.exposure_minus_1,
              onPress: () {
                HapticFeedback.vibrate();
                setState(() {
                  if (clickCounter > 0) clickCounter--;
                });
              },
            ),
          ],
        ));
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPress;

  const CustomButton({
    super.key,
    required this.icon,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const StadiumBorder(),
      onPressed: onPress,
      child: Icon(icon),
    );
  }
}
