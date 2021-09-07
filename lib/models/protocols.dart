class Protocols {
  late List<Data> data;

  Protocols({required this.data});

  Protocols.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? cname;
  String? name;
  int? totalProposals;
  int? totalVotes;
  int? uniqueVoters;
  List<Icons>? icons;
  List<Tokens>? tokens;

  Data(
      {this.cname,
      this.name,
      this.totalProposals,
      this.totalVotes,
      this.uniqueVoters,
      this.icons,
      this.tokens});

  Data.fromJson(Map<String, dynamic> json) {
    cname = json['cname'];
    name = json['name'];
    totalProposals = json['totalProposals'];
    totalVotes = json['totalVotes'];
    uniqueVoters = json['uniqueVoters'];
    if (json['icons'] != null) {
      icons = <Icons>[];
      json['icons'].forEach((v) {
        icons?.add(new Icons.fromJson(v));
      });
    }
    if (json['tokens'] != null) {
      tokens = <Tokens>[];
      json['tokens'].forEach((v) {
        tokens?.add(new Tokens.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cname'] = this.cname;
    data['name'] = this.name;
    data['totalProposals'] = this.totalProposals;
    data['totalVotes'] = this.totalVotes;
    data['uniqueVoters'] = this.uniqueVoters;
    if (this.icons != null) {
      data['icons'] = this.icons?.map((v) => v.toJson()).toList();
    }
    if (this.tokens != null) {
      data['tokens'] = this.tokens?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Icons {
  String? adapter;
  String? size;
  String? url;

  Icons({this.adapter, this.size, this.url});

  Icons.fromJson(Map<String, dynamic> json) {
    adapter = json['adapter'];
    size = json['size'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adapter'] = this.adapter;
    data['size'] = this.size;
    data['url'] = this.url;
    return data;
  }
}

class Tokens {
  String? adapter;
  String? symbol;
  String? network;
  String? contractAddress;
  List<MarketPrices>? marketPrices;

  Tokens(
      {this.adapter,
      this.symbol,
      this.network,
      this.contractAddress,
      this.marketPrices});

  Tokens.fromJson(Map<String, dynamic> json) {
    adapter = json['adapter'];
    symbol = json['symbol'];
    network = json['network'];
    contractAddress = json['contractAddress'];
    if (json['marketPrices'] != null) {
      marketPrices = <MarketPrices>[];
      json['marketPrices'].forEach((v) {
        marketPrices?.add(new MarketPrices.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adapter'] = this.adapter;
    data['symbol'] = this.symbol;
    data['network'] = this.network;
    data['contractAddress'] = this.contractAddress;
    if (this.marketPrices != null) {
      data['marketPrices'] = this.marketPrices?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MarketPrices {
  String? currency;
  double price = 0;

  MarketPrices({
    this.currency,
  });

  MarketPrices.fromJson(Map<String, dynamic> json) {
    currency = json['currency'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currency'] = this.currency;
    data['price'] = this.price;
    return data;
  }
}
