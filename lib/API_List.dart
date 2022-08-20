import 'package:deneme/API_config.dart';
import 'main.dart';

class API_List {
  Object returnAPI(String p ,String c) {
    switch (p) {
      case 'Ethermine':
        API = "https://api.ethermine.org/miner/$WalletID/dashboard";
        StatsFromAPIState().getStats();
        break;
      case '2miners':
        API = "https://$c.2miners.com/api/accounts/$WalletID";
        StatsFromAPIState().getStats();
        break;
    }
    return API;
  }
}
