import 'package:flutter/material.dart';

class ValueNotifierListener extends StatelessWidget {
  ValueNotifierListener({super.key});

  final ValueNotifier<int> _counter = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Value Notifier Listener"),
      ),
      body: Center(
          child: ValueListenableBuilder(
        valueListenable: _counter,
        builder: (context, value, child) {
          print("Only This Widgets Builds");
          return Text(
            _counter.value.toString(),
            style: TextStyle(
                color: Theme.of(context).primaryColorLight,
                fontSize: 25,
                fontWeight: FontWeight.bold),
          );
        },
      )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColorLight,
        onPressed: () {
          _counter.value++;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
