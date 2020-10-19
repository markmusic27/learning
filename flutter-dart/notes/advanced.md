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

---

What's cool about the `ListView()` widget is that it's all customizable

You can change the **scroll dirrection with the `scrollDirection` property:**

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

---

You can reverse the order with the **`reverse` property property which simply explects a boolean.**

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

---

If you want the items that are no longer visible to be discarted, **use the `addAutomaticKeepAlive` property which expects a boolean.** You can tell Flutter exactly what offscreen means with the `cacheExtent` property.

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

---

If you have a long list of items, you can build on demand with the `ListView.builder()`. 

```dart
ListView.builder(
    itemBuilder: (_, index) => Container(
        child: Text("Item #$index"),
    )
)
```

This is just a widget that has a property called item builder, __this property expects an anonymous function.__ This anonymous __function returns only the widget__ you want to build. It is __also an arrow function since the only thing that the function does is return that widget.__

---

Want space between your items? Use the `ListView.seperated()`.

```dart
ListView.seperated(
    itemBuilder: (_, index) => Container(
        child: Text("Index # $index")
    ),

    seperatorBuilder: (_, _) => Divider(),
    itemCount: items.length,
)
```

As we can see, __this also has the `itemBuilder` property__. However, this widget __includes a property called `seperatorBuilder` which also expects an anonymous function that returns a Widget.__

NOTE: Don't forget to add the __`itemCount` property which is just the total ammount of items.__ 


