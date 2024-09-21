import 'package:flutter/material.dart';
import 'dart:async'; // For using the Timer

class SetBusyTimeScreen extends StatefulWidget {
  @override
  _SetBusyTimeScreenState createState() => _SetBusyTimeScreenState();
}

class _SetBusyTimeScreenState extends State<SetBusyTimeScreen> {
  Timer? busyTimer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Set Busy Time'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              // Logic for setting 30 minutes busy time
              setBusyTime(30);
            },
            child: Text('30 Minutes'),
          ),
          ElevatedButton(
            onPressed: () {
              // Navigate to Custom Time selection screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CustomTimeScreen(),
                ),
              ).then((selectedMinutes) {
                // After returning from custom time screen
                if (selectedMinutes != null) {
                  setBusyTime(selectedMinutes);
                }
              });
            },
            child: Text('Custom Time'),
          ),
        ],
      ),
    );
  }

  // Function to handle setting busy time
  void setBusyTime(int minutes) {
    print('Busy time set for $minutes minutes');

    // If any previous busyTimer is running, cancel it
    busyTimer?.cancel();

    // Activate busy mode and set timer for deactivation
    setState(() {
      busyTimer = Timer(Duration(minutes: minutes), () {
        // Deactivate busy mode after the time period ends
        print('Busy mode deactivated');
      });
    });

    // Show a snackbar to notify the user
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Busy time set for $minutes minutes')),
    );
  }

  @override
  void dispose() {
    // Cancel timer if the screen is disposed
    busyTimer?.cancel();
    super.dispose();
  }
}

// Custom time screen with time picker
class CustomTimeScreen extends StatefulWidget {
  @override
  _CustomTimeScreenState createState() => _CustomTimeScreenState();
}

class _CustomTimeScreenState extends State<CustomTimeScreen> {
  TimeOfDay? selectedTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Custom Time'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                // Show Time Picker
                TimeOfDay? pickedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );

                if (pickedTime != null) {
                  setState(() {
                    selectedTime = pickedTime;
                  });

                  // Calculate custom time duration in minutes
                  int customTimeInMinutes = _calculateMinutesDifference(pickedTime);

                  // Return the custom time to the previous screen
                  Navigator.pop(context, customTimeInMinutes);
                }
              },
              child: Text('Pick Custom Time'),
            ),
            if (selectedTime != null)
              Text(
                'Selected Time: ${selectedTime!.format(context)}',
                style: TextStyle(fontSize: 16),
              ),
          ],
        ),
      ),
    );
  }

  // Function to calculate the difference between current time and the picked time in minutes
  int _calculateMinutesDifference(TimeOfDay pickedTime) {
    final now = TimeOfDay.now();
    int nowMinutes = now.hour * 60 + now.minute;
    int pickedMinutes = pickedTime.hour * 60 + pickedTime.minute;

    // If picked time is earlier in the day than the current time, assume it is for the next day
    if (pickedMinutes < nowMinutes) {
      pickedMinutes += 24 * 60; // Add 24 hours in minutes
    }

    return pickedMinutes - nowMinutes;
  }
}

// New BusyTimeScreen class
class BusyTimeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Busy Time Screen'),
      ),
      body: Center(
        child: Text('Busy Time Screen'),
      ),
    );
  }
}
