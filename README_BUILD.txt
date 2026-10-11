WORLD PROFESSION HUB — ANDROID STUDIO PROJECT (Varssity)
========================================================

PROJECT CONTENTS
- Android app module using Kotlin + WebView
- 94 profession categories
- 35,000 directory entries in the current JSON/HTML data
- Search and A–Z category sorting
- Website cards include a title, URL, and usefulness description
- No login required
- External links open in the phone's browser

IMPORTANT DATA NOTE
The 35,000 entries are NOT all independently verified unique websites. This dataset includes a large profession-specific discovery/search-links section. Check links and usefulness before treating them as verified website listings.

REQUIREMENTS
- Android Studio (recent version recommended)
- JDK 17 (Android Studio's bundled JBR is normally suitable)
- Internet for the first Gradle download and Android SDK setup
- Android SDK Platform 35 installed (Android Studio can install it when prompted)

BUILD AN APK ON WINDOWS
1. Extract this ZIP completely.
2. In Android Studio, choose Open and select the extracted folder named World_Profession_Hub_Android.
3. Let Android Studio finish indexing. If Gradle sync fails because it cannot find Gradle, open Terminal in the project root and run:
      gradlew.bat --version
   This project includes a bootstrap script that downloads Gradle 8.9 to your user Gradle folder on the first run. It requires internet access.
4. In the same terminal, build the debug APK:
      gradlew.bat assembleDebug
5. After a successful build, the APK is at:
      app\build\outputs\apk\debug\app-debug.apk
6. Alternatively, after project sync use Build > Build Bundle(s) / APK(s) > Build APK(s).

BUILD AN APK ON macOS / LINUX
1. Extract and open the project folder.
2. In a terminal at the project root run:
      ./gradlew --version
      ./gradlew assembleDebug
3. APK output:
      app/build/outputs/apk/debug/app-debug.apk

PROJECT STRUCTURE
- settings.gradle.kts and build.gradle.kts: Gradle project configuration
- app/build.gradle.kts: Android app configuration
- gradle/wrapper/gradle-wrapper.properties: Gradle 8.9 distribution configuration
- gradlew / gradlew.bat: project Gradle bootstrap scripts
- app/src/main/AndroidManifest.xml: app manifest
- app/src/main/java/com/varssity/worldprofessionhub/MainActivity.kt: WebView activity
- app/src/main/assets/index.html: main interface
- app/src/main/assets/professions-data.json: website directory data
- app/src/main/assets/logo.png and app/src/main/res/drawable/logo.png: logo assets

TROUBLESHOOTING
- First build requires internet access to download Gradle dependencies and Android SDK components.
- Use JDK 17. In Android Studio: Settings > Build, Execution, Deployment > Build Tools > Gradle > Gradle JDK.
- If SDK Platform 35 is missing, install it via Tools > SDK Manager > SDK Platforms.
- If build fails, copy the first meaningful error from the Build Output; later errors can be consequences of the first one.

EDITING WEBSITE DATA
The app's current UI embeds data in app/src/main/assets/index.html. The JSON file is also included for reference/editing. If you edit the data, make sure the embedded DATA in index.html is updated too before rebuilding.
