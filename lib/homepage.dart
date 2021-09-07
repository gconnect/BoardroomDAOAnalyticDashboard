import 'package:boardroom_analytic/models/stats.dart';
import 'package:boardroom_analytic/piechart_page.dart';
import 'package:boardroom_analytic/viewmodel.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var boardRoomViewModel = BoardRoomViewModel();
  Stats stats = Stats();

  @override
  void initState() {
    super.initState();
    fetchStats();
    stats = boardRoomViewModel.stats;
  }

  void fetchStats() async {
    stats = await boardRoomViewModel.loadStats();
    print("from homepage ${stats.data}");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "Global Platform Stats",
              style: TextStyle(fontSize: 18),
            ),
          ),
          Expanded(child: PieChartPage()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Color(0xfff8b250),
                  child: Container(
                    height: 150,
                    width: 180,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 36, bottom: 20),
                          child: Text(
                            "Total Proposals",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: Text(
                            "2345",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  )),
              Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Color(0xff0293ee),
                  child: Container(
                    height: 150,
                    width: 180,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 36, bottom: 20),
                          child: Text(
                            "Total Protocols",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: Text(
                            "62",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Color(0xff845bef),
                  child: Container(
                    height: 150,
                    width: 180,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 36, bottom: 20),
                          child: Text(
                            "Unique Voters",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: Text(
                            "3738",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  )),
              Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Color(0xff13d38e),
                  child: Container(
                    height: 150,
                    width: 180,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 36, bottom: 20),
                          child: Text(
                            "Total Votes Cast",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: Text(
                            "216743",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
