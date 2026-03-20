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
          Center(
            child: Text(
              'Welcome to the Home Screen!',
              style: TextStyle(
                color: AppColors.textColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),

    );
  }
}