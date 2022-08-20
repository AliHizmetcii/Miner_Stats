
import 'package:flutter/material.dart';

import 'API_List.dart';
import 'API_config.dart';
import 'main.dart';

void main() {
  runApp(const MaterialApp(home: MiningStats()));
}

class MiningStats extends StatefulWidget {
  const MiningStats({Key? key}) : super(key: key);

  @override
  _MiningStatsState createState() => _MiningStatsState();
}

class _MiningStatsState extends State<MiningStats> {
  TextEditingController walletIDController = TextEditingController();

  var dropdownValue1 = "Ethermine";
  var dropdownValue2 = "RVN";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mining Stats"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              child: Theme(
                data: ThemeData(
                  primaryColor: Colors.redAccent,
                  primaryColorDark: Colors.red,
                ),
                child: TextField(
                  controller: walletIDController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal),
                    ),
                    hintText: 'Enter Your WalletID',
                    labelText: 'Wallet ID',
                    prefixIcon: Icon(
                      Icons.account_balance_wallet_outlined,
                      color: Colors.black,
                    ),
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      WalletID=walletIDController.text;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 140,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueAccent),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButton<String>(
                    icon: const Padding(
                      padding: EdgeInsets.fromLTRB(10,0,0,0),
                      child: Visibility(
                          visible: true, child: Icon(Icons.arrow_downward)),
                    ),
                    value: dropdownValue1,
                    elevation: 16,
                    style: const TextStyle(color: Colors.black),
                    underline: const SizedBox(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue1 = newValue!;
                      });
                    },
                    items: <String>['Ethermine', '2miners']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 90,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueAccent),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButton<String>(
                    icon:const Visibility (visible:false, child: Icon(Icons.arrow_downward)),
                    value: dropdownValue2,
                    elevation: 16,
                    style: const TextStyle(color: Colors.black),
                    underline: const SizedBox(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue2 = newValue!;
                      });
                    },
                    items: <String>['RVN', 'ETH']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 110,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.green,
                    child: IconButton(
                      icon: const Icon(Icons.add),
                      tooltip: 'Save Worker',
                      onPressed: (){
                        setState((){
                          API = API_List().returnAPI(dropdownValue1,dropdownValue2).toString();
                          StatsFromAPIState().getStats();
                          workerList.add(const WorkerWidget());
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()),
                          );
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 25),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
