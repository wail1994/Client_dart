import 'dart:convert';
import 'dart:io';

import 'package:untitled1/untitled1.dart' as untitled1;

import 'dart:io';

Future main() async {

  String indexRequest = 'GET / HTTP/1.1\nConnection: close\n\n';

  //connect to google port 80
  Socket.connect("localhost", 80).then((socket) {
    print('Connected to: '
        '${socket.remoteAddress.address}:${socket.remotePort}');

    //Establish the onData, and onDone callbacks
    socket.listen((data) {
      print(new String.fromCharCodes(data).trim());
    },
        onDone: () {
          print("Done");
          socket.destroy();
        });

    //Send the request
    socket.write(indexRequest);
  });
}
