import 'package:flutter/material.dart';
import 'package:mapas_gps_flutter/models/search_result.dart';

class SearchDestination extends SearchDelegate<SearchResult> {
  @override
  final String searchFieldLabel;
  SearchDestination() : this.searchFieldLabel = 'Buscar';
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(icon: Icon(Icons.clear), onPressed: () => this.query = '')
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    //TODO: retornar algo
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => this.close(context, SearchResult(cancelo: true)),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text('Build Results');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Icon(Icons.location_on),
          title: Text(
            'Colocar dirección manualmente',
            style: TextStyle(fontSize: 13),
          ),
          onTap: () {
            // TODO: retornar algo
            print('manualmente');
            this.close(context, SearchResult(cancelo: false, manual: true));
          },
        )
      ],
    );
  }
}
