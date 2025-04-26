import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Image Network Example'),
        ),
        body: const Center(
          child: ResponsiveImage(),
        ),
      ),
    );
  }
}

class ResponsiveImage extends StatelessWidget {
  const ResponsiveImage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen size and device pixel ratio
    var size = MediaQuery.sizeOf(context);
    var pexels = MediaQuery.devicePixelRatioOf(context);

    // Define the base image URL
    String baseUrl =
        "https://images.pexels.com/photos/30201180/pexels-photo-30201180/free-photo-of-coastal-waves-crashing-on-rocky-shoreline.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";

    // Calculate the width dynamically
    String imageUrl = "$baseUrl?w=${(size.width * pexels).toInt()}";

    return Image.network(
      imageUrl,
      loadingBuilder: (context, child, progress) {
        if (progress == null) {
          return child;
        } else {
          return const CircularProgressIndicator();
        }
      },
      errorBuilder: (context, error, stackTrace) {
        return const Icon(Icons.error, size: 50);
      },
    );
  }
}
