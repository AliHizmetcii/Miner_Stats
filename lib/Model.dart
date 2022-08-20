final List<Model> modelList = <Model>[];

class Model {
  String ID;
  String currentHashrate;
  String hashrate;
  String workersOnline;
  String reward; //{'24hreward'}
  String lastShare;
  String unpaidBalance; //{'balance'}
  String sharesValid;
  String sharesStale;
  String walletID;

  Map<String, dynamic> toJson() => {
        'ID': ID,
        'currentHashrate': currentHashrate,
        'hashrate': hashrate,
        'workersOnline': workersOnline,
        'reward': reward,
        'lastShare': lastShare,
        'unpaidBalance': unpaidBalance,
        'sharesValid': sharesValid,
        'sharesStale': sharesStale,
        'walletID': walletID,
      };

  Model(
      {this.ID = "",
      this.currentHashrate = "",
      this.hashrate = "",
      this.workersOnline = "",
      this.reward = "",
      this.lastShare = "",
      this.unpaidBalance = "",
      this.sharesValid = "",
      this.sharesStale = "",
      this.walletID = ""});

  factory Model.fromJson(Map<String, dynamic> json) => Model(
        ID: json["ID"],
        currentHashrate: json["currentHashrate"],
        hashrate: json["hashrate"],
        workersOnline: json["workersOnline"],
        lastShare: json["lastShare"],
        reward: json["reward"],
        unpaidBalance: json["unpaidBalance"],
        sharesValid: json["sharesValid"],
        sharesStale: json["sharesStale"],
        walletID: json["walletID"],
      );
}
