# 📌 Intermediate

## Flutter Themes

Themes simply allow us to __define the app's color pallet, and styling__ for the look and feel of the app.

These themes basically provide consistency throughout the app.

Flutter themes are built by passing in a `ThemeData()` widget to the `theme` property of a `MaterialApp()` widget. This, then has properties like `brightness`, `primaryColor`, or `accentColor`. It also allows you to have a default font family with the `fontFamily` property.

```dart
MaterialDart(
    title: "Test App",
    theme: ThemeData(
        primaryColor: Color.green,
        accentColor: Colors.blue,
        brightness: Brightness.dark,

        // Considering the family is already in pubspec.yaml
        fontFamily: "Product Sans",

        textTheme: TextTheme(
            headline: TextStyle(/* The styling of your text */),
            body: TextStyle(/* The styling of your text */),
        ),
    ),
)
```

__NOTE:__ These are only a fraction of the actual things you can do with the `ThemeData()` widget. Check out the docs of this widget [here](https://api.flutter.dev/flutter/material/ThemeData-class.html)

___

## Final VS. Const

In Flutter development, there is a thing called immutable widgets. Immutable basically means that it can't be changed. In Flutter, there are two keywords used to fix this immutability problem. These are called `final`, and `const`. They, however, have a massive difference.

Even though they are both immutable, `final` variables and properties can add their value during run time. `const` cannot. If the value of a const cannot be gotten before run time, then the property must be a `final`.

___

## Dart Enums

Enums just stand for enumerators; which are basically there to establish the number of something. Basically, instead of having to assign something a number and try to remember that later, you can have different enum types with different names that stand for a number.

__DECLARATION:__
```dart
enum Name = {typea, typeb, typec};
```

__USING:__
```dart
Name.typea // would stand for 0
```

___

## Customizing Widgets with Themes

Whenever you find that you need a material design or coupertino widget (_ex. `Slider()`_)but it can't be customized to the level you need to, you can can use the `Theme()` widget to customize it and tap into properties that weren't possible before. 

__NOTE:__ This is not possible with every single widget, only with a certain amount.

However, when using this step, you can sometimes easily override everything and have to give a manual input to every property. __This can be very time consuming.__

```dart
SliderTheme(
    data: SliderThemeData(    
    trackHeight: null,
    activeTrackColor: null,
    inactiveTrackColor: null,
    disabledActiveTrackColor: null,
    disabledInactiveTrackColor: null,
    activeTickMarkColor: null,
    inactiveTickMarkColor: null,
    disabledActiveTickMarkColor: null,
    disabledInactiveTickMarkColor: null,
    thumbColor: null,
    overlappingShapeStrokeColor: null,
    disabledThumbColor: null,
    overlayColor: null,
    valueIndicatorColor: null,
    overlayShape: null,
    tickMarkShape: null,
    thumbShape: null,
    trackShape: null,
    valueIndicatorShape: null,
    rangeTickMarkShape: null,
    rangeThumbShape: null,
    rangeTrackShape: null,
    rangeValueIndicatorShape: null,
    showValueIndicator: null,
    valueIndicatorTextStyle: null,
    minThumbSeparation: null,
    thumbSelector: null,
    ),
    child: Slider(),
)
```

However, Flutter also allows you to simply give more fine control by simply overriding certain properties by using the `.copyWith`

```dart
SliderTheme(
    data: SliderTheme.of(context).copyWith(
        overlayColor: Colors.blue,
    ),
    child: Slider()
)
```

__CODE DECONSTRUCTION:__ Here, were just telling flutter, copy the exact styling that we already have `.of(context)`. Side note: `context` is just giving that the state of our app so it knows how to copy. However, copy it with the `overlayColor: Colors.blue` `.copyWith()`.

Basically, we are inheriting everything but changing a couple of things that we ant to change. This is called inheritance.

__REMEMBER:__ If you have another color that is a property of the _main_ widget, __and not the theme__ you're customizing, __the property will override the theme.__

If you do end up going with the theme route, __MAKE SURE TO DO 100% OF ALL STYLING IN THE THEME.__

___

## Composition VS. Inheritance

If customizing already made widgets isn't enough, you can always create them from scratch with the most fundamental building blocks of Flutter Widgets.

In Coding in general, there are two keywords thrown around often: _composition_, _inheritance_. Flutter always favors composition to basic inheritance. This is because of Flutter's vast selection of small widgets / simple widgets. By combining all of these simple widgets, you get a completely custom widget that is more complex. Basically, instead of just inheriting things and trying to morph them to fit, you can just build widgets yourself.

__NOTE:__ In Flutter, every widget is made out of even smaller widgets. Since Flutter is completely open source, you can simply dig deep and see how literally everything in Flutter is built. What this means is that you can dive deep, depending on how much of a custom widget you want to basically be able to fine tune your widget to exactly what you need.

__Steps:__

1.  Find the Flutter widget that looks closest to your design. Read the documentation on teh widget.
2.  If you can't use it or if the widget has a different purpose, dive into the rabbit hole by `cmd + click` the widget.
3.  See what the widget is made up of. Read the documentation on the widgets that make up the widget. 
4.  Keep on doing this until you feel comfortable with the level of customization.
5.  Read the documentation on the smallest widget you chose and use it to build out your own widget.

___

## Routes & Navigation in Flutter

In Flutter, when we talk about __routes, we are talking about screens and pages.__ So basically, when we mention routes in Flutter, it's a way to get to the different screens and pages.

For every screen you make, you must have a navigator to accompany it. The navigator just takes you on these routes to see each of these screens.

The `Navigator` widget works a lot like `Lists` in dart. You see the last Screen in the list. To see the next screen in the List, you have to use `Navigator.pop()` notation to remove it from the list. To push an object into the first screen, you can just use the `Navigator.push()`

### Simple Routes

Lets see how it would look in code:

```dart
onTap: () {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Screen1();));
}
```
__CODE DECONSTRUCTION:__ As you can see, the `Navigator.push()` expects two parameters `context` and `MaterialPageRoute()` which just creates the route. The `context` refers to the current build context. Basically, we're telling Flutter where in the widget tree the widget is. 


`Navigator.pop()` is way easier. It doesn't expect a route or anything since it's just destroying the page that just got pushed.

```dart
onTap: (){
    Navigator.pop(context);
}
```

Thats it, it's that simple.

__However, this only works with apps with one route. If you have multi-screen apps, then you need to complicate it a bit more.__

### Named Routes

It is conventional to do all of this in your `main.dart` file, where you keep your `MaterialApp()` widget.

`MaterialApp()` widgets all have a property called `routes:`. This expects a map. 

To select the initial route, use the `initialRoute:` parameter instead of the `home:` property

```dart
MaterialApp(
    initialRoute: "/login",
    routes: {
        "/login" : (context) => LoginScreen(),
        "/home" : (context) => HomeScreen(),
        "/profile" : (context) => ProfileScreen(),
    }
)
```

__NOTE:__ Do not use both `initialRoute:` and `home:` because they will conflict.

Now, whenever you want to change the screen, you can call `Navigator.pushNamed("/first")` and pop the same way as before.

The only thing that named routes is doing is just calling the `(context) => Screen();` for you.

```dart
onTap: (){
    Navigator.pushNamed("/home");
}
```

___

## Dart Maps

A map, is basically just another way of collecting data in Dart. It's just another data structure. 

The big __difference between maps and lists are that maps have a key and a value__. Maps also have no particular order. 

Here is how you would create a Map in Dart

```dart
Map<String, int> friendAges{
    "mark": 15,
    "filippo": 14,
    "daniel": 14,
}
```

__CODE DECONSTRUCTION:__ Maps look a lot like objects; however, __they are not the same.__ A maps purpose is to assign a key to a value. In this case, __the key is everything before the colon__ while __everything after it is the value.__

The type annotation would look like this `Map<KeyType, MapType>`

You can then get the value of an index in a map by doing `mapName[key]`

| Key | Value |
| --- | ----- |
| `"/first"` | `(context) => Screen0(),`
| `mark` | `"+506 71099519"`

If you know the key, you can pull out the value.

If you try to pull a value with the wrong key or a key that doesn't exist, the map will return a `null` datatype.

You can add an index to a map by:

```dart
mapName["nonExistentKey"] = "the value";
```

You can also change the value that a key is correlated to by:

```dart
mapName["Key"] = "new value";
```

___

## Getting Location Data From Across Platforms

There are two primary ways you can get the location of your user:

1.  You can either use a Dart Package like [this one](https://pub.dev/packages/geolocator).
2.  You can also use the [GCP Geolocator API](https://developers.google.com/maps/documentation/geolocation/overview)

For Clima, we will be using the first option.

__NOTE:__ If you want to access user's location, you need to explicitly ask for it by adding the following line of code:

### Android 
folder: `android/app/src/main/AndroidManifest.xml`

```xml
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
```

or

```xml
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
```

### iOS
folder: `ios/Runner/Info.plist`

```xml
<key>NSLocationWhenInUsageDescription</key>
<string>This app needs access to location when open</string>
```

___

## Dart Futures, Async & Await

In code, there are methods that can take an undetermined amount of to complete. __Dart, like many other languages is asynchronous.__ This means that if you have a function like this: 

```dart
void aFunction(){
    // Step 1
    print("Hello Moon!");
    // Step 2
    getData("4K image from NASA");
    // Step 3
    print("Hello Jupiter!");
}
```

It will run, the first method first, then run `getData()` and finally run step three. However, Dart won't wait until `getData()` is done to run step 3. This means that if you depend on `getData()` to finish for step 3 to work, your essentially screwed. This is called asynchronous programming.

Synchronous programming would wait for `getData()` to finish before it runs step 3. 

__Don't think that asynchronous is bad though.__ It will make your app better in millions of ways and in 99% of the cases, __async is simply better.__ However, in cases like this, where you depend on synchronous programming to make your app work (_ex. HTTP GET/POST requests_), you can use some lines of syntax that are baked into Dart to make it work.

```dart
void aFunction() async {
    // Step 1
    print("Hello Moon!");
    // Step 2
    await getData("4K image from NASA");
    // Step 3
    print("Hello Jupiter!");
}
```

__CODE DECONSTRUCTION:__ Here, we added two keywords, `async` and `await`. `async` essentially tells Dart, "Yo, this next method here will have synchronous bits.". `await`, used before calling the method tells Dart, "Yo, wait until this method finished before going on to the next part."

__NOTE:__ These methods always return Futures since the values are set when the methods end. Until they end, they will be marked as a Future. Since Futures materialize when the method ends, you can tell Dart what will be the type of value the Future will materialize to.

```dart
Future<String> aFunction() async {
    // Step 1
    String data;
    // Step 2
    data = await getData("IMPORTANT STRING");
    // Step 3
    return data;
}
```

___

## Widget Lifecycles

When you refer to the lifecycle of a widget, your referring to the time frame of when it gets built and when it gets destroyed. For stateless widgets, their lifecycle is quite simple since you can't really change it. However, stateful widgets are a different story since there is way more that can be done with them.

When using a stateless widget, pay attention to the `build()` method.

```dart
class WidgetName extends StatelessWidget {
    @override
    Widget build(BuildContext context){
        return null;
    }
}
```

When using a stateful widget, pay attention to the `build()` method, the `initState()` method, and the `deactivate()` method.

```dart
void initState() {

}

Widget build(BuildContext context){
    return null;
}

void deactivate() {

}
```

`initState()` is triggered when the state originally gets initialized.

`build()` is triggered when the widget gets built.

`deactivate()` is triggered when the widget gets destroyed.

What is important about this is that you can tap into these different stages of a widget's lifecycle to do certain things at specific times.

__Here is an example:__

```dart
class MyWidget extends StatefulWidget {
  MyWidget({Key key}) : super(key: key);

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  void initState() {
    // Called when stateful widget gets inserted into the file tree.
    super.initState();
    print("initState() Called");
  }

  @override
  void deactivate() {
    // Called when stateful widget gets destroyed.
    super.deactivate();
    print("deactivate() Called");
  }

  @override
  Widget build(BuildContext context) {
    // Called when the widget gets built
    print("build() Called");
    return Text("");
  }
}
```

There are __many more of these lifecycle methods__ but __these are the three most common.__

___

## Exception Handling & Null Aware Operators

Whenever there's an error at runtime, the program with throw out an error and it is the programmers job to catch that exception and handle it.

You can do this with the try and catch blocks

```dart
main() {
    String myString = "abc";

    try {
        double myDouble = double.parse(myString);
        print(myDouble + 10);
    } catch (e) {
        print(e);
    }
}
```

__CODE DECONSTRUCTION:__ Here, were telling Dart, "try to do this. If it works, great! If it doesn't, catch that error and tell me what it is". That try is just a block of code that Dart will try and if there is an error, the catch will get it and print it out with the anonymous function `(e){print(e);}`. 

__NOTE:__ `e` stands for `exception`.

The best way to use try and catch is to declare a property but not initialize it. Then try to change its value with the try. If it does work, then it will reassign the value, if it doesn't, then the value will stay as null. Then you can simply check if the value is null with the `??` operator. If it is, use a default value, if it isn't then use the reassigned value.

Here is how it would look in code: 

```dart
class MyWidget extends StatefulWidget {
  MyWidget({Key key}) : super(key: key);

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
    String textDisplayed;

    try {
        textDisplayed = 18;
    } catch (e) {
        print(e);
    }

  @override
  Widget build(BuildContext context) {
    return Text(textDisplayed ?? "default value");
  }
}
```

The `Text()` widget will display _"default value"_ since the value of `textDisplayed` is null.

__NOTE:__ Something else you can do is provide alternate realities with the catch block. This way, your app can serve a specific purpose when the error is caught. For example, if the user is offline, give them a pop up saying: "Your offline, reconnecting..."

__NOTE:__ The new operator we were using, `??`, is called the __Null Aware Operator__ and it basically just checks if the value of the thing being compared has a value of null. If it doesn't it will use the value of the variable. I it does, it will provide an alternative for the value.

You can also throw an exception with the throw block: 

```dart
void nShouldBeGreaterThan10(n){
    if (n < 10){
        throw "n is less than 10, n should always be greater than 10";
    }
}
```

___

## APIs Explained

An __Application Programming Interface__ (_API_) is a set of commands, functions, protocols and objects that programmers can use to __create software__ or __interact with an external system__.

It provides developers with __standard commands__ for performing __common operations__ so they do not have to write the code from scratch.

___

## HTTP calls with Flutter

To make HTTP with Flutter, we need to use a package provided by the Dart team. It is very reliable and it's what everyone uses. 

__Get the package [here](https://pub.dev/packages/http)__

## To install it, follow these steps: 

1. Depend on it
Add this to your package's pubspec.yaml file:

```yaml
dependencies:
  http: ^0.12.2
```

2. Install it
You can install packages from the command line:

_with pub:_

`$ pub get`

_with Flutter:_

`$ flutter pub get`

Alternatively, your editor might support pub get or flutter pub get. Check the docs for your editor to learn more.

3. Import it
Now in your Dart code, you can use:

```dart
import 'package:http/http.dart';
```

## Using the package

You can then use the `get()` method that has two properties:

1.  URL that is of type `String`.

That will return a type `Response`.

You can then use the `.body` like `.json` in TS that just turns that instance of `Response` into actual data.

__The code would look like this:__

```dart
void getData() async {
    String url = "http://jsonplaceholder.typicode.com/todos/1";
    Response response = await get(url);
    print(response.body);
  }
```

You can also check the status code of the HTTP request to see what happened. It's always a good idea to do error handling with these codes.

__You can see what they mean in [this website](https://www.restapitutorial.com/httpstatuscodes.html)__

There is a simple cheat sheet you can follow.

__HTTP return codes cheat sheet:__

| Error Message | Meaning |
| ------------- | ------- |
|__1**__| Hold On |
|__2**__| Here You Go |
|__3**__| Go away |
|__4**__| You fucked up |
|__5**__| I fucked up |

__NOTE:__ When working with the `http` package, it is always best to give the package an `as` keyword in the import so you can easily see that the methods we are calling are coming from an package and not from general flutter code.

```dart
import 'package:http/http.dart' as http;
```

___

## JSON Parsing & Dynamic Types

__Most API providers are split into two camps:__

-   Either they provide the data as XML (_Extensible Markup Language_)
-   Or they provide it as JSON (_JavaScript Object Notation_)

Others even give you a choice between both.

Both use a key, value pair. 

### __XML:__

```xml
<key>value</key>
```

```json
{key:value}
```

To then get the data from the API response, you need to decode it with a JSON Parser. Dart has one of these built in, all you have to do it import it.

```dart
import "dart:convert";
```

You can then convert that data with the Json Parser. All you need to do is pass that data into the `jsonDecode()` method and you're set.

```dart
void getData() async {
    String url = "http://jsonplaceholder.typicode.com/todos/1";
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;

      String userID = jsonDecode(data)["todo"][0]["title"];

      print(userID);
    } else {
      print(response.statusCode);
    }
  }
```

__CODE DECONSTRUCTION:__ We can divide that method into steps.

1.  We're tapping into the key _"todo"_ which is a list of data.
2.  Then, were tapping into the the first index of that list, or index `0`.
3.  Once in that index of the list, we are tapping into the key _"title"_ to get the title of the data.

The code all together looks something like this:

```dart
jsonDecode(data)["todo"][0]["title"];
```

___

## Passing Data to a State Object

Whenever you're passing in data, you would pass it into the constructor. You would then use the widget keyword within the state class of that widget to use it.

__REMEMBER:__ You don't initialize state in their declaration, they are meant to be null at first. You would then update those variables with the value you passed in using the widget keyword.

___

## Text Inputs 

To add a text input field into Flutter, you can use the `TextField()` widget. This has a decoration property which you can input a `InputDecoration()` widget.

Here is an example of a `TextField()` with some decoration:

```dart
TextField(
    style: TextStyle(
        color: Colors.black,
        fontSize: 16,
    ),
    decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: "Enter City Name",
        hintStyle: TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide.none,
        ), // OutlineInputBorder
    ), // InputDecoration
), // TextField
```

Then, you just give that a property of `onChanged` which expects an anonymous function.

```dart
onChanged: (String value){
    print(value);
}
```

This will get called every time the text is changed.

____

## Passing Back Data with Navigation.

You can actually pass back data through navigation. This is how you would do so:

```dart

// Passing the data:
Navigator.pop(context, variableYouWantToPass);

// Retrieving the data: 
onPressed: () async {
    var output = await Navigation.push(context, MaterialPageRoute(
           build: (context) => Screen1(),
       ), // MaterialPageRoute
    );
}
```

__NOTE:__ Since this Data can be passed at any moment, `Navigation.push()` is an asynchronous method and returns a dynamic future.

