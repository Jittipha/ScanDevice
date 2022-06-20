// ignore_for_file: file_names, must_be_immutable, camel_case_types, non_constant_identifier_names, avoid_unnecessary_containers

import 'package:bluetooth/Bg/Bg-detail.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        // backgroundColor: Colors.lightBlue[100],
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 18, 95, 116),
            title: const SizedBox(
              width: 200,
              child: Text(
                "รายละเอียดอุปกรณ์",
                style: TextStyle(fontSize: 20),
              ),
            ),
            // titleSpacing: 20
            ),
        body:Background (
          child: Container(
            // height: double.infinity,
            // width: double.infinity,
            // decoration: const BoxDecoration(
            //   image: DecorationImage(
            //       image: NetworkImage(
            //           // "https://images.unsplash.com/photo-1606230535080-45fdf9d56512?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1331&q=80"
            //           "https://images.unsplash.com/photo-1614851099175-e5b30eb6f696?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"
            //           ),
            //       fit: BoxFit.cover),
            // ),
            child: Center(
              child: SingleChildScrollView(
                child: Container(
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

                  //        decoration: BoxDecoration(

                  // borderRadius: BorderRadius.circular(10),
                  // color: const Color.fromARGB(250, 255, 255, 255),
                  // ),
                  width: 300,
                  height: 400,
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                  child: ListView(children: <Widget>[
                    Text(
                      // ignore: prefer_interpolation_to_compose_strings
                      'รหัสเครื่อง : ' + widget.Device['Track_ID'],
                      style: GoogleFonts.alike(
                        textStyle: Theme.of(context).textTheme.displayMedium,
                        fontSize: 20,color: Colors.black
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      // ignore: prefer_interpolation_to_compose_strings
                      'ยี่ห้อ : ' + widget.Device['Brand'],
                      style: GoogleFonts.alike(
                        textStyle: Theme.of(context).textTheme.displayMedium,
                        fontSize: 20,color: Colors.black
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      // ignore: prefer_interpolation_to_compose_strings
                      'รุ่น : ' + widget.Device['Generation'],
                     style: GoogleFonts.alike(
                        textStyle: Theme.of(context).textTheme.displayMedium,
                        fontSize: 20,color: Colors.black
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      // ignore: prefer_interpolation_to_compose_strings
                      'ผู้ผลิต : ' + widget.Device['Menufacturer'],
                      style: GoogleFonts.alike(
                        textStyle: Theme.of(context).textTheme.displayMedium,
                        fontSize: 20,color: Colors.black
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      // ignore: prefer_interpolation_to_compose_strings
                      'ขนาดเครื่อง : ' + widget.Device['Size'],
                      style: GoogleFonts.alike(
                        textStyle: Theme.of(context).textTheme.displayMedium,
                        fontSize: 20,color: Colors.black
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      // ignore: prefer_interpolation_to_compose_strings
                      'สภาพการใช้งาน : ' + widget.Device['Working_Condition'],
                      style: GoogleFonts.alike(
                        textStyle: Theme.of(context).textTheme.displayMedium,
                        fontSize: 20,color: Colors.black
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      // ignore: prefer_interpolation_to_compose_strings
                      'อายุการใช้งาน : ' +
                          widget.Device['Age_of_use'].toString(),
                      style: GoogleFonts.alike(
                        textStyle: Theme.of(context).textTheme.displayMedium,
                        fontSize: 20,color: Colors.black
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      // ignore: prefer_interpolation_to_compose_strings
                      'ตำเเหน่งที่ตั้ง : ' + widget.Device['Location'],
                      style: GoogleFonts.alike(
                        textStyle: Theme.of(context).textTheme.displayMedium,
                        fontSize: 20,color: Colors.black
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      // ignore: prefer_interpolation_to_compose_strings
                      'ใช้ในการ : ' + widget.Device['Work_for'],
                      style: GoogleFonts.alike(
                        textStyle: Theme.of(context).textTheme.displayMedium,
                        fontSize: 20,color: Colors.black
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      // ignore: prefer_interpolation_to_compose_strings
                      'วันเปิดใช้งาน : ' + widget.Device['Start_Enable_Date'],
                      style: GoogleFonts.alike(
                        textStyle: Theme.of(context).textTheme.displayMedium,
                        fontSize: 20,color: Colors.black
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      // ignore: prefer_interpolation_to_compose_strings
                      'จำนวนครั้งที่ซ่อม : ' +
                          (widget.Device['Count_Improve'].toString()),
                      style: GoogleFonts.alike(
                        textStyle: Theme.of(context).textTheme.displayMedium,
                        fontSize: 20,color: Colors.black
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    // Text(
                    //   // ignore: prefer_interpolation_to_compose_strings
                    //   'วันที่ปรับปรุงล่าสุด : ' +
                    //       (widget.Device['Last_Improve_Date'] ?? '- - -'),
                    //   style: GoogleFonts.alike(
                    //     textStyle: Theme.of(context).textTheme.displayMedium,
                    //     fontSize: 20,color: Colors.black
                    //   ),
                    // ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      // ignore: prefer_interpolation_to_compose_strings
                      'วันที่สิ้นสุดงาน : ' +
                          (widget.Device['End_Date'] ?? '- - -'),
                      style: GoogleFonts.alike(
                        textStyle: Theme.of(context).textTheme.displayMedium,
                        fontSize: 20,color: Colors.black
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      // ignore: prefer_interpolation_to_compose_strings
                      'หมายเหตุ : ' + (widget.Device['Note'] ?? '- - -'),
                      style: GoogleFonts.alike(
                        textStyle: Theme.of(context).textTheme.displayMedium,
                        fontSize: 20,color: Colors.black
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ]),

                ),
              ),
            ),
          ),
        ));
  }
}
