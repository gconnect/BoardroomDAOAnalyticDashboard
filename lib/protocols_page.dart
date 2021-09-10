import 'package:boardroom_analytic/models/protocols.dart';
import 'package:boardroom_analytic/table_widget.dart';
import 'package:boardroom_analytic/viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProtocolsPage extends StatefulWidget {
  @override
  _ProtocolsPageState createState() => _ProtocolsPageState();
}

class _ProtocolsPageState extends State<ProtocolsPage> {
  late Future<Protocolls?> protocols;
  var boardRoomViewModel = BoardRoomViewModel();
  ScrollController? controller;

  @override
  void initState() {
    protocols = boardRoomViewModel.loadProtocols();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Protocols"), backgroundColor: Colors.deepPurpleAccent),
      body: ChangeNotifierProvider<BoardRoomViewModel>(
        create: (_) => boardRoomViewModel,
        child: Consumer<BoardRoomViewModel>(
          builder: (context, model, child) {
            return TableWidget();
          },
        ),
      ),
    );
  }
}
