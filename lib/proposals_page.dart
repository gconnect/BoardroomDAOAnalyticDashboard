import 'package:boardroom_analytic/viewmodel.dart';
import 'package:flutter/material.dart';

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
    fetchProposals();
  }

  void fetchProposals() async {
    proposals = await boardRoomViewModel.loadProposals();
    print("from proposal ${proposals.length}");
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: proposals.length,
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
                        leading: Text(proposals[index].title ?? 'No title'),
                        // title: Text(name!),
                        // subtitle: Text("Protocols : $protocols"),
                        // trailing: Text("Token Price : $price"),
                      ),
                    ))
              ]));
        });
  }
}
