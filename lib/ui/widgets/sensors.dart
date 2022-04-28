import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';


class Detail extends StatefulWidget {

  dynamic userDetail;
  Detail({Key? key, required this.userDetail}) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  Uint8List? myImage;
  dynamic x;
  List<double>? _accelerometerValues;

  //accelerometer
  final _streamSubscriptions = <StreamSubscription<dynamic>>[];
  void initState() {
    super.initState();
    _streamSubscriptions.add(
      accelerometerEvents.listen(
        (AccelerometerEvent event) {
          _accelerometerValues = <double>[event.x, event.y, event.z];
          x = _accelerometerValues?.first;

          if (x < -5 || x > 7) {
            return clearCard();
          }
        },
      ),
    );
  }

// gyroscope
  void clearCard() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Message'),
              content: const Text('Navigate to Sign Up page?'),
              actions: [
                Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      child: const Text('Yes'),
                      onPressed: () {
                         Navigator.of(context).pushReplacementNamed('signUpPage');
                      },
                    ),
                    MaterialButton(
                      child: const Text('No'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ))
              ],
            ));
  }

  @override
  void dispose() {
    super.dispose();
    for (final subscription in _streamSubscriptions) {
      subscription.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Grocery Market"),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.cyan, Colors.yellow],
                  stops: [0.5, 1.0],
                ),
              ),
            ),
            centerTitle: true),
        body: Center(
          child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 167, 190, 221),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Color.fromARGB(255, 166, 214, 181),
                  width: 5,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(children: <Widget>[
                  Container(
                    child: Text(
                      widget.userDetail['heading'],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 350,
                    height: 300,
                    child: Image.memory(
                      getImage(),
                      height: 200,
                      width: 200,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: 350,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 175, 206, 199),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    child: Text(widget.userDetail['message']),
                  ),
                  Container(
                    child: Text(widget.userDetail['price']),
                  ),
                  SizedBox(
                    width: 250,
                    height: 20,
                  ),
                  Container(
                    child: ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(13.0),
                                      side: BorderSide(
                                          color: Color.fromARGB(
                                              255, 15, 15, 15))))),
                      child: Text("BUY NOW"),
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed('signIpPage');
                      },
                    ),
                  ),
                ]),
              )),
        ));
  }

  getImage() {
    final UriData? _data = Uri.parse(widget.userDetail['selectedFile']).data;
    myImage = _data!.contentAsBytes();
    return myImage;
  }
}
