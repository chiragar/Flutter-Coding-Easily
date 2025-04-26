import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScrollToTopExample(),
    );
  }
}

class ScrollToTopExample extends StatelessWidget {
  ScrollToTopExample({super.key});

  final ScrollController _scrollController = ScrollController();

  // Static JSON data
  final List<Map<String, String>> data = [
    {
      "name": "John Doe",
      "image":
          "https://images.pexels.com/photos/30201180/pexels-photo-30201180/free-photo-of-coastal-waves-crashing-on-rocky-shoreline.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    },
    {
      "name": "Jane Smith",
      "image":
          "https://images.pexels.com/photos/296909/pexels-photo-296909.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    },
    {
      "name": "Sam Wilson",
      "image":
          "https://images.pexels.com/photos/20798992/pexels-photo-20798992/free-photo-of-person-sitting-on-beach-on-sea-shore.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    },
    {
      "name": "Lucy Gray",
      "image":
          "https://images.pexels.com/photos/29971507/pexels-photo-29971507/free-photo-of-tranquil-forest-scene-in-winter-england.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    },
    {
      "name": "John Doe",
      "image":
          "https://images.pexels.com/photos/30201180/pexels-photo-30201180/free-photo-of-coastal-waves-crashing-on-rocky-shoreline.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    },
    {
      "name": "Jane Smith",
      "image":
          "https://images.pexels.com/photos/296909/pexels-photo-296909.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    },
    {
      "name": "Sam Wilson",
      "image":
          "https://images.pexels.com/photos/20798992/pexels-photo-20798992/free-photo-of-person-sitting-on-beach-on-sea-shore.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    },
    {
      "name": "Lucy Gray",
      "image":
          "https://images.pexels.com/photos/29971507/pexels-photo-29971507/free-photo-of-tranquil-forest-scene-in-winter-england.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    },
    {
      "name": "John Doe",
      "image":
          "https://images.pexels.com/photos/30201180/pexels-photo-30201180/free-photo-of-coastal-waves-crashing-on-rocky-shoreline.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    },
    {
      "name": "Jane Smith",
      "image":
          "https://images.pexels.com/photos/296909/pexels-photo-296909.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    },
    {
      "name": "Sam Wilson",
      "image":
          "https://images.pexels.com/photos/20798992/pexels-photo-20798992/free-photo-of-person-sitting-on-beach-on-sea-shore.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    },
    {
      "name": "Lucy Gray",
      "image":
          "https://images.pexels.com/photos/29971507/pexels-photo-29971507/free-photo-of-tranquil-forest-scene-in-winter-england.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    },
    {
      "name": "John Doe",
      "image":
          "https://images.pexels.com/photos/30201180/pexels-photo-30201180/free-photo-of-coastal-waves-crashing-on-rocky-shoreline.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    },
    {
      "name": "Jane Smith",
      "image":
          "https://images.pexels.com/photos/296909/pexels-photo-296909.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    },
    {
      "name": "Sam Wilson",
      "image":
          "https://images.pexels.com/photos/20798992/pexels-photo-20798992/free-photo-of-person-sitting-on-beach-on-sea-shore.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    },
    {
      "name": "Lucy Gray",
      "image":
          "https://images.pexels.com/photos/29971507/pexels-photo-29971507/free-photo-of-tranquil-forest-scene-in-winter-england.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    },
    {
      "name": "John Doe",
      "image":
          "https://images.pexels.com/photos/30201180/pexels-photo-30201180/free-photo-of-coastal-waves-crashing-on-rocky-shoreline.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    },
    {
      "name": "Jane Smith",
      "image":
          "https://images.pexels.com/photos/296909/pexels-photo-296909.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    },
    {
      "name": "Sam Wilson",
      "image":
          "https://images.pexels.com/photos/20798992/pexels-photo-20798992/free-photo-of-person-sitting-on-beach-on-sea-shore.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    },
    {
      "name": "Lucy Gray",
      "image":
          "https://images.pexels.com/photos/29971507/pexels-photo-29971507/free-photo-of-tranquil-forest-scene-in-winter-england.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Listview Faster & Better',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 24,
            ),
          ),
          backgroundColor: const Color(0xFFFFB347)),
      body: Stack(
        children: [
          // ListView with name and image
          ListView.builder(
            shrinkWrap: true,
            controller: _scrollController,
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ResponsiveImage(imageUrls: data[index]['image']!),
                  Text(data[index]['name']!),
                ],
              );
            },
          ),
          // ScrollToTopButton
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ScrollToTopButton(scrollController: _scrollController),
            ),
          ),
        ],
      ),
    );
  }
}

class ScrollToTopButton extends StatefulWidget {
  final ScrollController scrollController;

  const ScrollToTopButton({super.key, required this.scrollController});

  @override
  State<ScrollToTopButton> createState() => _ScrollToTopButtonState();
}

class _ScrollToTopButtonState extends State<ScrollToTopButton> {
  bool _showScrollingToTopButton = false;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    bool showScrollingToTopButton = widget.scrollController.offset > 100;
    if (showScrollingToTopButton != _showScrollingToTopButton) {
      setState(() {
        _showScrollingToTopButton = showScrollingToTopButton;
      });
    }
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_scrollListener); // Remove listener
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _showScrollingToTopButton
        ? FloatingActionButton(
            onPressed: () {
              widget.scrollController.animateTo(
                0.0,
                curve: Curves.easeIn,
                duration: const Duration(milliseconds: 300),
              );
            },
            child: const Icon(Icons.arrow_upward),
          )
        : const SizedBox.shrink();
  }
}

class ResponsiveImage extends StatelessWidget {
  final String imageUrls;
  const ResponsiveImage({super.key, required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    // Get the screen size and device pixel ratio
    var size = MediaQuery.sizeOf(context);
    var pexels = MediaQuery.devicePixelRatioOf(context);

    // Calculate the width dynamically
    String imageUrl = "$imageUrls?w=${(size.width * pexels).toInt()}";

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
