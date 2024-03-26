import 'package:flutter/material.dart'; 

class ContactForm extends StatefulWidget {
  final Function tambahContact;
  const ContactForm({Key? key, required this.tambahContact}) : super(key: key);

  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _namaTextboxController = TextEditingController();
  final _nomorTextboxController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Contact'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _textboxNama(),
            _textboxNomor(),
            _tombolSimpan(), // Include the "Simpan" button
          ],
        ),
      ),
    );
  }

  Widget _textboxNama() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nama"),
      controller: _namaTextboxController,
    );
  }

  Widget _textboxNomor() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nomor Telepon"),
      controller: _nomorTextboxController,
    );
  }

  Widget _tombolSimpan() {
    return ElevatedButton(
      onPressed: () {
        Map<String, dynamic> dataContact = {
          'nama': _namaTextboxController.text,
          'nomor': int.parse(_nomorTextboxController.text),
        };

        widget.tambahContact(dataContact);

        Navigator.pop(context); // Return to the previous page after adding data
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.blue, // Set background color to blue
        onPrimary: Colors.white, // Set text color to white
      ),
      child: const Text('Save'),
    );
  }
}
