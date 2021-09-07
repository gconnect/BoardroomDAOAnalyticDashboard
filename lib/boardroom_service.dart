import 'dart:convert';

import 'package:boardroom_analytic/models/proposals.dart';
import 'package:boardroom_analytic/models/stats.dart';
import 'package:boardroom_analytic/models/voters.dart';
import 'package:dio/dio.dart';

import 'constants/constants.dart';
import 'models/protocols.dart';

class BoardroomApiService {
  static Future<List<Data>> fetchProtocols() async {
    final Dio _dio = Dio();
    final response = await _dio.get(PROTOCOLS_URL);
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print("from repo ${response.data}");
      // return Protocols.fromJson(jsonDecode(response.data));
      return List<Data>.from(
          response.data['data'].map((x) => Data.fromJson(x)));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load protocols');
    }
  }

  static Future<List<ProposalData>> fetchProposals() async {
    final Dio _dio = Dio();
    final response = await _dio.get(PROPOSAL_URL);
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print("from repo proposal ${response.data}");
      // return Protocols.fromJson(jsonDecode(response.data));
      return List<ProposalData>.from(
          response.data['data'].map((x) => Data.fromJson(x)));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load proposals');
    }
  }

  static Future<List<VotersData>> fetchVotes() async {
    final Dio _dio = Dio();
    final response = await _dio.get(VOTERS_URL);
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print("from repo proposal ${response.data}");
      // return Protocols.fromJson(jsonDecode(response.data));
      return List<VotersData>.from(
          response.data['data'].map((x) => Data.fromJson(x)));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load voters');
    }
  }

  static Future<Stats> fetchStats() async {
    final Dio _dio = Dio();
    final response = await _dio.get(STATS_URL);
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print("from repo proposal ${response.data}");

      // Parsing the raw JSON data to the Stats class
      Stats stats = Stats.fromJson(response.data);
      print("Stat is: ${stats.data}");
      return stats;
      return Stats.fromJson(jsonDecode(response.data['data']));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load stats');
    }
  }
}
