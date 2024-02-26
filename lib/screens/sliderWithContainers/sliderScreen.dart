import 'package:flutter/material.dart';
import 'package:multiple_provider/provider/slidervalprovider.dart';
import 'package:provider/provider.dart';

class SliderScreen extends StatefulWidget {
  SliderScreen({super.key});

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  @override
  Widget build(BuildContext context) {
    // final countProvider =
    //     Provider.of<SliderValueProvider>(context, listen: false);

    print("All Widgets Build");
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<SliderValueProvider>(
            builder: (context, value, child) => Slider(
                min: 0,
                max: 1,
                value: value.sliderValue,
                onChanged: (val) => value.setValue(val)),
          ),
          Consumer<SliderValueProvider>(builder: (context, value, child) {
            print("Ony This Widgets Builds");
            return Row(
              children: [
                Expanded(
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(value.sliderValue),
                    ),
                    child: const Center(
                      child: Text("Container 1"),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.withOpacity(value.sliderValue),
                    ),
                    child: const Center(
                      child: Text("Container 2"),
                    ),
                  ),
                )
              ],
            );
          })
        ],
      ),
    );
  }
}
