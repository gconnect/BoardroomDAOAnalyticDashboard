import 'package:boardroom_analytic/boardroom_service.dart';
import 'package:boardroom_analytic/custom_table_page.dart';
import 'package:boardroom_analytic/models/proposals.dart';
import 'package:boardroom_analytic/models/voters.dart';
import 'package:flutter/material.dart';

import 'models/protocols.dart';
import 'models/stats.dart';

class BoardRoomViewModel extends ChangeNotifier {
  Protocolls? protocols;
  Proposals? proposals;
  Voters? voters;
  Stats? stats;
  ProtocolsDataSource? protocolsDataSource;

  Future<Protocolls?> loadProtocols() async {
    try {
      protocols = await BoardroomApiService.getProtocols();
      protocolsDataSource = ProtocolsDataSource(protocols: protocols?.data);
      notifyListeners();
    } catch (err) {
      print(err);
    }
    return protocols;
  }

  Future<Proposals?> loadProposals() async {
    try {
      proposals = await BoardroomApiService.getProposals();
      notifyListeners();
    } catch (err) {
      print(err);
    }
    return proposals;
  }

  Future<Voters?> loadVoters() async {
    try {
      voters = await BoardroomApiService.getVoters();
      notifyListeners();
    } catch (err) {
      print(err);
    }
    return voters;
  }

  Future<Stats?> loadStats() async {
    try {
      stats = await BoardroomApiService.getStats();
      notifyListeners();
    } catch (err) {
      print(err);
    }
    return stats;
  }
}
