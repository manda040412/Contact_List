import 'package:flutter/material.dart'; 

class ContactDetail extends StatefulWidget {
  final String? nama;
  final int? nomor;

  const ContactDetail({
    Key? key, 
    this.nama, 
    this.nomor
  }) : super(key: key);

  @override
  _ContactDetailState createState() => _ContactDetailState();
}

class _ContactDetailState extends State<ContactDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildDetailTile("Nama :", widget.nama),
            _buildDetailTile("Nomor Telepon :", widget.nomor.toString()),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailTile(String title, String? subtitle) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle ?? '-'),
    );
  }
}
