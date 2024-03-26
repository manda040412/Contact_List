import 'package:flutter/material.dart';
import 'contact_detail.dart';

class ListContact extends StatelessWidget {
  final String? nama;
  final int? nomor;
  final Function()? onDelete;

  const ListContact({
    Key? key,
    this.nama,
    this.nomor,
    this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(nomor.toString()),
        subtitle: Text(nama.toString()),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: onDelete,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ContactDetail(
                nama: nama,
                nomor: nomor,
              ),
            ),
          );
        },
      ),
    );
  }
}
