import 'package:flutter/material.dart';
import 'package:great_places/providers/great_places.dart';
import 'package:great_places/utils/app_routes.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meus Lugares'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.PLACE_FORM);
            },
          ),
        ],
      ),
      // No consumer o child é o que será mostrado se nao tiver nenhum item
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context, listen: false).loadPlaces(),
        builder: (ctx, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Consumer<GreatPlaces>(
                child: Center(
                  child: Text(
                    'Nenhum local adicionado',
                    style: TextStyle(
                      color: Colors.grey.withOpacity(0.75),
                      fontSize: 20,
                    ),
                  ),
                ),
                builder: (ctx, greatPlaces, child) => greatPlaces.itemsCount ==
                        0
                    ? child
                    : ListView.builder(
                        itemCount: greatPlaces.itemsCount,
                        itemBuilder: (ctx, index) => ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                FileImage(greatPlaces.itemByIndex(index).image),
                          ),
                          title: Text(greatPlaces.itemByIndex(index).title),
                          subtitle: Text(
                              greatPlaces.itemByIndex(index).location.address),
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              AppRoutes.PLACE_DETAIL,
                              arguments: greatPlaces.itemByIndex(index),
                            );
                          },
                        ),
                      ),
              ),
      ),
    );
  }
}
