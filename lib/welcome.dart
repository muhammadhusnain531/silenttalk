import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:silenttalk/Home_Screen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to CallGuard'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome! Please Sign Up or Log In to Continue.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setBool('isFirstLaunch', false);

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              child: Text('Sign Up / Log In'),
            ),
            // Add buttons for Social Login (Google, Facebook, etc.)
            ElevatedButton(
              onPressed: () {
                // Add Google, Apple, or Facebook login functionality here
              },
              child: Text('Login with Google'),
            ),
          ],
        ),
      ),
    );
  }
}
