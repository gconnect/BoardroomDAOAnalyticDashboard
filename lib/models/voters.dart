class Voters {
  List<VotersData>? data;
  String? nextCursor;

  Voters({this.data, this.nextCursor});

  Voters.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <VotersData>[];
      json['data'].forEach((v) {
        data?.add(new VotersData.fromJson(v));
      });
    }
    nextCursor = json['nextCursor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data?.map((v) => v.toJson()).toList();
    }
    data['nextCursor'] = this.nextCursor;
    return data;
  }
}

class VotersData {
  String? address;
  int? firstVoteCast;
  int? lastVoteCast;
  int? totalVotesCast;
  List<Protocols>? protocols;

  VotersData(
      {this.address,
      this.firstVoteCast,
      this.lastVoteCast,
      this.totalVotesCast,
      this.protocols});

  VotersData.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    firstVoteCast = json['firstVoteCast'];
    lastVoteCast = json['lastVoteCast'];
    totalVotesCast = json['totalVotesCast'];
    if (json['protocols'] != null) {
      protocols = <Protocols>[];
      json['protocols'].forEach((v) {
        protocols?.add(new Protocols.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['firstVoteCast'] = this.firstVoteCast;
    data['lastVoteCast'] = this.lastVoteCast;
    data['totalVotesCast'] = this.totalVotesCast;
    if (this.protocols != null) {
      data['protocols'] = this.protocols?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Protocols {
  String? protocol;
  int? totalVotesCast;
  int? lastVoteCast;
  int? firstVoteCast;
  int? totalPowerCast;
  double? lastCastPower;

  Protocols(
      {this.protocol,
      this.totalVotesCast,
      this.lastVoteCast,
      this.firstVoteCast,
      this.totalPowerCast,
      this.lastCastPower});

  Protocols.fromJson(Map<String, dynamic> json) {
    protocol = json['protocol'];
    totalVotesCast = json['totalVotesCast'];
    lastVoteCast = json['lastVoteCast'];
    firstVoteCast = json['firstVoteCast'];
    totalPowerCast = json['totalPowerCast'];
    lastCastPower = json['lastCastPower'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['protocol'] = this.protocol;
    data['totalVotesCast'] = this.totalVotesCast;
    data['lastVoteCast'] = this.lastVoteCast;
    data['firstVoteCast'] = this.firstVoteCast;
    data['totalPowerCast'] = this.totalPowerCast;
    data['lastCastPower'] = this.lastCastPower;
    return data;
  }
}
