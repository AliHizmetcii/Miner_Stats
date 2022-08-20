import 'package:deneme/StatsPage.dart';
import 'package:deneme/addWorker.dart';
import 'package:flutter/material.dart';
import 'Model.dart';

var workerList = <Widget>[];
String WalletID = "";

void main() async {
  runApp(const MaterialApp(home: HomePage()));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Miner List'),
      ),
      body: Column(
        children: [
          const WorkerWidget(),
          MaterialButton(
            onPressed: () {
              setState(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MiningStats()),
                );
              });
            },
            color: Colors.blue,
            textColor: Colors.white,
            child: const Icon(
              Icons.add,
              size: 24,
            ),
            padding: const EdgeInsets.all(16),
            shape: const CircleBorder(),
          ),
        ],
      ),
    );
  }
}

class WorkerWidget extends StatelessWidget {
  const WorkerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ListView myList = ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: modelList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                side: const BorderSide(width: 1, color: Colors.blueAccent),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const StatsPage()),
                );
              },
              child: ListTile(
                title: Text(modelList[index].currentHashrate),
              ),
            ),
          );
        });
    return myList;
  }
}
