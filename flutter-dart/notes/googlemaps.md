# Google Maps Integration with Flutter

1.  Create a New GCP Project
2.  Enable Maps for iOS and Android
3.  Generate a Google Maps API Key
4.  Add these dependencies to your `pubspec.yaml` file.

-   [Google Maps Flutter](https://pub.dev/packages/google_maps_flutter)

5.  Add the following line of code to your Android Manifest (`android/app/src/main/AndroidManifest.xml`):

```xml
<manifest ...
  <application ...
    <meta-data android:name="com.google.android.geo.API_KEY"
               android:value="YOUR KEY HERE"/>
```

5.  Add the following line of code to your iOS application delegate `ios/Runner/AppDelegate.m`:

```m
#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"
#import "GoogleMaps/GoogleMaps.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GMSServices provideAPIKey:@"YOUR KEY HERE"];
  [GeneratedPluginRegistrant registerWithRegistry:self];
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}
@end
```

or in your swift code:

```swift
import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GMSServices.provideAPIKey("YOUR KEY HERE")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
```

6.  Import the package.

__Now, you are done with the installation. You can now integrate Google Maps with your code.__

1.  You can now call a GoogleMap widget.

```dart
Scaffold(
    body: GoogleMap(
        mapType: MapType.normal,
    ),
);
```

2.  Next, you have to declare the camera position.

```dart
final CameraPosition _initialPosition = CameraPosition(
    target: LatLong(1234, 1234, zoom: 15,
    )
);
```

```dart
Scaffold(
    body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _initialPosition,
    ),
);
```

That's all it takes to create it. 

__To add a marker, this is what you would do:__


1.  Create a `Set<Marker>` field.

```dart
Set<Marker> marker = Set.from([
    Marker(
        markerID: MarkerId(value),
        position: coordinates,
    ),
]);
```

```dart
Scaffold(
    body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _initialPosition,
        markers: markers,
    ),
);
```
