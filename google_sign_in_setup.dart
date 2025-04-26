// 📄 google_sign_in_setup.dart
//
// Complete Guide: Google Sign-In Integration + Keystore Setup + Build Configurations

import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthService {
  // Initialize GoogleSignIn
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Google Login Method
  Future<void> googleLogin() async {
    print("Google Login method called");

    try {
      final result = await _googleSignIn.signIn();
      if (result != null) {
        print("Login Successful!");
        print("User Info: ${result.displayName}, ${result.email}");
      } else {
        print("Login Cancelled by User.");
      }
    } catch (error) {
      print("Login Failed: $error");
    }
  }
}

/*
------------------------------------------------------------
🔑 Keystore Generation (Command Line)
------------------------------------------------------------

Run the following command to create an upload keystore:

keytool -genkey -v -keystore f:\upload-keystore1.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias uploadkeystore1

✅ Notes:
- Choose a secure password.
- Save the keystore safely; needed for Google Play uploads.
- Adjust file path and alias as needed.

------------------------------------------------------------
⚙️ Configure Keystore in android/app/build.gradle
------------------------------------------------------------

Inside android { } block, add:

signingConfigs {
    debug {
        keyAlias 'uploaddebug'
        keyPassword 'android'
        storeFile file('upload-keystore.jks')
        storePassword 'android'
    }
    release {
        keyAlias 'uploadkeystore1'
        keyPassword 'your_key_password_here'
        storeFile file('f:/upload-keystore1.jks') // Provide correct path
        storePassword 'your_keystore_password_here'
    }
}

buildTypes {
    release {
        signingConfig signingConfigs.release
        minifyEnabled false
        shrinkResources false
        proguardFiles getDefaultProguardFile('proguard-android-optimize.txt'), 'proguard-rules.pro'
    }
}

------------------------------------------------------------
📜 To Get SHA-1 and SHA-256 Fingerprints
------------------------------------------------------------

Run this command inside your Flutter project root:

./gradlew signingReport

✅ It will generate:
- SHA-1
- SHA-256
- MD5

⚡ Important for setting up Firebase, Google Sign-In OAuth, etc.

------------------------------------------------------------
*/

