import 'package:deneme/StatsPage.dart';
import 'package:deneme/addWorker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      body: Stack(
        children: [
          const WorkerWidget(),
          Positioned(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
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
              ),
            ),
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
    TextStyle st = GoogleFonts.lato(
      textStyle: const TextStyle(color: Colors.black, letterSpacing: .5),
    );
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
                workerID = index;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const StatsPage()),
                );
              },
              child: Column(
                children: [
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            modelList[index].currentHashrate +" Mh/s"+ " \nCurrent ",
                            style: st,
                          ),
                        ),
                        const VerticalDivider(
                          thickness: 2,
                          width: 20,
                          color: Colors.black,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(modelList[index].sharesStale + " \nStale",
                              style: st),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    color: Colors.black,
                    indent: 0,
                  ),
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            modelList[index].hashrate +" Mh/s"+ " \nHashrate",
                            style: st,
                          ),
                        ),
                        const VerticalDivider(
                          thickness: 2,
                          width: 20,
                          color: Colors.black,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(modelList[index].sharesValid + " \nValid",
                              style: st),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
    return myList;
  }
}
