import 'package:boardroom_analytic/models/proposals.dart';
import 'package:boardroom_analytic/models/stats.dart';
import 'package:boardroom_analytic/models/voters.dart';
import 'package:dio/dio.dart';

import 'constants/constants.dart';
import 'models/protocols.dart';

class BoardroomApiService {
  static Future<Protocolls?> getProtocols() async {
    final Dio _dio = Dio();
    Protocolls? protocols;
    try {
      Response response = await _dio.get(PROTOCOLS_URL);
      print('Protocols Info: ${response.data}');
      protocols = Protocolls.fromJson(response.data);
      print("protocol size ${protocols.data?.length}");
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
    return protocols;
  }

  static Future<Proposals?> getProposals() async {
    final Dio _dio = Dio();
    Proposals? proposals;
    try {
      Response response = await _dio.get(PROPOSAL_URL);
      print('Proposals Info: ${response.data}');
      proposals = Proposals.fromJson(response.data);
      print({proposals.data?.length});
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
    return proposals;
  }

  static Future<Voters?> getVoters() async {
    final Dio _dio = Dio();
    Voters? voters;

    try {
      Response response = await _dio.get(VOTERS_URL);
      print('Voters Info: ${response.data}');
      voters = Voters.fromJson(response.data);
      print("voters ${voters.data?.length}");
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
    return voters;
  }

  static Future<Stats?> getStats() async {
    final Dio _dio = Dio();

    Stats? stats;
    try {
      Response response = await _dio.get(STATS_URL);
      print('Stat Info: ${response.data}');
      stats = Stats.fromJson(response.data);
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
    return stats;
  }
}
