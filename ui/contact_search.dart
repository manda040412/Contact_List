import 'package:flutter/material.dart';

class ContactSearch extends SearchDelegate<String> {
  final List<Map<String, dynamic>> contacts;
  final Function(String) filterContacts;

  ContactSearch(this.contacts, this.filterContacts);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildSuggestions(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? contacts
        : contacts.where((contact) {
            final nama = contact['nama'].toString().toLowerCase();
            return nama.contains(query.toLowerCase());
          }).toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestionList[index]['nama'].toString()),
          subtitle: Text(suggestionList[index]['nomor'].toString()),
          onTap: () {
            filterContacts(query);
            close(context, '');
          },
        );
      },
    );
  }
}
