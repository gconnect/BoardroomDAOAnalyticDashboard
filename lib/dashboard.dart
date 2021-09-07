import 'package:boardroom_analytic/homepage.dart';
import 'package:boardroom_analytic/leaderboard.dart';
import 'package:boardroom_analytic/proposals_page.dart';
import 'package:boardroom_analytic/protocols_page.dart';
import 'package:boardroom_analytic/voters_page.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  int _currentIndex = 0;
  final List<Widget> _children = [
    HomePage(),
    ProtocolsPage(),
    ProposalsPage(),
    VotersPage(),
    Leaderboard()
  ];

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text("Boardroom Analytical Dashboard"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.purple[100],
        selectedItemColor: Colors.purple,
        showUnselectedLabels: true,
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // new
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: 'Protocols',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Proposals'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Voters'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'Leaderboard'),
        ],
      ),
      body: _children[_currentIndex],
    );
  }
}
