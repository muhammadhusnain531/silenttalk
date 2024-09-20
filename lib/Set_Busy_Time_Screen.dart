import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:permission_handler/permission_handler.dart';


class BusyTimeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Set Busy Time'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Preset time options logic here
              },
              child: Text('30 Minutes'),
            ),
            ElevatedButton(
              onPressed: () {
                // Custom time logic using TimePicker here
              },
              child: Text('Custom Time'),
            ),
          ],
        ),
      ),
    );
  }
}
