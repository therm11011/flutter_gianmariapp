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
        automaticallyImplyLeading: false,
        elevation: 0.0,
        title: Text('Home',
         style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1) ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.secondaryColor,
        leading: 
          BackButton(
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
      ),
    
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          
        ],
        
      ),

    );
  }
}