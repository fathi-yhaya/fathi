import 'package:flutter/material.dart';
import 'dep_list.dart';

void main() {
  runApp(Solqsh());
}

class Solqsh extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DepList()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0E6D2),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          
            Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white, 
              ),
              child: Icon(
                Icons.check_circle_outline, 
                color: Colors.red, 
                size: 150,
              ),
            ),
            SizedBox(height: 20),

            
            Text(
              'التحضير اليومي',
              style: TextStyle(
                fontSize: 30, 
                color: Colors.red, 
                fontWeight: FontWeight.bold, 
              ),
            ),
            SizedBox(height: 100), 
          ],
        ),
      ),
    );
  }
}
