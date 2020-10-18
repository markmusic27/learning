# 🦟 Useful Notes

## Section #1 | Basics

### **Scaffold**

The `Scaffold` widget is **simply a layout widget** that allows you to do many things with it like have an app bar.

### **Image**

The `Image` widget is just a frame that **doesn't have an image in default.** It has a property called `image:` where you can input the image you want with either `AssetImage()` or `NetworkImage()`.

```dart
Image(
    image: AssetImage("images/image.png")
)
```

### **Working with `pubspec.yaml`**

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

### **Adding App Icon**

To add an app icon, there are **three steps**

1.  Make sure that you have a **good quality** icon.

2.  Go to the [Icon App Generator](https://appicon.co/) website where you will genertae the icons.

3.  Once in the site, make sure that select the platforms you're developing for.

4.  Download and unzip.

5.  Go to the `*yourproject*/android/app/src/main/res` path and replace the `mipmap` files with the ones you just downloaded.

6.  Go to the `*yourproject*/ios/Runner` path and replace the `Assets.xcassets` file with the one you downloaded.

### **Stateless Widget**

A stateless widget is basically a widget with no state. Its a class that returns your code.

The boilerplate looks like this:

```dart
class Name extends Stateless {
  @override

  Widget build(
    return //Code Here
  )
}
```

The `build()` method **will run every time the code is changed.**

### **Container**

The container widget is basically just a div.

**NOTE:**

- It is a single child widget.
- It will take up as much space as it can when it doesn't have a child.
- It will take us as little space as possible when it has a child.

### **Margin & Padding**

The margin and padding properties will always expect an `EdgeInsets` widget which has itself methods of:

- `EdgeInsets.all(100.0)`
- `EdgeInsets.only(top: 50)`
- `EdgeInsets.symmetric(vertical: 100.0)`

### **Containers & Rows**

Containers and rows are multi-child widgets. You can give them different properties like:

- `mainAxisAlignment: MainAxisAlignment.center`
- `mainAxisSize: MainAxisSize.min`
- `crossAxisAlignment: CrossAxisAlignment.stretch`
- `verticalDirection: VerticalDirection.up`
- `horizontalDirection: HorizontalDirection.up`
