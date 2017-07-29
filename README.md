# FirebaseEnvironmentsDemo

An Xcode project showing how to swap out your `GoogleService-Info.plist` based on build configuration to enable you to keep separate development and production Firebase environments.

## Getting Started

At a high level, the main idea is to add a run script build phase to your target that selectively copies the appropriate `GoogleService-Info.plist` based on the build configuration used to build the app. As such, the "magic" of this project lies in the Xcode project configuration itself so don't expect the app to do much if you decide to run it yourself.
The main areas of interest include:
* Firebase/Dev and Firebase/Prod folders.
    * These contain the `GoogleService-Info.plist` for the Firebase development and production environments. Note that the names of these files are kept as their defaults and they are *not* part of the app target.
* "Setup Firebase Environment GoogleService-Info.plist" Run Script Build Phase
    * This [shell script](https://gist.github.com/tylermilner/f8e9121d62c890cb707bc1810a7d57d9), part of the target's *Build Phases*, is where the appropriate `GoogleService-Info.plist` is copied based on build configuration.

### Prerequisites

To build the sample app, you'll need CocoaPods. CocoaPods is a dependency manager for Cocoa projects. You can install it with the following command:
```
gem install cocoapods
```

### Installing

Clone or download the sample project and then run the following command to let CocoaPods install the Firebase SDK and setup the Xcode workspace:

```
pod install
```

## Seeing the Script in Action

Open the generated `.xcworkspace` file and build the app using the `CMD + B` shortcut.

You can then inspect the contents of the `FirebaseEnvironmentsDemo.app` build product to check the values in the embedded `GoogleService-Info.plist`. The values should match those of the `GoogleService-Info.plist` inside of the `Firebase/Dev` folder in the Xcode project.

Switch the scheme to "Release" and build the project again. This time, you should see that the `GoogleService-Info.plist` contained in the `FirebaseEnvironmentsDemo.app` corresponds to the `GoogleService-Info.plist` in the `Firebase/Prod` folder.

## Built With

At the time of writing, the sample project uses the following technologies:

* Xcode 8.3.3
* CocoaPods 1.3.0.beta.2
* Firebase iOS SDK 4.0.3

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details

## Acknowledgments

* [cohenadair's firebase-sandbox gist](https://gist.github.com/cohenadair/3a2aff5084603bfa65824f09cf74206e)
    * This has some great info, but suggests manually configuring the Firebase SDK instance at application launch to use the appropriate `GoogleService-Info.plist`. I noticed that the [Firebase documentation](https://firebase.google.com/docs/configure/#support_multiple_environments_in_your_ios_application) acknowledges this approach, but doesn't recommend it in [certain scenarios](https://firebase.google.com/docs/configure/#reliable-analytics). This is my inspiration for creating this guide.
