import 'package:boardroom_analytic/models/voters.dart';
import 'package:boardroom_analytic/viewmodel.dart';
import 'package:flutter/material.dart';

class VotersPage extends StatefulWidget {
  @override
  _VotersPageState createState() => _VotersPageState();
}

class _VotersPageState extends State<VotersPage> {
  var boardRoomViewModel = BoardRoomViewModel();
  List<VotersData> voters = [];

  @override
  void initState() {
    super.initState();
    fetchVoters();
  }

  void fetchVoters() async {
    voters = await boardRoomViewModel.loadVoters();
    print("from voters ${voters.length}");
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: voters.length,
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
                        leading: Text("hello"),
                        // title: Text(name!),
                        // subtitle: Text("Protocols : $protocols"),
                        // trailing: Text("Token Price : $price"),
                      ),
                    ))
              ]));
        });
  }
}
