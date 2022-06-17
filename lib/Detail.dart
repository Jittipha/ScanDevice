import 'package:flutter/material.dart';

class detail extends StatefulWidget {
 detail({Key? key  ,required this.Device }) : super(key: key);
  Map<String,dynamic> Device ;

  @override
  State<detail> createState() => _detailState();
}

class _detailState extends State<detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("    รายละเอียดอุปกรณ์"),
      ),
      body: Center(),
    );
  }
}
