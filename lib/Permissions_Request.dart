import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:permission_handler/permission_handler.dart';



class PermissionScreen extends StatefulWidget {
  @override
  _PermissionScreenState createState() => _PermissionScreenState();
}

class _PermissionScreenState extends State<PermissionScreen> {
  @override
  void initState() {
    super.initState();
    _requestPermissions();
  }

  Future<void> _requestPermissions() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.phone,
      Permission.microphone,
      Permission.contacts,
    ].request();

    if (statuses[Permission.phone] != PermissionStatus.granted) {
      _showPermissionDeniedDialog('Phone Calls');
    }
    if (statuses[Permission.microphone] != PermissionStatus.granted) {
      _showPermissionDeniedDialog('Microphone');
    }
    if (statuses[Permission.contacts] != PermissionStatus.granted) {
      _showPermissionDeniedDialog('Contacts');
    }
  }

  void _showPermissionDeniedDialog(String permissionName) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('$permissionName Permission Denied'),
        content: Text('The app needs $permissionName access for full functionality.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              openAppSettings(); // Open device settings to allow the user to grant permissions.
            },
            child: Text('Go to Settings'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Permission Request'),
      ),
      body: Center(
        child: Text('Requesting Permissions...'),
      ),
    );
  }
}
