import 'package:boardroom_analytic/models/voters.dart';
import 'package:boardroom_analytic/viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VotersPage extends StatefulWidget {
  @override
  _VotersPageState createState() => _VotersPageState();
}

class _VotersPageState extends State<VotersPage> {
  var boardRoomViewModel = BoardRoomViewModel();
  Future<Voters?>? voters;
  @override
  void initState() {
    super.initState();
    voters = boardRoomViewModel.loadVoters();
  }

  @override
  Widget build(BuildContext context) {
    print(boardRoomViewModel.voters?.data?.length);
    return Scaffold(
      appBar: AppBar(
          title: Text("Voters"), backgroundColor: Colors.deepPurpleAccent),
      body: ChangeNotifierProvider<BoardRoomViewModel>(
          create: (_) => boardRoomViewModel,
          child: Consumer<BoardRoomViewModel>(builder: (context, model, child) {
            return FutureBuilder<Voters?>(
                future: voters,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(child: CircularProgressIndicator()),
                        Text("Loading Voters")
                      ],
                    );
                  }
                  if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return ListView.builder(
                      itemCount: snapshot.data?.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        return Container(
                            color: Colors.purple[50],
                            child: Column(children: [
                              Card(
                                  margin: EdgeInsets.only(
                                      left: 10, right: 10, bottom: 10),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Container(
                                      height: 100,
                                      padding: EdgeInsets.all(10),
                                      child: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: ListTile(
                                          leading: GestureDetector(
                                            behavior:
                                                HitTestBehavior.translucent,
                                            onTap: () {},
                                            child: Container(
                                              width: 48,
                                              height: 48,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 4.0),
                                              alignment: Alignment.center,
                                              child: CircleAvatar(
                                                backgroundColor:
                                                    Colors.deepPurpleAccent,
                                                child: Text(
                                                  snapshot
                                                          .data
                                                          ?.data![index]
                                                          .protocols![0]
                                                          .protocol
                                                          ?.toUpperCase()
                                                          ?.substring(0, 1) ??
                                                      "",
                                                ),
                                              ),
                                            ),
                                          ),
                                          title: Text(snapshot
                                                  .data
                                                  ?.data![index]
                                                  .protocols![0]
                                                  .protocol
                                                  ?.toUpperCase() ??
                                              ""),
                                          dense: false,
                                          subtitle: Text(snapshot
                                                  .data?.data![index].address ??
                                              ""),
                                          trailing: Text(
                                            snapshot.data?.data![index]
                                                    .totalVotesCast
                                                    .toString() ??
                                                "",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      )))
                            ]));
                      });
                });
          })),
    );
  }
}
