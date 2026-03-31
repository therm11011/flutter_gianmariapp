import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:gianmari_flutterapp/ui/colors.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        title: Text(
          'Home',
          style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),
        ),
        centerTitle: true,
        backgroundColor: AppColors.secondaryColor,
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      body: Container(
        height: screenHeight,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: screenWidth * 0.2,
              color: Colors.grey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Name',
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 12.0,
                      ),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Email Address',
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 12.0,
                      ),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                children: [
                  _screenBlock(screenHeight * 0.3, Colors.blue, 'Grid Layout'),
                  _screenBlock(screenHeight * 0.3, Colors.green, 'Filters'),
                  _screenBlock(screenHeight * 0.4, Colors.orange, 'Background'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _navBarItem(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _screenBlock(double height, Color color, String label) {
    return Container(
      height: height,
      color: color,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _screenBlockTitleSection(label, 'This is the $label section'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _screenBlockTitleSection(String label, String description) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    label,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  description,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                )
              ],
              ),
          ),
          Expanded(
            child: FlutterCarousel(
                    options: FlutterCarouselOptions(
                      height: screenHeight * 0.25,
                      showIndicator: true,
                      slideIndicator: CircularSlideIndicator(),
                    ),
                    items: [1,2,3,4,5].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              color: Colors.amber
                            ),
                            child: Text('text $i', style: TextStyle(fontSize: 16.0),)
                          );
                        },
                      );
                    }).toList(),
                  )
        
          )
          
          
        ],
        )
    );
  }
}
      // ListTile(
      //   title: Text(label, style: TextStyle(color: Colors.white, fontSize: 24)),
      //   subtitle: Text('This is $label', style: TextStyle(color: Colors.white70)),
      // ),