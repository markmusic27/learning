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