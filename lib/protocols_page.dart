import 'package:boardroom_analytic/models/protocols.dart';
import 'package:boardroom_analytic/table_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'constants/constants.dart';

class ProtocolsPage extends StatefulWidget {
  @override
  _ProtocolsPageState createState() => _ProtocolsPageState();
}

class _ProtocolsPageState extends State<ProtocolsPage> {
  List<Data> protocols = [];
  // late Future<List<Data>> futureAlbum;

  @override
  void initState() {
    super.initState();
    // protocols = fetchAlbum();
    // getProtocols();
  }

  void getProtocols() async {
    protocols = await fetchProtocols();
    print("from init ${protocols.length}");
  }

  @override
  Widget build(BuildContext context) {
    return TableWidget();
  }

  Future<List<Data>> fetchProtocols() async {
    final Dio _dio = Dio();
    final response = await _dio.get(PROTOCOLS_URL);
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print(response.data);
      // return Protocols.fromJson(jsonDecode(response.data));
      return List<Data>.from(
          response.data['data'].map((x) => Data.fromJson(x)));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Widget protocolItem(
      String? name, int? protocols, double? price, String? imageurl) {
    return Container(
        color: Colors.purple[50],
        child: Column(children: [
          Card(
              margin: EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Container(
                height: 100,
                padding: EdgeInsets.all(10),
                child: ListTile(
                  leading: Image.network(imageurl!),
                  title: Text(name!),
                  subtitle: Text("Protocols : $protocols"),
                  trailing: Text("Token Price : $price"),
                ),
              ))
        ]));
  }
}
