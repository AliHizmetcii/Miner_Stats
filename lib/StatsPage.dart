import 'package:flutter/material.dart';
import 'Model.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({Key? key}) : super(key: key);

  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  TextStyle style = const TextStyle(fontFamily: 'Raleway', color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Miner Details"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: const SafeArea(
          child: SizedBox(
            height: 300,
            width: 300,
            child: StatsWidget(),
          ),
        ),
      ),
    );
  }
}

class StatsWidget extends StatelessWidget {
  const StatsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        itemCount: modelList.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Current Hashrate : " +
                  modelList[index].currentHashrate),
              Text(
                  "Unpaid Balance : " + modelList[index].unpaidBalance),
              Text(
                  "Online Workers : " + modelList[index].workersOnline),
              Text("Shares Valid : " + modelList[index].sharesValid),
              Text("Shares Stale : " + modelList[index].sharesStale),
              Text("Last Share : " + modelList[index].lastShare),
              Text("Reward : " + modelList[index].reward),
              Text("Hashrate : " + modelList[index].hashrate),
            ],
          );
        });
  }
}
