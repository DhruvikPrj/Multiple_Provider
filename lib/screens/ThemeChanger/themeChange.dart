import 'package:flutter/material.dart';
import 'package:multiple_provider/provider/theme_change_provider.dart';
import 'package:provider/provider.dart';

class ThemeChanger extends StatelessWidget {
  const ThemeChanger({super.key});

  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Change Theme"),
        // actions: [
        //   Switch(
        //       value: true,
        //       onChanged: (val) {
        //         if (val == true) {
        //           val = false;
        //         }
        //       })
        // ],
      ),
      body: Center(
        child: Container(
          height: 200,
          width: 400,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.transparent),
          child: Column(
            children: [
              RadioListTile<ThemeMode>(
                title: const Text("Light"),
                value: ThemeMode.light,
                groupValue: themeChanger.themeMode,
                onChanged: themeChanger.setTheme,
              ),
              RadioListTile<ThemeMode>(
                title: const Text("Dark"),
                value: ThemeMode.dark,
                groupValue: themeChanger.themeMode,
                onChanged: themeChanger.setTheme,
              ),
              RadioListTile<ThemeMode>(
                title: const Text("System Theme"),
                value: ThemeMode.system,
                groupValue: themeChanger.themeMode,
                onChanged: themeChanger.setTheme,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
