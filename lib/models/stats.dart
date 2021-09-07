class Stats {
  StatData? data;

  Stats({this.data});

  // Stats.fromJson(Map<String, dynamic> json) {
  //   // data = json['data'] != null ? StatData.fromJson(json['data']) : null;
  //   data = json['data'];
  // }

  factory Stats.fromJson(Map<String, dynamic> json) => Stats(
        data: StatData.fromJson(json["data"]),
      );

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   if (this.data != null) {
  //     data['data'] = this.data?.toJson();
  //   }
  //   return data;
  // }

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
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

  StatData.fromJson(Map<String, dynamic> json)
      : totalProposals = json['totalProposals'],
        totalProtocols = json['totalProtocols'],
        totalUniqueVoters = json['totalUniqueVoters'],
        totalVotesCast = json['totalVotesCast'];

  Map<String, dynamic> toJson() => {
        'totalProposals': totalProposals,
        'totalProtocols': totalProtocols,
        'totalUniqueVoters': totalUniqueVoters,
        'totalVotesCast': totalVotesCast,
      };

  // StatData.fromJson(Map<String, dynamic> json) {
  //   totalProposals = json['totalProposals'];
  //   totalProtocols = json['totalProtocols'];
  //   totalUniqueVoters = json['totalUniqueVoters'];
  //   totalVotesCast = json['totalVotesCast'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['totalProposals'] = this.totalProposals;
  //   data['totalProtocols'] = this.totalProtocols;
  //   data['totalUniqueVoters'] = this.totalUniqueVoters;
  //   data['totalVotesCast'] = this.totalVotesCast;
  //   return data;
  // }

}

// class User {
//   User({
//     required this.data,
//   });
//
//   Data data;
//
//   factory User.fromJson(Map<String, dynamic> json) => User(
//     data: Data.fromJson(json["data"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "data": data.toJson(),
//   };
// }
//
//
// class Data {
//   Data({
//     required this.id,
//     required this.email,
//     required this.firstName,
//     required this.lastName,
//     required this.avatar,
//   });
//
//   int id;
//   String email;
//   String firstName;
//   String lastName;
//   String avatar;
//
//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//     id: json["id"],
//     email: json["email"],
//     firstName: json["first_name"],
//     lastName: json["last_name"],
//     avatar: json["avatar"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "email": email,
//     "first_name": firstName,
//     "last_name": lastName,
//     "avatar": avatar,
//   };
// }
