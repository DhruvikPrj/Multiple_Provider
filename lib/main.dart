import 'package:flutter/material.dart';
import 'package:multiple_provider/provider/favourite_provider.dart';
import 'package:multiple_provider/provider/login_auth_provider.dart';
import 'package:multiple_provider/provider/slidervalprovider.dart';
import 'package:multiple_provider/provider/theme_change_provider.dart';
import 'package:multiple_provider/screens/Login_with_Provider/login.dart';
//import 'package:multiple_provider/screens/ThemeChanger/themeChange.dart';
//import 'package:multiple_provider/screens/Value_NotifierListener/count_example.dart';
import 'package:multiple_provider/screens/Value_NotifierListener/text-visibility.dart';
//import 'package:multiple_provider/screens/sliderWithContainers/sliderScreen.dart';
//import 'package:multiple_provider/screens/favourite/favouriteScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

// this is comment

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => SliderValueProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => FavouriteProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => ThemeProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => AuthProvider(),
          ),
        ],
        child: Builder(
          builder: (BuildContext context) {
            final themeChanger = Provider.of<ThemeProvider>(context);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              themeMode: themeChanger.themeMode,
              theme: ThemeData(
                brightness: Brightness.light,
                //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                appBarTheme: AppBarTheme(
                    backgroundColor: Theme.of(context).primaryColorLight),
                //primarySwatch: Colors.deepOrange,
              ),
              darkTheme: ThemeData(
                brightness: Brightness.dark,
                //primarySwatch: Colors.blue,
                appBarTheme: AppBarTheme(
                    backgroundColor: Theme.of(context).primaryColorDark),
              ),
              home: //const ThemeChanger(),
                  //ValueNotifierListener(),
                  //TextVisibility(),
                  const LoginScreen(),
            );
          },
        ));
  }
}
