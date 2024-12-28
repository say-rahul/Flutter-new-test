import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _state = 0.0;
  int count = 0; // Variable to keep track of the count
  double Abc = 50;
  String message="";
  String abname="My App";
  String tname="Welcome";
  String blah="Count";
  
  
   // Initial size of the heart icon

  // Function to increment count and trigger rotation
  void changestate() {
    setState(() {
      _state += 25.0;
      count++; // Increment count when the button is pressed
      if (count >= 40 && count < 50) {
        message = "Glad"; // Display "Glad" when count reaches 40
      } else if (count >= 50) {
        count = 0; // Reset count to 0 after 45 clicks
        Abc = 50; // Reset the size of the heart icon
        message = "";
        _state = 0.0;
      }
       if (count >= 19) {
        abname="Glad";
        tname="Glad";
        blah="glad";
        Abc += 30; // Increase the size of the heart icon
      } // Increase the size of the heart icon
      if (Abc > 1500) {
        Abc = 100; // Limit the size to 100
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        
        appBar: AppBar(
          backgroundColor: Colors.yellow[400],
          title: Text(
            abname,
            style: TextStyle(fontFamily: "PlayfairDisplay-VariableFont_wght"),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Rotating container with heart widget when count is 20
              Transform.rotate(
                angle: _state,
                child: Container(
                  height: 300,
                  width: 300,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.yellow[300],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: count >= 19
                      ? Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: Abc, // Dynamic size of heart icon
                        ) // Display heart icon when count is 19
                      : Text(
                          tname,
                          style: TextStyle(fontSize: 24),
                        ),
                ),
              ),
              const SizedBox(height: 20),
              // Display the count
              Text(
                "$blah: $count",
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 20),
              // Display the message if count reaches 40
              Text(
                message,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.yellow[50],
        floatingActionButton: FloatingActionButton(
          onPressed: changestate, // Call changestate when pressed
          backgroundColor: Colors.yellow[400],
          child: const Text("R"), // Text widget for button 
        ),
      ),
    );
  }
}
