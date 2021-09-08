class Proposals {
  List<ProposalData>? data;
  String? nextCursor;

  Proposals({required this.data, this.nextCursor});

  Proposals.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ProposalData>[];
      json['data'].forEach((v) {
        data?.add(new ProposalData.fromJson(v));
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

class ProposalData {
  String? refId;
  String? id;
  String? title;
  String? content;
  String? protocol;
  String? adapter;
  String? proposer;
  num? totalVotes;
  num? blockNumber;
  StartTime? startTime;
  StartTime? endTime;
  num? startTimestamp;
  num? endTimestamp;
  String? currentState;
  List<String>? choices;
  List<Results>? results;
  List<Events>? events;

  ProposalData(
      {this.refId,
      this.id,
      this.title,
      this.content,
      this.protocol,
      this.adapter,
      this.proposer,
      this.totalVotes,
      this.blockNumber,
      this.startTime,
      this.endTime,
      this.startTimestamp,
      this.endTimestamp,
      this.currentState,
      this.choices,
      this.results,
      this.events});

  ProposalData.fromJson(Map<String, dynamic> json) {
    refId = json['refId'];
    id = json['id'];
    title = json['title'];
    content = json['content'];
    protocol = json['protocol'];
    adapter = json['adapter'];
    proposer = json['proposer'];
    totalVotes = json['totalVotes'];
    blockNumber = json['blockNumber'];
    startTime = json['startTime'] != null
        ? new StartTime.fromJson(json['startTime'])
        : null;
    endTime = json['endTime'] != null
        ? new StartTime.fromJson(json['endTime'])
        : null;
    startTimestamp = json['startTimestamp'];
    endTimestamp = json['endTimestamp'];
    currentState = json['currentState'];
    choices = json['choices'].cast<String>();
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results?.add(new Results.fromJson(v));
      });
    }
    if (json['events'] != null) {
      events = <Events>[];
      json['events'].forEach((v) {
        events?.add(new Events.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['refId'] = this.refId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['content'] = this.content;
    data['protocol'] = this.protocol;
    data['adapter'] = this.adapter;
    data['proposer'] = this.proposer;
    data['totalVotes'] = this.totalVotes;
    data['blockNumber'] = this.blockNumber;
    if (this.startTime != null) {
      data['startTime'] = this.startTime?.toJson();
    }
    if (this.endTime != null) {
      data['endTime'] = this.endTime?.toJson();
    }
    data['startTimestamp'] = this.startTimestamp;
    data['endTimestamp'] = this.endTimestamp;
    data['currentState'] = this.currentState;
    data['choices'] = this.choices;
    if (this.results != null) {
      data['results'] = this.results?.map((v) => v.toJson()).toList();
    }
    if (this.events != null) {
      data['events'] = this.events?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StartTime {
  num? blockNumber;

  StartTime({this.blockNumber});

  StartTime.fromJson(Map<String, dynamic> json) {
    blockNumber = json['blockNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['blockNumber'] = this.blockNumber;
    return data;
  }
}

class Results {
  num? total;
  num? choice;

  Results({this.total, this.choice});

  Results.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    choice = json['choice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['choice'] = this.choice;
    return data;
  }
}

class Events {
  StartTime? time;
  String? event;
  num? timestamp;

  Events({this.time, this.event, this.timestamp});

  Events.fromJson(Map<String, dynamic> json) {
    time = json['time'] != null ? new StartTime.fromJson(json['time']) : null;
    event = json['event'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.time != null) {
      data['time'] = this.time?.toJson();
    }
    data['event'] = this.event;
    data['timestamp'] = this.timestamp;
    return data;
  }
}
