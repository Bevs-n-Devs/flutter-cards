# flutter-cards
Developing an app to learn how multiplayer games work

### Environment
* flutter : v3.19.6
* Dart : v3.3.4
* node version: v20.9.0

## Functional Requirements
1. Handle 2-4 players at a time 
2. Have different play modes (e.g. in uno: allow runs or stacking)
3. Each player should only see his/her cards in their hand
4. The play pile should be visible by all players


## Gotcha's
1. Ensure that the package name in the following all match, or build errors will occur:
   * `android/app/src/main/kotlin/com/example/cards_table/MainActivity.kt`
   * `android/app/build.gradle` _under the android section_
2. When attempting to generate the keystore file using the keytool, it is important to then create & update the key.properties file with the passwords used in the command, along with the alias and absolute path to the keystore file. [The Steps](https://docs.flutter.dev/deployment/android#create-an-upload-keystore) 
    > NOTE: Be sure to correct the slash in the paths, as this is OS specific.
    > NOTE: Before generating a new keystore file **you must delete the previous file <u>FIRST</u>**
3. When building a release for android use the following command: `flutter build appbundle` as this generates the .aab file necessary for the Android Play Store Console.
4. Generating app icons requires an initial 1024x1024 png or jpeg file, then using flutter_launcher_icons package it will be copied to all appropriate formats:
`flutter pub run flutter_launcher_icons`
   > NOTE: Steps can be found at this [LINK](https://pub.dev/packages/flutter_launcher_icons)