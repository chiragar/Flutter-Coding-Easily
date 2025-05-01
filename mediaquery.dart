import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 1. Get Screen Size
    Size screenSize = MediaQuery.of(context).size;

    // 2. Get Device Orientation
    Orientation orientation = MediaQuery.of(context).orientation;

    // 3. Get Device Padding (Safe Areas)
    EdgeInsets padding = MediaQuery.of(context).padding;

    // 4. Get Device Pixel Ratio (DPI)
    double pixelRatio = MediaQuery.of(context).devicePixelRatio;

    // 5. Get Text Scale Factor
    double textScaleFactor = MediaQuery.of(context).textScaleFactor;

    // 6. Check for Accessibility Features (e.g., Always Use 24-Hour Format)
    bool accessibilityMode = MediaQuery.of(context).alwaysUse24HourFormat;

    // 7. Check for High Contrast Mode
    bool highContrast = MediaQuery.of(context).highContrast;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('MediaQuery Example')),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Screen Size Example
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Screen Width: ${screenSize.width}',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    'Screen Height: ${screenSize.height}',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),

              // Orientation Example
              Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Orientation: ${orientation == Orientation.portrait ? 'Portrait' : 'Landscape'}',
                  style: TextStyle(fontSize: 20),
                ),
              ),

              // Safe Area Padding Example
              Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Top Padding: ${padding.top}\nBottom Padding: ${padding.bottom}',
                  style: TextStyle(fontSize: 20),
                ),
              ),

              // Pixel Ratio Example
              Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Device Pixel Ratio: $pixelRatio',
                  style: TextStyle(fontSize: 20),
                ),
              ),

              // Text Scale Factor Example
              Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Text Scale Factor: $textScaleFactor',
                  style: TextStyle(fontSize: 20),
                ),
              ),

              // Accessibility Mode Example
              Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Accessibility Mode (24-hour format): $accessibilityMode',
                  style: TextStyle(fontSize: 20),
                ),
              ),

              // High Contrast Mode Example
              Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'High Contrast Mode: $highContrast',
                  style: TextStyle(fontSize: 20),
                ),
              ),

              // Responsive Text Size Example
              Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Responsive Text Size: ${(screenSize.width * 0.05).toStringAsFixed(2)}',
                  style: TextStyle(fontSize: screenSize.width * 0.05),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
