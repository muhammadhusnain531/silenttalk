import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:permission_handler/permission_handler.dart';


class RecordMessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Record Message'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Implement recording logic here
              },
              child: Text('Record New Message'),
            ),
            ElevatedButton(
              onPressed: () {
                // Implement predefined templates here
              },
              child: Text('Select from Templates'),
            ),
          ],
        ),
      ),
    );
  }
}
