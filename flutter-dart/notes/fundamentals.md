# 🦟 Fundamentals

## Scaffold

The `Scaffold` widget is **simply a layout widget** that allows you to do many things with it like have an app bar.

## Image

The `Image` widget is just a frame that **doesn't have an image in default.** It has a property called `image:` where you can input the image you want with either `AssetImage()` or `NetworkImage()`.

```dart
Image(
    image: AssetImage("images/image.png")
)
```

## Working with `pubspec.yaml`

In the `pubspec.yaml` file, you basically tell Dart what files (images, fonts) you have.

**NOTE:** `pubspec.yaml` depends on indentation. Make sure that you use the correct indentation when coding.

```yaml
flutter:
  uses-material-design: true

  assets:
    - images/tedx.jpg

  fonts:
    - family: Schyler
      fonts:
        - asset: fonts/Schyler-Regular.ttf
        - asset: fonts/Schyler-Italic.ttf
          style: italic
    - family: Trajan Pro
      fonts:
        - asset: fonts/TrajanPro.ttf
        - asset: fonts/TrajanPro_Bold.ttf
          weight: 700
```

## Adding App Icon

To add an app icon, there are **three steps**

1.  Make sure that you have a **good quality** icon.

2.  Go to the [Icon App Generator](https://appicon.co/) website where you will generate the icons.

3.  Once in the site, make sure that select the platforms you're developing for.

4.  Download and unzip.

5.  Go to the `*yourproject*/android/app/src/main/res` path and replace the `mipmap` files with the ones you just downloaded.

6.  Go to the `*yourproject*/ios/Runner` path and replace the `Assets.xcassets` file with the one you downloaded.

## Stateless Widget Shortcuts

A stateless widget is basically a widget with no state. Its a class that returns your code.

The boilerplate looks like this:

```dart
class Name extends Stateless {
  @override

  Widget build(BuildContext, context) {
    return //Code here
  }
}
```

## `Expanded` Widget

The expanded widget is a widget that allows you to make your app progressive to different screen sizes **when working with columns or rows.** It will basically allow you to expand to fill the available space in the main axis of it's parent.

**NOTE:** Any `Expanded` widget **must be the child of a row, column, or flex**. Any child of the row must be encapsulated in an `Expanded` widget.

```dart
Row(
  children: [
    Expanded(
      child: Image(image: AssetImage("img1.png"),
      flex: 12,
      ),
    ),
    Expanded(
      child: Image(image: AssetImage("img2.png"),
      flex: 3,
      ),
    ),
  ]
)
```

As we can see from the previous code snippet, **the `Expanded` widget is a single child widget.**

The expanded widget also works with `flex`.

## `onPressed` and Void Callbacks

When coding in Flutter and Dart, it's inevitable to to run into widgets that expect certain methods. Many of these methods will expect **Void Callbacks** ( _Anonymous Functions_ ). One of these is these methods is called `onPressed` ( _onClick_ ) which can be found in widgets like `Gesture Detector` and `FlatButton`.

```dart
GestureDetector(
  onPressed(() => {
    print("Button is clicked")
  })
  child: Text("I'm a Button"),
)
```

## Inserting Variables into Strings

In Dart, what you do to insert a variable's value to a string is just **put a dollar sign before it.** If you need to interpolate, just **put a dollar sign and then encapsulate the variable in a pair of brackets.**

```dart
void printName(name, lastName) {
  print("Hello, my name is ${name + " " + lastName}.")
}
```

## Stateful VS Stateless Widgets

In many languages and frameworks, you are constantly using state. **Flutter is no different.**

Flutter has **two types of widgets**:

1.  Stateless Widgets
2.  Stateful Widgets

Stateless Widgets are basically the widgets that build the __part of your app's UI that doesn't change__ _(App Bar, Profile Picture, etc)_.

Stateful Widgets are basically the widgets that build the __part of your app's UI that changes__ _( Buttons, Animated Widgets, etc)_.

You can use the `setState()` method to change the state of your app. You can also do this with __State Management__ but more on that later.

```dart
class ColoredPage extends StatefulWidget {
  @override
  _ColoredPageState createState() => _ColoredPageState();
}

class _ColoredPageState extends State<ColoredPage> {
  String kColor = Color(0xff000000)

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: GestureDetector(
          onTap: () {
            setState((){
              kColor = Color(0xffffffff)
            })
          }
          child: Container(
            height: 100,
            width: 100,
            color: kColor,
          ),
        ),
      ),
    );
  }
}
```

## Flutter Packages

Flutter Packages are basically all of the packages that you can access.

To access them, go to [pub.dev](https://pub.dev/)

Many of these packages are also uploaded by the __Flutter Team__.


## `dynamic` Data Type

The `dynamic` data type is __like the any data type in TS.__ Basically, it means that there is no specific data type.

Every time that you see one of these `dynamic` data types, it's always better to stay away and __give a specific type annotation.__

## Escaping Characters

Whenever you're escaping a quotation mark in a string, make sure to use the `\` and not the `/`.

In Dart, like JS and TS, you escape characters with the __backslash__, not the __slash__.

```dart
String object = "Ice Cream";

String person = "Mark";

void main(){
  print("$person\'s $object");
}
```

## Object Oriented Programming in Flutter & Dart

When using object oriented programming, your essentially working with objects to do everything. Hence, the name object oriented programming.

This is also known as __OOP__.

Within OOP, there are four primary pillars:
    - Encapsulation
    - Abstraction
    - Inheritance
    - Polymorphism

They each do their own thing but together, create a harmony for developers.

## Abstraction

Abstraction is basically just taking big, complex pieces of code and making them it to smaller, more digestible pieces to make it more abstract.

If you don't, __you create what is commonly refereed in code as a spaghetti monster of code__ which is nearly impossible to fix.

## Encapsulation

Encapsulation is basically just making sure that an engineer can only do certain things with a class or an object. The more methods that you can run with an object, the higher the chances are of actually breaking the code. 

This is why it's __always best to limit the properties or methods you can tap into lower the chances of accidentally breaking your code.__

This will also generally lower the intermingled code in your codebase.

## Making Private Properties and Methods

To make a property private in a class, all you have to do is put an underscore before it:

```dart
class MakeIceCream {
  String _privateProperty = "Can't touch this";
  _privateProperty = "Actually, I can within the Class"
}
```

__NOTE:__ You can tap into a private property within the class where it initialized.

## Inheritance

Inheritance basically is __the ability that an class has to inherit from a superclass.__ This will allow you to get very granular within code and build code on top of each other. This is basically the core of Flutter since each Widget (just a class) builds on each other.

The difference between a class and a superclass is that __a class is not a parent class (nothing inherits from it)__. On the other hand, a __superclass is a parent class (one or more classes inherit from it)__

To inherit from another class, use the __`extends` keyword__ to __implement all properties and methods from the parent class.__ If you want to tap into one of these properties or methods from the parent class, use the __`super` keyword.__

```dart
class Vehicle {
  final String color;
  final String definition = "Vehicle";
  Vehicle({this.color});
}

class Car extends Vehicle {
  void drive(){
    print("wheels turning");
  }
}
```

##  Polymorphism

The exact definition of polymorphism is _"to change shapes"_. However, in development, it __means to change behaviors that a child class might inherit from its parent class.__

In dart, you would use the `@override` keyword to, well, _override_ certain aspects or behaviors from the parent class.

```dart
class Vehicle {
  final String color;
  final String definition = "This is a vehicle";

  void move(){
    print("vehicle moves");
  }
}

class Car extends Vehicle {
  @override

  void move(){
    print("wheels turn");
  }
}
```

__CODE DECONSTRUCTION:__ As you can see, the `move()` method is defined once in the `Vehicle` class and then, inherited to the `Car` class. However, the `Car` class is then able to override it because of the `@override` keyword. Even though it's called the same, it could serve a completely different purpose.

However, you can also access/call methods/properties of the super class with the `super` keyword.

```dart
class Person {
  String description = "This is a person";

  void talk(String statement){
    print(statement);
  }
}

class Mark extends person {
  void sayHi(){
    super.talk("${super.description} called Mark")
  }
}
```

__This is like how you have to tap into properties and methods with the `this` keyword in JS and TS.__