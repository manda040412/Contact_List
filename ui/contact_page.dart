import 'package:flutter/material.dart';
import 'contact_form.dart';
import 'contact_detail.dart';
import 'list_contact.dart';
import 'contact_search.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  List<Map<String, dynamic>> contactList = [
    {'nama': "Manda", 'nomor': 895613483872},
    {'nama': "Jiun", 'nomor': 891929394506},
    {'nama': "Jewu", 'nomor': 983582595930},
  ];

  List<Map<String, dynamic>> filteredContactList = [];

  @override
  void initState() {
    filteredContactList = contactList;
    super.initState();
  }

  void tambahContact(Map<String, dynamic> dataContact) {
    setState(() {
      contactList.add(dataContact);
      filteredContactList = contactList;
    });
  }

  void hapusContact(int? nomor) {
    setState(() {
      contactList.removeWhere((contact) => contact['nomor'] == nomor);
      filteredContactList = contactList;
    });
  }

  void filterContacts(String query) {
    setState(() {
      filteredContactList = contactList.where((contact) {
        final nama = contact['nama'].toString().toLowerCase();
        return nama.contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact List"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ContactForm(tambahContact: tambahContact),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onChanged: filterContacts,
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color.fromARGB(255, 14, 147, 255), Color.fromARGB(255, 110, 255, 255)],
                ),
              ),
              child: ListView.separated(
                itemCount: filteredContactList.length,
                separatorBuilder: (BuildContext context, int index) => const Divider(),
                itemBuilder: (context, index) {
                  return ListContact(
                    nama: filteredContactList[index]['nama'],
                    nomor: filteredContactList[index]['nomor'],
                    onDelete: () => hapusContact(filteredContactList[index]['nomor']),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
