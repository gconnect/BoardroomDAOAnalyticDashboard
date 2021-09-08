import 'package:boardroom_analytic/models/protocols.dart';
import 'package:boardroom_analytic/viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProtocolsPage extends StatefulWidget {
  @override
  _ProtocolsPageState createState() => _ProtocolsPageState();
}

class _ProtocolsPageState extends State<ProtocolsPage> {
  Protocolls? protocols;
  var boardRoomViewModel = BoardRoomViewModel();
  ScrollController? controller;

  @override
  void initState() {
    boardRoomViewModel.loadProtocols();
    protocols = boardRoomViewModel.protocols;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BoardRoomViewModel>(
      create: (_) => boardRoomViewModel,
      child: Consumer<BoardRoomViewModel>(
        builder: (context, model, child) {
          return Scrollbar(
              child: ListView.builder(
                  itemCount: model.protocols?.data?.length ?? 0,
                  shrinkWrap: true,
                  controller: controller,
                  itemBuilder: (context, index) {
                    return protocolItem(
                      model.protocols?.data![index].name,
                      model.protocols?.data![index].totalVotes,
                      model.protocols?.data![index].tokens![0].marketPrices![0]
                          .price
                          ?.toDouble(),
                      model.protocols?.data![index].icons?[0].url,
                    );
                  }));
        },
      ),
    );
  }

  Widget protocolItem(
      String? name, num? proposals, double? price, String? imageurl) {
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
                  subtitle: Text("Votes : $proposals"),
                  trailing: Text("Price : $price"),
                ),
              ))
        ]));
  }
}
