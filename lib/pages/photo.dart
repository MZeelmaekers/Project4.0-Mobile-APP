import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';




class TakePictureScreen extends StatefulWidget {
  final CameraDescription camera;

  const TakePictureScreen({
    Key? key, required this.camera
  }) : super(key: key);

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Fill this out in the next steps.
    return Scaffold(
      appBar: AppBar(title: const Text('Take a picture')),
      // You must wait until the controller is initialized before displaying the
      // camera preview. Use a FutureBuilder to display a loading spinner until the
      // controller has finished initializing.
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            return Center(
              child: Column(
                children: [
                  CameraPreview(_controller),
                  Center(
                    child: ElevatedButton(
                  
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(60, 60),
  	                    shape: new RoundedRectangleBorder(
    	                  borderRadius: new BorderRadius.circular(180.0),
                        ),
                      ),

                      // Provide an onPressed callback.
                      onPressed: () async {
                        // Take the Picture in a try / catch block. If anything goes wrong,
                        // catch the error.
                        try {
                          // Ensure that the camera is initialized.
                          await _initializeControllerFuture;

                          // Attempt to take a picture and then get the location
                          // where the image file is saved.
                          final image = await _controller.takePicture();
                        } catch (e) {
                          // If an error occurs, log the error to the console.
                          print(e);
                        }
                      },
                      
                      child: const Icon(Icons.camera_alt),
                    ),
                  )
                ],
              ),
            );
          } else {
            // Otherwise, display a loading indicator.
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
