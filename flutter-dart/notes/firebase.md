# 🚨 Firebase

**In these notes, we will be focusing on using Cloud Firestore and Authentication within Firebase.**

However, note that Firebase offers way more than just Cloud Firestore. 

## Setup for Installation on Android

#### __Here are the steps you need to follow to complete this:__

1.  Go to your Firebase project and select the _New Android App_ button.
2.  For the "_Android package name_", go to your app level `build.gradle` file in the `android/app` folder. 

```
android/app/build.gradle
```

__NOTE:__ This is **NOT** the `android/build.gradle` file. It is the `android/app/build.gradle`. **They are very different.**

You will find it next to the keyword `applicationId`.

```dart
applicationId "com.markmusic.flash_chat"
```

**NOTE:** This must be your reverse company domain. It must me unique.

For example: 

| Domain | `applicationId` |
| ------ | --------------- |
|safelabs.app|`"app.safelabs.safe"`|
|zyndicate.app|`"app.zyndicate.wave"`|

You would then put in the value of:

```dart
applicationId "com.markmusic.flash_chat"
```

into the _"Android Package Name"_ without the:

```dart
applicationId // OR THE COMMAS
```

or the commas.

**It would look something like this:**

*com.markmusic.flash_chat*

2.  Click on the _"Register App"_ button.

3.  Download the `google-services.json` file.

You would then put it into the `android/app` folder.

**NOTE:** Make sure that the file's name is `google-services.json`

4.  Open your project level `build.gradle`

```
android/build.gradle
```

__NOTE:__ This is **NOT** the `android/app/build.gradle` file. It is the `android/build.gradle`. **They are very different.**

Within the dependencies, copy the line of code in the firebase setup wizard you are in right now and paste it.

**It should look something like this:**

```dart
dependencies {
    classpath 'com.android.tools.build:gradle:3.5.3'
    classpath 'com.google.gms:google-services:4.3.4'
}
```

5.  Open your app `build.gradle`

```
android/app/build.gradle
```

__NOTE:__ This is **NOT** the `android/build.gradle` file. It is the `android/app/build.gradle`. **They are very different.**

Within the dependencies, copy the line of code in the firebase setup wizard you are in right now and paste it.

**It should look something like this:**

```dart
dependencies {
    implementation 'androidx.multidex:multidex:2.0.0'
    implementation platform('com.google.firebase:firebase-bom:26.0.0')
    implementation 'com.google.firebase:firebase-analytics'
}

apply plugin: 'com.google.gms.google-services'
```

6.  Run your app with the Android Emulator. If it runs and you see no red error messages in your debug console, your set.
7.  
## Setup for Installation on iOS

#### __Here are the steps you need to follow to complete this:__

1.  Go to your Firebase project and select the _New iOS App_ button.
2.  For the "_iOS bundle ID_", go to your app level `Runner.xcodeproj` file in the `ios` folder.

    -   Open this file with Xcode. 
    -   Select the Runner file and it will open up the general setting of the app.
    -   Within the Identity toggle, you will see a "_Bundle Identifier_"
    -   Copy and paste that "_Bundle Identifier_" into the Firebase wizard. 

**NOTE:** This must be your reverse company domain. It must me unique. Feel free to change it to whatever you need.

For example: 

| Domain | Bundle Identifier |
| ------ | ----------------- |
|safelabs.app|`app.safelabs.safe`|
|zyndicate.app|`app.zyndicate.wave`|

2.  Click on the _"Register App"_ button.

3.  Download the `GoogleService-Info.plist` file.

Using drag and drop, drag it from your downloads directly into the `Runner` folder. **Make sure to do this in Xcode since it will do all of the behind the scenes linking for you.**

Once you drag it, you will get the following popup, make sure to check everything checked in the following screen shot:

<img src="https://i.ibb.co/B3bgSc8/Screen-Shot-2020-11-09-at-8-30-47-PM.png"></img>

**NOTE:** Make sure that the file's name is `GoogleService-Info.plist`

4. Run in the simulator. If you get no errors, you are golden.

Once you have added this file, Firebase will ask you, in the wizard to add cocoa pods. Since we're using Flutter, it will take care of all of this for us automatically. We just have to run the app in the iOS simulator.

___

## Adding Firebase Packages Setup

To work with Firebase in dart, you need to install a couple packages.

Since we are only using Firestore and Auth in these notes, we will only be installing some packages. However, here is a [GitHub Repo](https://github.com/FirebaseExtended/flutterfire) of all of the plugins you can imagine for Flutter and Firebase.

#### **The two packages being installed are:**

1.  [Firebase Core Package](https://pub.dev/packages/firebase_core)
2.  [Cloud Firestore Package](https://pub.dev/packages/cloud_firestore)
3.  [Firebase Auth Package](https://pub.dev/packages/firebase_auth)

**NOTE:** These are reliable packages that were made and are certified by the Google Firebase team. Also note that no matter what you are using within Firebase, you always need the [Firebase Core Package](https://pub.dev/packages/firebase_core).

Follow the steps in installation to get access to the packages.

After this has been done, make sure to test **only** your Android emulator from cold. If it works, you're golden. 

**It is really important that you check things at this stage because later on, many things can go wrong and if you leave it too late, it might just not work.**

Before you run on the Simulator, make sure you update your cocoa pods. 
1.  To do this, you would run `pod repo update`.

2.  Next, run `sudo gem install cocoapods`. **This will take even longer.**

3.  Finally, run `pod setup`.

**NOTE:** Updating cocoa pods and other aspects of the process can take a long time. This is normal.

___

## Dart Streams

Streams are very similar to futures. The big difference is that you are getting everything at once with futures. With streams, you are essentially subscribing and getting the data as it's ready.

You can also think of the singular and plural versions of this.

|     | Already Available | Need to Wait |
| --- | ----------------- | ------------ |
|**Singular**|`String`|`Future<String>`|
|**Plural**|`List<String>`|`Stream<String>`|

Items can be added to the stream at any time. What makes streams great is that we are notified when data arrives.

___

## `StreamBuilders` Widget

What the `StreamBuilder` is essentially, it takes streams and has the ability to build widgets out of them.

Essentially, it will rebuild every time that new data is coming from the stream. It does this with `setState()`. What this means is that `StreamBuilder` will call `setState()` every time that there is a new value in the stream. Here is how you would use a `StreamBuilder`:

```dart
StreamBuilder<QuerySnapshot>(
    stream: _firestore.collection("messages").snapshot(),
    builder: (context, snapshot){
        if (snapshot.hasData){
            final data = snapshot.data;
        }
    }
)
```

**CODE DECONSTRUCTION:** See how the `StreamBuilder` has two properties: 
1.  **`stream:`** which expects the stream that you are building.
2.  **`builder:`** which expects a buildStrategy (basically the logic behind the build.)

We are them giving the `StreamBuilder` a type of `<QuerySnapshot>` from firebase. Note that the snapshot we are referring to is not the Firebase Snapshot, it is a Flutter AsyncSnapshot.

We can then tap into all of the properties of an AsyncSnapshot. Here are the [docs of an AsyncSnapshot](https://api.flutter.dev/flutter/widgets/AsyncSnapshot-class.html). 

You can see that you can check if it has data with the `.hasData` or get the data with the `.data` property.

___

## Firebase Authentication

1.  The first thing you need to do is initialize your Firebase app. Do this by calling the `.initializeApp()` method.

```dart
await Firebase.initializeApp();
```

**NOTE:** This is a _async_ method. Therefor, you must await for it to finish.

2.  **Create a new stateless widget called `AuthenticationWrapper`.** This will basically take care of either returning the `HomeScreen()` or the `LoginScreen` depending on if the user is authenticated or not. We'll go back to this later
3.   Now we will actually **build out authentication class** that will take care of almost everything.
     - Make it expect a `FirebaseAuth` object.
     - Declare but not initialize it. Initialize it with the constructor.

```dart
class AuthenticationService {
    final FirebaseAuth _firebaseAuth;

    AuthenticationService(this._firebaseAuth);
}
```

4.  Within the class, **create four methods** to handle all things Auth.
     -  Create the `signIn()` method that returns a `Future<String>` which will basically be the status of the sign in.
     -  Create the `signUp()` method that returns a `Future<String>` which will basically be the status of the sign in.
     -  Create the `signOut()` getter that returns a `Future<void>`. This will sign out the user.
     -  Create the `authStateChanges()` getter that returns a `Stream<User>`. This will basically take care of if the user is signed in or not. 

This will take two parameters: _email_, and _password_. We can then wrap everything in a try and catch and use the special catch block made to catch `FirebaseAuthException`

```dart
class AuthenticationService {
    final FirebaseAuth _firebaseAuth;

    AuthenticationService(this._firebaseAuth);

    // ⬇️ Getter that takes care of seeing if user is signed in or not.

    Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();

    // ⬇️ Method that takes care of signing in users.

    Future<String> signIn({@required String email, @required  String password}) async {
        try {
            await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
            return "Signed In";
        } catch FirebaseAuthException (e) {
            return e;
        }
    }

    Future<void> signOut() async {
        await _firebase.signOut();
    }

    // ⬇️ Method that takes care of signing up new users.

    Future<String> signUp({@required String email, @required  String password}) async {
        try {
            await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
            return "Signed Up";
        } catch FirebaseAuthException (e) {
            return e.message;
        }
    }
}
```

1.  One of the best ways to use the FlutterFire stack nowadays is to use a package called **Provider** which allows you to not have to handle stream builders.
    - Add [Provider](https://pub.dev/packages/provider) to your **`pubspec.yaml`** file. This allows us to just wrap everything in a `MultiProvider` widget and pass in User Stream and authentication class.
    - Wrap wherever where you're using auth in a `MultiProvider` widget.
    - Pass in the providers as a list of providers. AKA, `Provider<AuthenticationService>` and `StreamProvider`.
    - Add the `Provider<AuthenticationService>` and use it to initialize ' with a `FirebaseAuth.instance` which is what it's expecting.
    - Add the `StreamProvider` and use `context.read<AuthenticationService>().authStateChanges` to interact and get access to the different methods and getters we made with `AuthenticationService`. 

```dart
return MultiProvider(
    providers: [
        Provider<AuthenticationService>(
            create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
            create: (context) => context.read<AuthenticationService>().authStateChanges,
        )
    ],
    child: MaterialApp();
)
```

6.  Build out `AuthenticationWrapper` widget.
    - Now, we don't even have to handle a `StreamBuilder`. We can just call `context.watch<User>()`. Create a variable that is initialized to that value.
    - Now, we can simply use `if` `else` logic to navigate the user to a certain screen.

```dart
Widget build(BuildContext context){
    final firebaseUser = context.watch<User>();

    return firebaseUser != null ? Text("Signed in") : Text("Not signed in") ;

    // Note that this would call the Navigator.pushNamed()
}
```

7.  Now, go to your Firebase console and then navigate to the `authentication` tab. Here, click on "_set up sign in method_". Enable "_Email Password_"
8.  Create a user for testing in Firebase.
9.  Firebase in Home / Sign In page / Sign Up page
    - Now, all that is left to do is to call `context.read<AuthenticationService>().signIn()` to create the new user.




