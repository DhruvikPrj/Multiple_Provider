import 'package:flutter/material.dart';
import 'package:multiple_provider/provider/favourite_provider.dart';
import 'package:multiple_provider/screens/favourite/myFavourite.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    //final favouriteprovider = Provider.of<FavouriteProvider>(context);

    print("All widgets Builds");
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Favourite App",
            style: TextStyle(
                color: Colors.deepPurpleAccent, fontWeight: FontWeight.w700),
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyFavourite(),
                  ));
            },
            child: Icon(
              Icons.favorite,
              color: Colors.red[900],
            ),
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: Consumer<FavouriteProvider>(builder: (context, value, child) {
        print("only this Widget");
        return ListView.builder(
          itemCount: 50,
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
