import 'package:epicesindiennes/pages/spiceDetail.dart';
import 'package:flutter/material.dart';

import '../database.dart';

class SpiceSearchDelegate extends SearchDelegate<IndianSpice?> {
  final List<IndianSpice> spices;

  SpiceSearchDelegate(this.spices);

  // Override the app bar's leading icon, e.g., back button
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null); // Close the search delegate
      },
    );
  }

  // Override the search results based on the query
  @override
  Widget buildResults(BuildContext context) {
    final List<IndianSpice> results = spices
        .where((spice) =>
        spice.name.toLowerCase().contains(query.toLowerCase())) // Match based on query
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final spice = results[index];
        return ListTile(
          title: Text(spice.name),
          subtitle: Text(spice.description),
          leading: Image.asset(spice.image, width: 50, fit: BoxFit.cover),
          onTap: () {
            // close(context, spice); // Close search and return selected item
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SpiceDetail(id: spice.id)),
            );
          },
        );
      },
    );
  }

  // Override to show suggestions as the user types
  @override
  Widget buildSuggestions(BuildContext context) {
    final List<IndianSpice> suggestions = spices
        .where((spice) =>
        spice.name.toLowerCase().startsWith(query.toLowerCase())) // Start matching based on query
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final spice = suggestions[index];
        return ListTile(
          title: Text(spice.name),
          leading: Image.asset(spice.image, width: 50, fit: BoxFit.cover),
          onTap: () {
            query = spice.name;
            showResults(context); // Show full results
          },
        );
      },
    );
  }

  // Override the app bar actions, such as clearing the search query
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            query = '';
            showSuggestions(context); // Show suggestions if query is cleared
          },
        ),
    ];
  }
}
