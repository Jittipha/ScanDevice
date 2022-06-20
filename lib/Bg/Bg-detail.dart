// ignore_for_file: file_names, unused_local_variable

import 'package:flutter/material.dart';
class Background extends StatelessWidget {
  final Widget child;
  const Background({Key? key, required this.child,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // ignore: sized_box_for_whitespace
    return Container (
      height: MediaQuery.of(context).size.height,
         width: MediaQuery.of(context).size.width,
        //  child: Image.network("https://media.discordapp.net/attachments/919218109334814750/983557478023303189/Group_152.png?width=861&height=612"),
         decoration: const BoxDecoration(
            gradient:
          //  LinearGradient(colors: [Color.fromARGB(255, 230, 246, 214), Color.fromARGB(255, 120, 187, 242)]),
            LinearGradient(begin: Alignment(-1,-1),
                end: Alignment(0.2,0),
                colors: [Color.fromARGB(255, 230, 246, 214), Color.fromARGB(255, 120, 187, 242)]
                )
                ),
          
      // decoration: const BoxDecoration(color: Color.fromARGB(255, 30, 150, 140)),
      child: Stack(
        
        alignment: Alignment.center,
        children: [
          // Positioned(
          //   // right: 0,
          //   // bottom: 0,
          //   // top: 0,
          //   // left: 0,
          //   // width: 1920,
          //   // height:30000,
          //   // child: Image.network("https://media.discordapp.net/attachments/919218109334814750/983557478023303189/Group_152.png?width=861&height=612"),
          // ),
          child
        ],
      ),
    );
  }
}
