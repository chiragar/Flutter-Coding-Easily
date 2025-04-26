// 📄 flutter_common_helpers.dart
//
// Common Flutter Functionalities, Snippets, and Best Practices
// Organized for Quick Reference and Reuse

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:intl/intl.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:convert';

void main() {
  // Entry point for test snippets if needed
}

/*
------------------------------------------------------------
🔷 Share Resume Link
------------------------------------------------------------
*/

Share.share(
  "${Constant.STORAGE_PATH + data['resume']}",
  subject: 'Resume',
);

/*
------------------------------------------------------------
🔷 RichText Example (Rate Buyer Heading)
------------------------------------------------------------
*/

Container(
  margin: EdgeInsets.only(top: size.height * 0.02),
  child: RichText(
    text: TextSpan(
      children: [
        TextSpan(
          text: "Rate",
          style: textTheme.headline6!.copyWith(
            color: themeColor.primaryColor,
          ),
        ),
        TextSpan(
          text: " Buyer",
          style: textTheme.headline6,
        ),
      ],
    ),
  ),
);

/*
------------------------------------------------------------
🔷 Cached Network Image (Circular Avatar)
------------------------------------------------------------
*/

CachedNetworkImage(
  imageUrl: Constant.STORAGE_PATH + jobDetail['consumer_avatar'],
  imageBuilder: (context, imageProvider) => Container(
    width: size.width * 0.15,
    height: size.width * 0.15,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(
        image: imageProvider,
        fit: BoxFit.cover,
      ),
    ),
  ),
  placeholder: (context, url) => Center(
    child: SizedBox(
      width: 40.0,
      height: 40.0,
      child: CircularProgressIndicator(),
    ),
  ),
  errorWidget: (context, url, error) => Image.asset(
    "assets/icons/app-icon.png",
    width: size.width * 0.15,
    height: size.width * 0.15,
    fit: BoxFit.contain,
  ),
);

/*
------------------------------------------------------------
🔷 Firebase Timestamp to Date/Time Conversion
------------------------------------------------------------
*/

print(
  DateFormat.yMd().format(
    DateTime.fromMicrosecondsSinceEpoch(
      firedata[0]['start_time'].microsecondsSinceEpoch,
    ),
  ),
); // Output: 2/26/2022

print(
  DateFormat.jm().format(
    DateTime.fromMicrosecondsSinceEpoch(
      firedata[0]['start_time'].microsecondsSinceEpoch,
    ),
  ),
); // Output: 11:59 AM

/*
------------------------------------------------------------
🔷 Number Formatting Example
------------------------------------------------------------
*/

void formatNumbers() {
  var longnum = 100500064965849;
  var num = 10000000;
  var longnum2 = 87965100421;
  NumberFormat myFormat = NumberFormat.decimalPattern('en_us');

  print(myFormat.format(longnum));
  print(myFormat.format(num));
  print(myFormat.format(longnum2));
}
// Output:
// 100,500,064,965,849
// 10,000,000
// 87,965,100,421

/*
------------------------------------------------------------
🔷 JSON Parsing and Loop Examples
------------------------------------------------------------
*/

// JSON List Parsing
for (var i in data) {
  categories.add(Categories.fromJson(i));
}

// JSON Image List Parsing
for (var e in json.decode(widget.categorys['image_gallery'])) {
  previousWorkImages.add(e);
  previousWorkImagesPath.add(e);
}

/*
------------------------------------------------------------
🔷 Miscellaneous Flutter Tips
------------------------------------------------------------
*/

// Safe casting for Position
currentPosition = LatLng(
  addresses.first.coordinates.latitude,
  addresses.first.coordinates.longitude,
) as Position?;

// Accessing Firestore Data Properly
String name = snapshot.data!.get('name');
String name2 = (snapshot.data!.data() as Map<String, dynamic>)['name'] ?? '';
Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
String name3 = data['name'] ?? '';
String name4 = doc.data()!['name'] ?? '';

// Type casting in Widgets
final List<Widget>? actions;
children: actions as List<Widget>;

// Null Safety Issue Fix (Legacy Packages)
/// Solution:
/// Add this at top of main.dart:
/// // @dart=2.9
/// // ignore: import_of_legacy_library_into_null_safe

/*
------------------------------------------------------------
🔷 ListView.builder Variations
------------------------------------------------------------
*/

ListView.builder(
  reverse: true, // Reverse List Order
  shrinkWrap: true,
  itemBuilder: (context, i) {
    if (i < 2) return _buildBox(color: Colors.blue);
    if (i == 3) return _horizontalListView();
    return _buildBox(color: Colors.blue);
  },
);

/*
------------------------------------------------------------
🔷 Launch Social Media Links
------------------------------------------------------------
*/

_launchSocial('https://www.instagram.com/YOURNAME/', '');
_launchSocial('fb://profile/408834569303957', 'https://www.facebook.com/dorockxl');

/*
------------------------------------------------------------
🔷 iOS URL Scheme Setup (Info.plist)
------------------------------------------------------------
*/

/// Inside iOS/Runner/Info.plist
/*
<key>CFBundleURLTypes</key>
<array>
  <dict>
    <key>CFBundleURLSchemes</key>
    <array>
      <string>fb408834569303957</string>
    </array>
  </dict>
</array>
*/

/*
------------------------------------------------------------
🔷 Test Ad Unit IDs (Google)
------------------------------------------------------------
*/

// App Open Ad: ca-app-pub-3940256099942544/3419835294
// Banner Ad: ca-app-pub-3940256099942544/6300978111
// Interstitial: ca-app-pub-3940256099942544/1033173712
// Rewarded: ca-app-pub-3940256099942544/5224354917
// Native Advanced: ca-app-pub-3940256099942544/2247696110

/*
------------------------------------------------------------
🔷 Flutter JSON Model Example
------------------------------------------------------------
*/

class Welcome {
  List<Post>? posts;
  List<Comment>? comments;
  Profile? profile;

  Welcome({
    this.posts,
    this.comments,
    this.profile,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    posts: List<Post>.from(json["posts"].map((x) => Post.fromJson(x))),
    comments: List<Comment>.from(json["comments"].map((x) => Comment.fromJson(x))),
    profile: Profile.fromJson(json["profile"]),
  );

  Map<String, dynamic> toJson() => {
    "posts": List<dynamic>.from(posts!.map((x) => x.toJson())),
    "comments": List<dynamic>.from(comments!.map((x) => x.toJson())),
    "profile": profile!.toJson(),
  };
}

/*
------------------------------------------------------------
🔷 Navigator Usage
------------------------------------------------------------
*/

Navigator.of(context, rootNavigator: true).pop();

/*
------------------------------------------------------------
🔷 Android Manifest Permissions (Android/app/src/main/AndroidManifest.xml)
------------------------------------------------------------
*/

/// <uses-permission android:name="android.permission.VIBRATE" />
/// <uses-permission android:name="android.permission.INTERNET" />
/// <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
/// <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
/// <uses-permission android:name="android.permission.CAMERA" />
/// <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
/// <uses-permission android:name="android.permission.WAKE_LOCK" />
/// <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
/// <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />
/// <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />

/*
------------------------------------------------------------
🔷 Flutter Useful Commands
------------------------------------------------------------
*/

// flutter upgrade
// flutter upgrade --force
// flutter downgrade
// dart pub get
// dart fix --dry-run
// dart fix --apply
// flutter doctor -v
// dart migrate
// flutter channel stable
// flutter build appbundle
// ./gradlew signingReport (Get SHA1 key)

/*
------------------------------------------------------------
🔷 Android 12 Update Important
------------------------------------------------------------
*/

// Add android:exported="true" to all Activities in Manifest

/*
------------------------------------------------------------
🔷 Recommended Plugins
------------------------------------------------------------
*/

// https://pub.dev/packages/pay (Google & Apple Pay)
// https://pub.dev/packages/intl (Internationalization)
// https://pub.dev/packages/image_picker (Pick images/files)

/*
------------------------------------------------------------
🔷 Helpful Resources
------------------------------------------------------------
*/

// Flutter: 
// - https://flutterappworld.com/
// - https://fluttertutorial.in/
// - https://fluttermarket.com/
// - https://flutterpolice.com/
// - https://www.fluttercampus.com/
// - https://fluttershapemaker.com/

// Android:
// - https://uniqueandrocode.com/
// - https://askandroidquestions.com/

// Tools:
// - https://www.pngegg.com/ (Free PNG Images)
// - https://pravatar.cc/ (Random User Avatars)
// - https://www.instastorysaver.com/ (YouTube Playlist Downloader)

// Flutter Learning:
// - https://gallery.flutter.dev/#/
// - https://flutter.github.io/samples/#
// - https://petercoding.com/
// - https://codewithandrea.com/
// - https://cybdom.tech/page/2/ (Flutter Ready UI)
// - https://blog.devgenius.io/firebase-flutter-dynamic-links-step-by-step-guide-630402ee729b
// - https://medium.flutterdevs.com/chatbot-in-flutter-using-dialogflow-70e28665a827
