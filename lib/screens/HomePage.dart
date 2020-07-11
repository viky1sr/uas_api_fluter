import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:karyawan/model/model.dart';
import 'package:karyawan/screens/CreateNewDataPage.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<BiodataKaryawan>> futureBiodata;

  @override
  void initState() {
    super.initState();
    futureBiodata = _fetchListItems();
  }

  Future<List<BiodataKaryawan>> _fetchListItems() async {
    final response = await http.get(
        'http://jerrysibarani.com/androidserverapi/myapi/biodata_karyawan_api/');

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      List data = jsonDecode(response.body);
      return data
          .map((biodata) => new BiodataKaryawan.fromJson(biodata))
          .toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load');
    }
  }

  FutureBuilder _biodataKaryawan() {
    return FutureBuilder<List<BiodataKaryawan>>(
      future: futureBiodata,
      builder: (BuildContext context,
          AsyncSnapshot<List<BiodataKaryawan>> snapshot) {
        if (snapshot.hasData) {
          List<BiodataKaryawan> data = snapshot.data;
          return _listData(data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      },
    );
  }

  ListView _listData(data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Card(child: _tile(data[index].nik, data[index].namaKaryawan));
        });
  }

  ListTile _tile(String nik, String namaKaryawan) {
    return ListTile(
      leading: FlutterLogo(size: 56.0),
      title: Text(namaKaryawan),
      subtitle: Text('NIK: $nik'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        height: double.infinity,
        child: Center(child: _biodataKaryawan()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    CreateNewDataPages(title: 'Buat Data Karyawan baru')),
          );
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
