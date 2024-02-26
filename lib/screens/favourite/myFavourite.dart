import 'package:flutter/material.dart';
import 'package:multiple_provider/provider/favourite_provider.dart';
import 'package:provider/provider.dart';

class MyFavourite extends StatelessWidget {
  const MyFavourite({super.key});

  @override
  Widget build(BuildContext context) {
    final favouriteProvider = Provider.of<FavouriteProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "My Favourites",
          style: TextStyle(
              color: Colors.deepPurpleAccent, fontWeight: FontWeight.w700),
        ),
      ),
      body: Consumer<FavouriteProvider>(builder: (context, value, child) {
        print("only this Widget");
        return ListView.builder(
          itemCount: favouriteProvider.selectedItems.length,
          itemBuilder: (context, index) => ListTile(
            onTap: () {
              if (value.selectedItems.contains(index)) {
                value.removeItem(index);
              } else {
                value.addItem(index);
              }

              // setState(() {});
            },
            leading: Text(
              "Item No $index",
            ),
            trailing: Icon(
              value.selectedItems.contains(index)
                  ? Icons.favorite
                  : Icons.favorite_outline_rounded,
              color: Colors.red[900],
              size: 25,
            ),
          ),
        );
      }),
    );
  }
}
