import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = 'loading';

  void setupWorldTime() async {
    WorldTime _worldTime = WorldTime(
        location: 'Jakarta',
        flag: 'indonesia',
        url: 'Asia/Jakarta'
    );
    await _worldTime.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': _worldTime.location,
      'flag': _worldTime.flag,
      'time': _worldTime.time,
      'isDayTime': _worldTime.isDayTime
    });
  }
  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: const Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 80,
        ),
      )
    );
  }
}
