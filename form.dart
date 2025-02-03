import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;


class AppForm extends StatefulWidget {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController judulController, deskripsiController;
  final keteranganController;


  AppForm(
      {required this.formkey,
        required this.judulController,
        required this.deskripsiController,
        required this.keteranganController,
      });

  @override
  AppFormState createState() => AppFormState();
}

class AppFormState extends State<AppForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formkey,
      autovalidateMode: AutovalidateMode.always,
      child: SingleChildScrollView(
        child: Column(
          children: [
            judul(),
            deskripsi(),
            keterangan(),
          ],
        ),
      ),
    );
  }

  Widget judul() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
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
      child: TextFormField(
        controller: widget.judulController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: "Judul",
          prefixIcon: Icon(Icons.tab),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Masukan Judul';
          }
          return null;
        },
      ),
    );
  }

  Widget deskripsi() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
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
      child: TextFormField(
        controller: widget.deskripsiController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: "Pengarang",
          prefixIcon: Icon(Icons.person),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Masukkan Pengarang';
          }
          return null;
        },
      ),
    );
  }

  Widget keterangan() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
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
      child: TextFormField(
        controller: widget.keteranganController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: "Keterangan",
          prefixIcon: Icon(Icons.category),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Masukkan Keterangan!';
          }
          return null;
        },
      ),
    );
  }
}