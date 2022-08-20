import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'Model.dart';

String API = "";
bool isLoading = false;

class StatsFromAPIState extends State<MaterialApp> {
  final List<dynamic> _getStats = <dynamic>[];

  Future<List<dynamic>> getStats() async {
    var test = Model();
    // ignore: deprecated_member_use
    var stats = <dynamic>[];
    var request = http.Request(
      'GET',
      Uri.parse(API),
    );
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
        isLoading = true;
        var statsJson = json.decode(await response.stream.bytesToString());
        getData(test, statsJson);
        modelList.add(test);
    }
    return stats;
  }

  @override
  void initState() {
    super.initState();
    getStats().then((value) {
      setState(() {
        _getStats.addAll(value);
      });
    });
  }

  Model getData(Model m, dynamic d) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyMMddkkmmss').format(now);
    m.ID = formattedDate;
    m.currentHashrate = d["currentHashrate"].toString();
    m.hashrate = d["hashrate"].toString();
    m.sharesStale = d["sharesStale"].toString();
    m.reward = d["24hreward"].toString();
    m.unpaidBalance = d["balance"].toString();
    m.workersOnline = d["workersOnline"].toString();
    m.sharesValid = d["sharesValid"].toString();
    m.lastShare = d["lastShare"].toString();
    return m;
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
