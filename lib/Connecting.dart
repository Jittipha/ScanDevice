// ignore_for_file: avoid_print, file_names, library_prefixes, prefer_final_fields, prefer_typing_uninitialized_variables, unnecessary_brace_in_string_interps, avoid_function_literals_in_foreach_calls, prefer_interpolation_to_compose_strings, prefer_const_constructors

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
            "Work_for": element["Work_for"],
            "Start_Enable_Date": element["Start_Enable_Date"],
            "Last_Improve_Date": element["Last_Improve_Date"],
            "Count_Improve": element["Count_Improve"],
            "End_Date": element["End_Date"]??"- - -",
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
         backgroundColor: const Color.fromARGB(255, 18, 95, 116),
        title: const Center(
          child: Text('Scanning'),
        ),
      ),
      body: Center(
        child: Container(
          height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      // "https://images.unsplash.com/photo-1606230535080-45fdf9d56512?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1331&q=80"
                      "https://images.unsplash.com/photo-1614851099175-e5b30eb6f696?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"
                      ),
                  fit: BoxFit.cover),
            ),
          child: Padding(
            padding: const EdgeInsets.all(9.0),
            child: ListView.separated(
              itemCount: _showresult.length,
              itemBuilder: (context, index) {
                return Container(
                  
                   decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient:

                            //  LinearGradient(colors: [Color.fromARGB(255, 230, 246, 214), Color.fromARGB(255, 120, 187, 242)]),
                            const LinearGradient(
                                begin: Alignment(-1, -1),
                                end: Alignment(2, 0),
                                colors: [
                              Color.fromARGB(255, 245, 246, 247),
                              Color.fromARGB(255, 248, 246, 247)
                            ])),
                  child: ListTile(
                    title: Text(_showresult[index]["Track_ID"]),
                    subtitle: Text("ระยะทาง : " +
                        _showresult[index]["Distance"].toString() +
                        " m"),
                    trailing: CircleAvatar(
                      backgroundColor: Colors.blueGrey,
                      child: Text(_showresult[index]["rssi"].toString()),
                    ),
                    onTap: () {
                      print(_showresult[index]["Track_ID"]);
                      print(_showresult[index]["rssi"]);
                      print(_showresult[index]["Distance"]);
                      print(_showresult[index]["Brand"]);
                      print(_showresult[index]["Generation"]);
                      print(_showresult[index]["Menufacturer"]);
                      print(_showresult[index]["Size"]);
                      print(_showresult[index]["Age_of_use"]);
                      print(_showresult[index]["Location"]);
                      print(_showresult[index]["Work_for"]);
                      print(_showresult[index]["Start_Enable_Date"]);
                      // print(_showresult[index]["Last_Improve_Date"]);
                      print(_showresult[index]["Count_Improve"]);
                      print(_showresult[index]["End_Date"]);
                      print(_showresult[index]["Note"]);
                      print(_showresult[index]["Working_Condition"]);
                      print(_showresult[index]["Status"]);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => detail(
                              
                                  Device: _showresult[index],
                                )),
                      );
                    },
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider();
              },
            ),
          ),
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
