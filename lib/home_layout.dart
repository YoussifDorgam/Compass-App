import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_compass/flutter_compass.dart';

class HomeLayoute extends StatefulWidget {
  const HomeLayoute({Key? key}) : super(key: key);

  @override
  State<HomeLayoute> createState() => _HomeLayouteState();
}

class _HomeLayouteState extends State<HomeLayoute> {
  double?  heading = 0 ;
  @override
  void initState() {
    super.initState();
    FlutterCompass.events!.listen((event) {
      setState((){
        heading = event.heading! ;
      });
    });
  }
  // done
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        title: const Text('Compass App',),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('${heading!.ceil()}°' ,
          style: const TextStyle(fontSize: 18 ,color: Colors.white , fontWeight: FontWeight.bold),),
          const SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset('assets/images/cadrant.png'),
                Transform.rotate(
                  angle: ((heading ?? 0 ) * (pi / 180) * -1 ),
                  child: Image.asset('assets/images/compass.png',scale: 1.1,),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
