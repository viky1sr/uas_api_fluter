import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:karyawan/model/model.dart';

class CreateNewDataPages extends StatefulWidget {
  CreateNewDataPages({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _CreateNewDataPagesState createState() => _CreateNewDataPagesState();
}

class _CreateNewDataPagesState extends State<CreateNewDataPages> {
  final TextEditingController _controllerNik = TextEditingController();
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerJk = TextEditingController();
  final TextEditingController _controllerTl = TextEditingController();
  final TextEditingController _controllerPendidikan = TextEditingController();
  final TextEditingController _controllerDepartement = TextEditingController();
  final TextEditingController _controllerJabatan = TextEditingController();
  final TextEditingController _controllerNoTelp = TextEditingController();
  final TextEditingController _controllerStatus = TextEditingController();
  final TextEditingController _controllerAlamat = TextEditingController();
  final TextEditingController _controllerKodePos = TextEditingController();
  final TextEditingController _controllerTempatL = TextEditingController();

  Future createAlbum(BiodataKaryawan biodataKaryawan) async {
    final http.Response response = await http.post(
      'http://jerrysibarani.com/androidserverapi/myapi/biodata_karyawan_api/',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'nik': biodataKaryawan.nik,
        'nama_karyawan': biodataKaryawan.namaKaryawan,
        'jenis_kelamin': biodataKaryawan.jenisKelamin,
        'tempat_lahir': biodataKaryawan.tempatLahir,
        'tanggal_lahir': biodataKaryawan.tanggalLahir,
        'pendidikan': biodataKaryawan.pendidikan,
        'departemen': biodataKaryawan.departemen,
        'jabatan': biodataKaryawan.jabatan,
        'no_telepon': biodataKaryawan.noTelepon,
        'status': biodataKaryawan.status,
        'alamat': biodataKaryawan.alamat,
        'kodepos': biodataKaryawan.kodepos,
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Center(
            child: Container(
          child: ListView(
            children: <Widget>[
              TextField(
                controller: _controllerNik,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'NIK',
                    hintText: 'Masukan NIK'),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: _controllerName,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nama',
                    hintText: 'Masukan Nama'),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: _controllerJk,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Jenis kelamin',
                    hintText: 'Masukan Jenis kelamin'),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: _controllerTempatL,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Tempat Lahir',
                    hintText: 'Masukan Tempat Lahir'),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: _controllerTl,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Tanggal Lahir',
                    hintText: 'Masukan Tanggal Lahir'),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: _controllerPendidikan,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Pendidikan',
                    hintText: 'Masukan Pendidikan'),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: _controllerDepartement,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Departemen',
                    hintText: 'Masukan Departemen'),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: _controllerJabatan,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Jabatan',
                    hintText: 'Masukan Jabatan'),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: _controllerNoTelp,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'No Telepon',
                    hintText: 'Masukan No Telepon'),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: _controllerStatus,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Status',
                    hintText: 'Masukan Status'),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: _controllerAlamat,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Alamat',
                    hintText: 'Masukan Alamat'),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: _controllerKodePos,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'KodePos',
                    hintText: 'Masukan KodePos'),
              ),
            ],
          ),
          padding: EdgeInsets.all(16),
        )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final biodataKar1 = new BiodataKaryawan(
            namaKaryawan: _controllerName.text,
            nik: _controllerNik.text,
            jenisKelamin: _controllerJk.text,
            tempatLahir: _controllerTempatL.text,
            tanggalLahir: _controllerTl.text,
            pendidikan: _controllerPendidikan.text,
            departemen: _controllerDepartement.text,
            jabatan: _controllerJabatan.text,
            noTelepon: _controllerNoTelp.text,
            status: _controllerStatus.text,
            alamat: _controllerAlamat.text,
            kodepos: _controllerKodePos.text,
          );
          createAlbum(biodataKar1);
          Navigator.pop(context);
        },
        child: Text('Submit'),
      ),
    );
  }
}
