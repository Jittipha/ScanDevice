import 'dart:convert';

import 'package:bluetooth/Detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:http/http.dart ' as http;

class Scanning extends StatefulWidget {
  const Scanning({Key? key}) : super(key: key);

  @override
  State<Scanning> createState() => _ScanningState();
}

class _ScanningState extends State<Scanning> {
  FlutterBlue flutterBlue = FlutterBlue.instance;
  List<ScanResult> scanResultList = [];
  bool _isScanningg = false;
  late Future resultsLoaded;
  List _allresult = [];
  List _showresult = [];

  IO.Socket? socket;

  @override
  initState() {
    super.initState();
    gettrackdata();
    setStream(getScanStream());
  }

  // void Connect() {
  //   print("asdasdasd");
  //   socket = IO.io("http://192.168.1.192:4000");
  //   socket!.connect();
  //   socket!.onConnect((data) => print("connecting"));
  //   print(socket!.connected);

  //   socket!.emit("test", "Hello");

  // }

  gettrackdata() async {
    var jsonData;
    var res = await http.get(Uri.parse('http://192.168.1.192:3000/tracks'));
    if (res.statusCode == 200) {
      jsonData = jsonDecode(res.body);
      setState(() {
        _allresult = jsonData;
      });
    }
    return jsonData;
  }

  Stream<ScanResult> getScanStream() {
    _showresult.clear();
    return FlutterBlue.instance
        .scan(timeout: const Duration(milliseconds: 4500));
  }

  void setStream(Stream<ScanResult> stream) async {
    stream.listen((event) {
       print("data received ${event}");
      var id = event.device.id.toString().replaceAll(":", "");

      _allresult.forEach((element) {
        if (element["Track_ID"] == id) {
          print(element["Track_ID"]);
          element["rssi"] = event.rssi;
          double distance = (-69 - (event.rssi)) / (10 * 2);
          _showresult.add({
            "Track_ID": element["Track_ID"],
            "rssi": event.rssi,
            "Distance": power(10.00, distance),
            "Brand": element["Brand"],
            "Generation": element["Generation"],
            "Menufacturer": element["Menufacturer"],
            "Size": element["Size"],
            "Age_of_use": element["Age_of_use"],
            "Location": element["Location"],
            "Work_for": element["Word_for"],
            "Start_Enable_Date": element["Start_Enable_Date"],
            "Last_Improve_Date": element["Last_Improve_Date"],
            "Count_Improve": element["Count_Improve"],
            "End_Date": element["End_Date"],
            "Note": element["Note"],
            "Working_Condition": element["Working_Condition"],
            "Status": element["Status"]
          });
        }
      });
      setState(() {});
    }, onDone: () async {
      // Scan is finished ****************
      await FlutterBlue.instance.stopScan();
      print("Task Done");
      print("second scan");
      setStream(getScanStream()); // New scan
    }, onError: (Object e) {
      print("Some Error " + e.toString());
    });
  }

  // scan() async {
  //   print("Scanning >>>>>> $_isScanningg");
  //   if (!_isScanningg) {
  //     scanResultList.clear();
  //     flutterBlue.startScan();
  //     flutterBlue.scanResults.listen((results) {
  //       scanResultList = results;
  //       // scanResultList.sort();
  //       setState(() {});
  //     });
  //   } else {
  //     flutterBlue.stopScan();
  //   }
  // }

  String deviceMacAddress(ScanResult r) {
    String id = r.device.id.id.replaceAll(":", "");
    return id;
  }

  String deviceSignal(ScanResult r) {
    String text = r.rssi.toString();
    return text;
  }

  String deviceName(ScanResult r) {
    String name = '';

    if (r.device.name.isNotEmpty) {
      name = r.device.name;
    } else if (r.advertisementData.localName.isNotEmpty) {
      name = r.advertisementData.localName;
    } else {
      name = 'N/A';
    }
    return name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Scanning'),
        ),
      ),
      body: Center(
        child: ListView.separated(
          itemCount: _showresult.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(_showresult[index]["Track_ID"]),
              subtitle: Text("ระยะทาง : " +
                  _showresult[index]["Distance"].toString() +
                  " m"),
              trailing: CircleAvatar(
                backgroundColor: Colors.blueGrey,
                child: Text(_showresult[index]["rssi"].toString()),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => detail(
                            Device: _showresult[index],
                          )),
                );
              },
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Connect();
          // scan();
        },
        child: Icon(_isScanningg ? Icons.stop : Icons.search),
      ),
    );
  }

//   Widget FindDevicedSceen(){
//     return
//   }
// }
  double power(double x, double n) {
    double retval = 1;
    for (double i = 0; i < n; i++) {
      retval *= x;
    }
    retval = retval / 10;
    return retval;
  }
}
