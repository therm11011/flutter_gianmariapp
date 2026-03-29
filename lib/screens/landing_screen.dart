import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:gianmari_flutterapp/ui/colors.dart';
import 'package:gianmari_flutterapp/screens/home_screen.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  CameraController? _controller;
  Future<void>? _initializeControllerFuture;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    try {
      // 1. Get list of available cameras
      final cameras = await availableCameras();
      
      if (cameras.isEmpty) {
        setState(() => _hasError = true);
        return;
      }

      // 2. Initialize the first camera
      _controller = CameraController(
        cameras.first,
        ResolutionPreset.high,
        enableAudio: false, // Windows often hangs if audio permissions aren't clear
      );

      _initializeControllerFuture = _controller!.initialize();
      
      // 3. Refresh UI once initialization starts
      setState(() {}); 
    } catch (e) {
      debugPrint("Camera Error: $e");
      setState(() => _hasError = true);
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 100,
              backgroundColor: Colors.blue,
              child: ClipOval(
                child: SizedBox(
                  width: 300,
                  height: 300,
                  child: _buildCameraPreview(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text("Get Started"),
              onPressed: () async {
                if (_controller != null) {
                  await _controller!.dispose();
                  // Set to null so the UI doesn't try to use a dead controller
                  _controller = null; 
                }

                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );

                if(mounted){
                  // Re-initialize the camera when coming back to this screen
                  _initializeCamera();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCameraPreview() {
  if (_hasError) {
    return const Icon(Icons.videocam_off, color: Colors.white, size: 50);
  }

  return FutureBuilder<void>(
    future: _initializeControllerFuture,
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done && _controller != null) {
        // 1. Get the aspect ratio of the camera
        // On Windows, it's usually width / height (e.g., 1280 / 720)
        final double ratio = _controller!.value.aspectRatio;

        return FittedBox(
          fit: BoxFit.cover, // This crops the "widescreen" edges
          child: SizedBox(
            // 2. Define a base size that maintains the camera's ratio
            width: 100,
            height: 100 / ratio,
            child: CameraPreview(_controller!),
          ),
        );
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    },
  );
}
}