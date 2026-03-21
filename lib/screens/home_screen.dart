import 'package:flutter/material.dart';
import 'package:gianmari_flutterapp/ui/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Home',
         style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1) ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.secondaryColor,
        actions: [
          IconButton(
            onPressed: () {
              // Handle search action
            },
            icon: Icon(Icons.settings, color: Color.fromRGBO(255, 255, 255, 1)),
          ),
          ],
      ),


      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
              child: Container(
                width: 100,
                height: 100,
                color: Colors.white,
              ),
            ),
             Card(
              child: Container(
                width: 100,
                height: 100,
                color: Colors.white,
              ),
            ),
             Card(
              child: Container(
                width: 100,
                height: 100,
                color: Colors.white,
              ),
            ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
              child: Container(
                width: 100,
                height: 100,
                color: Colors.white,
              ),
            ),
             Card(
              child: Container(
                width: 100,
                height: 100,
                color: Colors.white,
              ),
            ),
             Card(
              child: Container(
                width: 100,
                height: 100,
                color: Colors.white,
              ),
            ),
            ],
          ),
        ],
        
      ),

    );
  }
}