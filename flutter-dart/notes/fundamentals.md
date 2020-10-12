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

2.  Go to the [Icon App Generator](https://appicon.co/) website where you will genertae the icons.

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
