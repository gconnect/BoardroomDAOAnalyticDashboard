class Stats {
  StatData? data;

  Stats({this.data});

  Stats.fromJson(Map<String, dynamic> json) {
    // data = json['data'] != null ? StatData.fromJson(json['data']) : null;
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    return data;
  }
}

class StatData {
  int? totalProposals;
  int? totalProtocols;
  int? totalUniqueVoters;
  int? totalVotesCast;

  StatData(
      {this.totalProposals,
      this.totalProtocols,
      this.totalUniqueVoters,
      this.totalVotesCast});

  StatData.fromJson(Map<String, dynamic> json) {
    totalProposals = json['totalProposals'];
    totalProtocols = json['totalProtocols'];
    totalUniqueVoters = json['totalUniqueVoters'];
    totalVotesCast = json['totalVotesCast'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalProposals'] = this.totalProposals;
    data['totalProtocols'] = this.totalProtocols;
    data['totalUniqueVoters'] = this.totalUniqueVoters;
    data['totalVotesCast'] = this.totalVotesCast;
    return data;
  }
}
