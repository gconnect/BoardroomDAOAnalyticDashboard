import 'package:boardroom_analytic/viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/proposals.dart';

class ProposalsPage extends StatefulWidget {
  @override
  _ProposalsPageState createState() => _ProposalsPageState();
}

class _ProposalsPageState extends State<ProposalsPage> {
  var boardRoomViewModel = BoardRoomViewModel();
  List<ProposalData> proposals = [];

  @override
  void initState() {
    super.initState();
    boardRoomViewModel.loadProposals();
    print(boardRoomViewModel.proposals?.data?.length);
  }

  @override
  Widget build(BuildContext context) {
    print("from proposal page ${boardRoomViewModel.proposals?.data?.length}");
    return ChangeNotifierProvider<BoardRoomViewModel>(
      create: (_) => boardRoomViewModel,
      child: Consumer<BoardRoomViewModel>(
        builder: (context, model, child) {
          return ListView.builder(
              itemCount: boardRoomViewModel.proposals?.data?.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
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
                              leading: Text(boardRoomViewModel
                                      .proposals?.data![index].title ??
                                  'No title'),
                              // title: Text(name!),
                              // subtitle: Text("Protocols : $protocols"),
                              // trailing: Text("Token Price : $price"),
                            ),
                          ))
                    ]));
              });
        },
      ),
    );
  }
}
