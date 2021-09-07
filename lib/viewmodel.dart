import 'package:boardroom_analytic/boardroom_service.dart';
import 'package:boardroom_analytic/custom_table_page.dart';
import 'package:boardroom_analytic/models/proposals.dart';
import 'package:boardroom_analytic/models/voters.dart';
import 'package:flutter/cupertino.dart';

import 'models/protocols.dart';
import 'models/stats.dart';

class BoardRoomViewModel extends ChangeNotifier {
  List<Data> protocols = [];
  List<ProposalData> proposals = [];
  List<VotersData> voters = [];
  Stats? stats;
  ProtocolsDataSource? protocolsDataSource;

  Future loadProtocols() async {
    try {
      final _protocols = await BoardroomApiService.fetchProtocols();
      this.protocols = _protocols;
      protocolsDataSource = ProtocolsDataSource(protocols: protocols);
      notifyListeners();
    } catch (err) {
      print(err);
    }
  }

  Future loadProposals() async {
    try {
      proposals = await BoardroomApiService.fetchProposals();
      notifyListeners();
    } catch (err) {
      print(err);
    }
  }

  Future loadVoters() async {
    try {
      voters = await BoardroomApiService.fetchVotes();
      notifyListeners();
    } catch (err) {
      print(err);
    }
  }

  void loadStats() async {
    try {
      stats = await BoardroomApiService.getStats();
      notifyListeners();
    } catch (err) {
      print(err);
    }
  }
}
