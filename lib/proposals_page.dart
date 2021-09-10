import 'package:boardroom_analytic/viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'models/proposals.dart';

class ProposalsPage extends StatefulWidget {
  @override
  _ProposalsPageState createState() => _ProposalsPageState();
}

class _ProposalsPageState extends State<ProposalsPage> {
  var boardRoomViewModel = BoardRoomViewModel();
  Future<Proposals?>? proposals;

  @override
  void initState() {
    super.initState();
    proposals = boardRoomViewModel.loadProposals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Proposals"), backgroundColor: Colors.deepPurpleAccent),
      body: ChangeNotifierProvider<BoardRoomViewModel>(
        create: (_) => boardRoomViewModel,
        child: Consumer<BoardRoomViewModel>(
          builder: (context, model, child) {
            return FutureBuilder<Proposals?>(
                future: proposals,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(child: CircularProgressIndicator()),
                        Text("Loading Proposals")
                      ],
                    );
                  }
                  if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return ListView.separated(
                    itemCount: snapshot.data?.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(left: 5, right: 5),
                        child: Card(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 10, top: 10),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        " ${snapshot.data?.data![index].protocol?.toUpperCase()}",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 20, right: 20),
                                    child: Icon(
                                      Icons.check_circle,
                                      color: snapshot.data?.data![index]
                                                  .currentState ==
                                              "active"
                                          ? Colors.deepPurpleAccent
                                          : Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    " ${snapshot.data?.data![index].title}",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  dateWidet(snapshot
                                          .data?.data![index]?.startTimestamp
                                          ?.toInt() ??
                                      0),
                                  Padding(
                                    padding: EdgeInsets.only(left: 5),
                                    child: Icon(Icons.arrow_right_alt_sharp),
                                  ),
                                  Expanded(
                                    child: dateWidet(snapshot
                                            .data?.data![index]?.endTimestamp
                                            ?.toInt() ??
                                        0),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider();
                    },
                  );
                });
          },
        ),
      ),
    );
  }

  Widget dateWidet(int date) {
    return Padding(
      padding: EdgeInsets.only(right: 10),
      child: Align(
        alignment: Alignment.topLeft,
        child: TextButton(
          onPressed: () => {},
          child: Text(
            formatDate(date),
            style: TextStyle(color: Colors.deepPurpleAccent),
          ),
        ),
      ),
    );
  }

  String formatDate(int date) {
    final f = DateFormat('yyyy.MMM.dd  hh:mm aaa');
    return f.format(DateTime.fromMillisecondsSinceEpoch(date * 1000.toInt()));
  }
}
