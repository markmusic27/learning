# 🛠 Advanced Topics

## List View

The `ListView()` widget essentially allows you to **display a set of items in a scrollable list.** At it's simplest, you just give it a list of items and it handles the rest.

```dart
ListView(
    children: [
        Container1(),
        Container2,(),
        Container3()
    ]
)
```

### What's cool about the `ListView()` widget is that it's all customizable

You can change the **scroll direction with the `scrollDirection` property:**

```dart
ListView(
    children: [
        Container1(),
        Container2,(),
        Container3()
    ]
    scrollDirection: Axis.horizontal,
)
```

### You can reverse the order with the **`reverse` property property which simply expects a boolean.**

You can make the list static (never be scrollable) with the `physics` property. 

```dart
ListView(
    children: [
        Container1(),
        Container2,(),
        Container3()
    ]
    physics: NeverScrollableScrollPhysics(),
)
```

### Discarding Invisible Items

If you want the items that are no longer visible to be discarded, **use the `addAutomaticKeepAlive` property which expects a boolean.** You can tell Flutter exactly what offscreen means with the `cacheExtent` property.

```dart
ListView(
    children: [
        Container1(),
        Container2,(),
        Container3()
    ]
    scrollDirection: Axis.horizontal,
    addAutomaticKeepAlive: false,
    cacheExtent: 100.0,
)
```

### If you have a long list of items, you can build on demand with the `ListView.builder()`. 

```dart
ListView.builder(
    itemBuilder: (_, index) => Container(
        child: Text("Item #$index"),
    )
)
```

This is just a widget that has a property called item builder, __this property expects an anonymous function.__ This anonymous __function returns only the widget__ you want to build. It is __also an arrow function since the only thing that the function does is return that widget.__

### Want space between your items? Use the `ListView.separated()`.

```dart
ListView.separated(
    itemBuilder: (_, index) => Container(
        child: Text("Index # $index")
    ),

    separatorBuilder: (_, _) => Divider(),
    itemCount: items.length,
)
```

As we can see, __this also has the `itemBuilder` property__. However, this widget __includes a property called `separatorBuilder` which also expects an anonymous function that returns a Widget.__

NOTE: Don't forget to add the __`itemCount` property which is just the total amount of items.__ 

___

## For In Loops

The `for` `in` loops, you are simply iterating within that iterable (_ex. a list_). You can then do something with each one of those indexes in the list.

```dart
for (DataType indexInList in listName){}
```

As you can see, you don't need to use the `i` keyword and everything. That will then iterate through the amount of times it has to, to be able to iterate through each index in the list.

You can then use the keyword you defined to test it out.

```dart
for (String name in peopleIKnow){
    print(name);
}
```

___

## Cupertino Widgets

To be able to use cupertino widgets in your code, you have to import the `cupertino.dart` file first.

```dart
import "package:flutter/cupertino.dart";
```

You can use cupertino widgets just like you use material widgets.

The interesting thing is that you can display cupertino widgets when the OS is iOS or iPadOS, and display material widgets when the OS is AndroidOS.

___

## Building Platform Specific UIs

There are three steps to accomplishing this:

1.  Make Platform Specific UIs.
2.  Import `dart:io`. You only need the Platform file so only show the Platform file.

```dart
import "dart:io" show Platform;
```

3.  Create a function that returns a Widget. Check against it in the conditional statement.

```dart
Widget getWidget(){
    return Platform.isIOS ? CupertinoWidget() : AndroidWidget();
}
```

4.  Use that method when needed.

```dart
child: getWidget(),
```
