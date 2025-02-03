import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'api.dart';
import 'package:http/http.dart' as http;
import 'mitems.dart';
import 'form.dart';

class ProdukEdit extends StatefulWidget {
  final ItemModel sw;

  ProdukEdit({required this.sw});

  @override
  State<StatefulWidget> createState() => ProdukEditState();
}

class ProdukEditState extends State<ProdukEdit> {
  final formkey = GlobalKey<FormState>();
  late TextEditingController judulController, deskripsiController, keteranganController;

  Future editSw() async {
    return await http.post(
      Uri.parse(BaseUrl.Edit),
      body: {
        "id": widget.sw.id.toString(),
        "judul": judulController.text,
        "deskripsi": deskripsiController.text,
        "keterangan": keteranganController.text,
      },
    );
  }

  pesan() {
    Fluttertoast.showToast(
      msg: "Perubahan data berhasil",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  void _onConfirm(context) async {
    http.Response response = await editSw();
    final data = json.decode(response.body);
    if (data['success']) {
      pesan();
      Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
    }
  }

  @override
  void initState() {
    judulController = TextEditingController(text: widget.sw.judul);
    deskripsiController = TextEditingController(text: widget.sw.deskripsi);
    keteranganController = TextEditingController(text: widget.sw.keterangan);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Edit Produk",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        elevation: 4.0,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: ElevatedButton(
          onPressed: () {
            _onConfirm(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepOrange,
            padding: EdgeInsets.symmetric(vertical: 15.0),
            textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
          child: Text("Update", style: TextStyle(color: Colors.white)),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppForm(
                formkey: formkey,
                judulController: judulController,
                deskripsiController: deskripsiController,
                keteranganController: keteranganController,
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  "Pastikan data yang dimasukkan sudah benar.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}