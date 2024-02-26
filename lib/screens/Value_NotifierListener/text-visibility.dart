import 'package:flutter/material.dart';

class TextVisibility extends StatelessWidget {
  TextVisibility({super.key});

  final ValueNotifier<bool> toggle = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Value Notifier Listener"),
      ),
      body: Center(
          child: ValueListenableBuilder(
        valueListenable: toggle,
        builder: (context, value, child) {
          print("Only This Widgets Builds");
          return TextFormField(
            obscureText: toggle.value,
            decoration: InputDecoration(
                label: Text("Enter Password"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                suffix: GestureDetector(
                    onTap: () {
                      toggle.value = !toggle.value;
                    },
                    child: Icon(toggle.value
                        ? Icons.visibility_off_rounded
                        : Icons.visibility))),
          );
        },
      )),
    );
  }
}
