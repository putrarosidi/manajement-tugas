import 'package:flutter/material.dart';
import 'dart:convert';

import 'api.dart';
import 'package:http/http.dart' as http;

class ProdukTambah extends StatefulWidget{
  const ProdukTambah({super.key});
  @override
  State<StatefulWidget> createState() => ProdukTambahState();
}

class ProdukTambahState extends State<ProdukTambah>{
  final formkey = GlobalKey<FormState>();
  TextEditingController judulController = new TextEditingController();
  TextEditingController deskripsiController = new TextEditingController();
  TextEditingController keteranganController = new TextEditingController();

  Future createSw() async {
    return await http.post(
        Uri.parse(BaseUrl.Insert),
        body: {
          'judul': judulController.text,
          'deskripsi': deskripsiController.text,
          'keterangan': keteranganController.text,
        }
    );
  }

  void _onConfirm(context) async {
    http.Response response = await createSw();
    final data = json.decode(response.body);
    if(data['success']) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tambah Data Pelajaran",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
        elevation: 4.0,
      ),
      body: Container(
        child: Column(
          children: [
            _judul(),
            _deskripsi(),
            _keterangan(),
            const SizedBox(height: 20.0),
            _tombolSimpan(),
          ],
        ),
      ),
    );
  }

  _judul(){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        decoration: const InputDecoration(
          labelText: "Judul",
          prefixIcon: Icon(Icons.tab),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
        ),
        controller: judulController,
      ),
    );
  }

  _deskripsi() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        decoration: const InputDecoration(
          labelText: "Deskripsi",
          prefixIcon: Icon(Icons.corporate_fare),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
        ),
        controller: deskripsiController,
      ),
    );
  }

  _keterangan() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        decoration: const InputDecoration(
          labelText: "Keterangan",
          prefixIcon: Icon(Icons.book),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
        ),
        controller: keteranganController,
      ),
    );
  }



  _tombolSimpan() {
    return ElevatedButton(
      onPressed: () {
        _onConfirm(context);
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, backgroundColor: Colors.cyan,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
        elevation: 5.0,
        shadowColor: Colors.grey.withOpacity(0.5),
      ),
      child: const Text(
        'Tambah',
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}