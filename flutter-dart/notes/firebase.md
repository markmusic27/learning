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

**NOTE:** Make sure to change your `minSdkVersion` to 21 if it is at 16.

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

___

## Firestore CRUD

The first thing you're going to want to do is create your database in [Firebase](https://firebase.google.com/). To do this, follow these steps:

1.  Go to the _Cloud Firestore_ page.
2.  Click on _Create Database_. 
    - This will then ask you to select either _production mode_ or _test mode_. The difference is that in test mode, anyone **(doesn't matter if they're authenticated)** can read and write to the database. In _production mode_, only authenticated users can read and write. You can choose either of both. This said, it is recommended to start off with _test mode_.

The next thing you're going to want to do is install the dependencies:

1.  Go to the [pub.dev](https://www.pub.dev) website.
2.  Look for `firebase core`. Add the dependency to your `pubspec.yaml` file. This is the package you need anytime you want to work with Firebase.
3.  Now look for `cloud_firestore`. Add the dependency to your `pubspec.yaml` file. This is the package you need to work with Cloud Firestore.

Now, we can start building out the app:

1.  Create a `services` folder.
2.  Add the `firestoreServices.dart` file.
3.  Create a class called `FirestoreServices`.
4.  Create a `FirebaseFirestore` instance anc call it `db`.
5.  Mark it private with an underscore before it.
6.  Make a list of The things that you want to with your database.
7.  If it's CRUD. It would be:
    1.  Get
    2.  Create
    3.  Update
    4.  Delete

This is how it would look for now:

```dart
class FirestoreServices {
    FirebaseFirestore _db = FirebaseFirestore.instance;

    // Get Entity

    // Create

    // Update

    // Delete
}
```

Since we are getting a stream of whatever you're getting, we need to model it out.

1.  Create a `models` folder. Here is where you will create all of the models for the data you're retrieving.
2.  Create your `/*modelName*/.dart` file.
3.  Create the `/*ModelName*/` class.
4.  Add all of the properties the data will have.
5.  Initialize these properties with a constructor.
6.  Create a `factory`. Anytime that you're working with Firestore, you have your object. To send it to Firestore, you need to convert it into a JSON object. If you want to retrieve it, you need to convert it into a dart object. You need to methods that do all of that for you.

```dart
class ModelName {
    final String modelID; // Dummy Data
    final String modelValue; // Dummy Data

    ModelName({@required this.modelID, this.modelValue});

    // This gets the JSON data and turns it into a dart object.

    factory ModelName.fromJSON(Map<String, dynamic> json){
        return ModelName(
            // Note that these are the names of the fields in firestore.
            modelID: json["modelID"], 
            modelValue: json["modelValue"],
        );
    }

    // This gets the dart object (of the values we initialized before) and turns it into a JSON data.

    Map<String, dynamic> toMap(){
        "modelID": modelID,
        "modelValue": modelValue,
    }
}
```

__NOTE:__ This is a default Model. Your model can have all types of properties. However, it should always have some properties and these two methods.

Now we go back the the class we were building before:

1.  Create a method that returns a `Stream` or a `Future`. You can you any of both with Firestore. This will get the data.

```dart
Stream<ModelName> read(){
    return _db
        .collection("collectionName"); // this is the collection in Firestore.
        // IF YOU WANT TO QUERY SPECIFIC DATA, use the .where("field", operation)
        .snapshots() // if you're getting a future, use "get()" instead of "snapshots()". "snapshots()" will return QuerySnapshots which you have to map.
        .map((snapshot) => snapshot.docs.map( // This will now return all of the Document Snapshots in the snapshot.
            (doc) => ModelName.fromJson(doc.data()) // Now you can use the .data to get the actual JSON data and return an Entry and use the .fromJson and pass in doc.data()
            // IF YOU ARE RETURNING A LIST, use .toList() to get it into a list.
        ))

}
```

2.  Create a method to Create. This will overwrite whatever is in the collection with that.

```dart
Future<void> create(ModelName modelName) {
    return _db
        .collection("collectionName") // this is the collection in Firestore.
        .doc(modelName.modelNameID) // getting you the document
        .set(modelName.toMap());
}
```

2.  Create a method to Upsert (Create or Update). It will say, "if the record doesn't exist, create it. if it does, update it"

```dart
Future<void> upsert(ModelName modelName) {
    var options = SetOptions(merge: true);

    return _db
        .collection("collectionName") // this is the collection in Firestore.
        .doc(modelName.modelID) // getting you the document
        .set(modelName.toMap(), options);
}
```

3.  Create a method to Delete. This will delete the model.

```dart
Future<void> delete(String modelId){
    return _db
        .collection("collectionName")
        .doc(modelId)
        .delete();
}
```

Now that we have these, we can go ahead and create providers for the data we're getting. This is state management only for the data that we are working Firestore to get.

1.  Create a Class called DataNameProvider (_this is the data name and then provider_).
2.  Add the ChangeNotifier Mixin
3.  Create a property for all of the data you will be using.
4.  Make all of these properties private.
5.  Create getters for all of these.
6.  Create Setters for the values that can be changed .
7.  Use notifyListeners() in all of the setters.
8.  Initialize the firestoreService field.
9.  Initialize a Uuid property.
10. Create a loadAll method to load all of the values.
11. Create a save method to save the record.
12. Create a remove method to delete the record.

```dart
class EntryProvider with ChangeNotifier {
    final firestoreService = FirestoreService();
    DateTime _date;
    String _entry;
    String _entryId;
    var uuid = Uuid();

    // All private variables, we will need a public way to get them.

    DateTime get date => _date;
    String get entry => _entry;
    Stream<List<Entry>> get entries => firestoreService.getEntries();
    
    // All private variables, we will need a public way to set them to a different value

    set changeDate(DateTime date) {
        _date = date;
        notifyListeners();
        // notifyListeners() will trigger a UI reload
    }

    set changeEntry(String entry) {
        _entry = entry;
        notifyListeners();
        // notifyListeners() will trigger a UI reload
    }

    //We might be coming of an existing entry, we need to tell the UI to load the new data.

    void loadAll(Entry entry) {
        if (entry != null) {
            _date = DateTime.parse(entry.date);
            _entry = entry.entry;
            _entryId = entry.entryId;
        } else {
            _date = DateTime.now();
            _entry = null;
            _entryId = null;
        }
    }

    void saveEntry() {
        if (entryId == null){
            // Add entry
            var newEntry = Entry(
                date: _date.toIso8601String(),
                entry: _entry,
                entryId: uuid.v1(),
                )
            
            firestoreService.setEntry(newEntry);
        } else {
            // Update
            var updatedEntry = Entry(
                date: _date.toIso8601String(),
                entry: _entry,
                entryId: _entryId,
                )
            firebaseService.setEntry(updatedEntry);
        }
    }

    void removeEntry(String entryId) {
        firestoreService.deleteEntry(entryId);
    }

}
```

Now that we have our provider done, we can implement with the front-end. here are the steps:

1.  Wrap your `MaterialApp` in a `ChangeNotifierProvider`.
2.  Pass in the `create` property and give it an arrow function that returns the provider you created: `create: (context) => EntryProvider()`
3.  Create an `Provider.of(context)` instance. in your `initState()`. 
4.  Give that `Provider.of(context)` the type of provider you created for your data: `Provider.of<EntryProvider>(context)`.
5.  Pass in `listen` as `false`: `Provider.of<EntryProvider>(context, listen: false)`
6.  Load with the values with the `.loadValues` method.
7.  Set values = to to the object passed

```dart
@override
void initState() {
    final entryProvider = Provider.of<EntryProvider>(context, listen: false);
    if (widget.entry != null) {
        // Update

        text = widget.entry.entry

        entryProvider.loadAll(widget.entry);
    } else {
        // Create

        entryProvider.loadAll(null);
    }
    super.initState();
}

@override
Widget build(BuildContext context) {
    final entryProvider = Provider.of<EntryProvider>(context);
    return Scaffold(
        body: Column(
            children: [
                Text(formatDate(entryProvider.date, [
                    MM,
                    " ",
                    d,
                    ", ",
                    yyyy,
                    ]
                    )
                    ),
                // Use entryProvider.changeDate() to change the date.
            ]
        ),
    );
}
```

Now, to create a ListView, use a `StreamBuilder`

```dart
StreamBuilder<List<Entry>>(
    stream: entryProvider.entries,
    builder: (context) {
        return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index){
                return ListTile(
                    Title(
                        formatDate(DateTime.parse(snapshot.data[index].date), 
                            [
                                MM,
                                " ",
                                d,
                                ", ",
                                yyyy,
                            ]
                        )
                    )
                    onPressed: () {
                        Navigator.push(
                            MaterialPageRoute(builder: (context) => EntryScreen(entry: snapshot.data[index]))
                        )
                    }
                )
            }
        )
    }
),
```