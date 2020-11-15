# 🛠 Advanced Topics

## Flutter Hero Animations

One of the most common ways of using animations in Flutter is to use _Hero Animations_. Basically, these consist of animating a shared element during a page transition. This allows you to have a continuous and steadily animation throughout the whole transition. This shared element can be anything from an image to an icon, etc.

To make this possible, **we'll be using the hero widget.**

### **Here are the steps we need to follow:**

1.  **Two `Hero()` widgets.** One on the first screen, the other on the second. 
2.  **A shared tag property.** Make sure that they have the same value.
3.  **Use a navigator based screen transition.** For example, `Navigator.pushNamed()`, or `Navigator.pop()`.

With this, Flutter will automatically see what changes and make a continuous transition.

___

## Custom Flutter Animations

With Flutter, you aren't limited by the animations that come right out of the box, you can also take them a step further and **make custom animations**.

#### **Here are the steps we need to follow:**

1.  A Ticker
2.  An Animation Controller
3.  An Animation Value

A ticker, much like the ticking of a clock, ticks our animation along. On each tick, the animation will change in value (_size, color, etc_). What will happen is that on each tick, it triggers a newt `setState()` so we can render something different on the screen.

The Animation Controller is like the manager of the animation. It is the one who will tell the animation:
-   to start or to stop,
-   to go forward, 
-   to loop back, 
-   how long to animate for
-   etc.

All of these things are determined by the animation controller.

The Animation Value is the one who actually does all the animating.
With this, were able to change:
-   the height,
-   the size,
-   the color,
-   the opacity,
-   etc.

Here is what you would do in code:

1.  Declare a parameter with a type of AnimationController.

```dart
AnimationController controller;
```

2.  Then, in the `initState()` of your widget, you would use that controller to build up your animation.

```dart
void initState(){
    super.initState();

    controller = AnimationController();
}
```

The `AnimationController()` widget has two expects two properties. The first is the `duration:` property which tells Flutter the duration of the animation. This expects a `Duration()` widget. It also expects a property called `vsync` which is the ticker that we were talking about before. You can use the state of your widget/screen to do it but you have to upgrade the class using a mixin (_if you don't know what a mixin is, don't worry. it will be covered in the next section_). That mixin is the `SingleTickerProviderStateMixin`. If you were making more than one animation in the widget/screen, then you would just remove the Single part and it would be: `TickerProviderStateMixin`. To use a mixin, you would use the `with keyword`. 

```dart
class _ScreenState extends State<Screen> with SingleTickerProviderStateMixin {
    AnimationController controller;

    @override

    void initState(){
        super.initState();

        controller = AnimationController(
            duration: Duration(seconds: 1);
            vsync: this,
        );
    }
}
```

**NOTE:** Whenever you are referencing a class/object within itself, you use the `this`.

3.  Add `controller.forward()`. This will just make the the animation proceed forward. 

By default, AnimationControllers animate a number. That number ranges from 0 to 1.

You can make it go from 1 to 0 by calling `controller.reverse()` instead of `controller.forward()`

```dart
controller.forward();
```

```dart
controller.reverse(from: 1.0)
```

**NOTE:** Make sure you include the `from:` property that tells it where to count from.

**For example:** In one second, your might get 60 ticks on your ticker. This means that it would go from 0 to 1 in 60 steps.

1.  Add `controller.addListener()`.

To be able to see what the controller is doing, you would use `controller.addListener()` method. This expects a callback. You can then tap into `controller.value` to see the value of the controller, _aka. the animation._

You can then use the `controller.value` to animate different aspects of your UI.

```dart
// this is in initState()
controller.addListener((){
    setState((){});
})
// this is in initState()

@override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red.withOpacity(controller.value);
    );
```

**NOTE:** Make sure to call `setState()` in the `controller.addListener()` to mark `controller.value` as dirty.

### Curved Animations

As you can see, you can use the `controller.value` to animate all sorts of things.

However, you can see that our `controller.value`, to this point, has been increasing pretty linearly. In Flutter, you aren't limited to this. You can use the `CurvedAnimation()` class to make the value unique to what you want.

Flutter has some great documentation on all the types of curves in [this link](https://api.flutter.dev/flutter/animation/Curves-class.html).

You can check the documentation for the `CurvedAnimation()` widget [here](https://api.flutter.dev/flutter/animation/CurvedAnimation-class.html).

#### **To do this, you would follow these steps:**

1.  Make a new parameter and give it a type of `Animation`.

```dart
Animation animation;
```
2.  Initialize it with the `CurvedAnimation()` widget. This has two props: `parent`: which expects the `controller`, and `curve` which expects the curve.

You would also initialize `animation` in your `initState()`.

**NOTE:** Make sure that your `upperBound:` is 1 when using the `CurvedAnimation()` or your app will crash.

```dart
animation = CurvedAnimation(parent: controller, curve: Curves.ease);
```

**Then, you would use `animation.value` instead of `controller.value`**.

#### **You can also make an animation loop with these steps:**

1.  Add a `controller.statusListener()` which just expects a callback with an input. That input is the status.

```dart
controller.statusListener((status){
    print(status);
})
```

2.  You can the use it that to loop the animation.

The status will either be `AnimationStatus.completed` if you're using `controller.forward()` or `AnimationStatus.dismissed` if you're using `controller.reverse()`

```dart
controller.addStatusListener((status){
    if (status == AnimationStatus.completed){
        controller.reverse();
    } else if (status == Animation.dismissed){
        controller.forward();
    }
})
```

**NOTE:** This will run forever, and won't stop until you dispose the animation controller.

You can do this by using the `dispose` method

```dart
@override
void dispose() {
    controller.dispose();
    super.dispose();
}
```

**NOTE:** Do it before the `super.dispose` since that disposes everything.

### **Tween Animations**

You can finally make animations that go from one element, to another element **(_ex: `Colors.red` to `Colors.blue`_)**

For this, you would use Tween Animations.

#### **Follow these steps to make a tween animation:**

1.  Make a new parameter and give it a type of `Animation`.

```dart
Animation animation;
```
2.  Initialize it with the `Tween__thing your changing__()` widget. This has two props: `begin`: which expects the widget you start with, and `end` which expects the widget you end with.

You would also initialize `animation` in your `initState()`.

**NOTE:** Make sure that your `upperBound:` is 1 when using the `Tween__thing your changing__()` or your app will crash.


**For example:** 
```dart
class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    animation = ColorTween(begin: Colors.blue, end: Colors.red).animate(controller);;

    controller.forward();

    controller.addListener(() {
      setState(() {});
      print(animation.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: animation.value,
    );
  }
}
```

**NOTE:** You can do more than just change through colors. Go to [this link](https://api.flutter.dev/flutter/animation/Tween-class.html) to see the documentation on Tweens.

**REMEMBER TO ALWAYS ADD THE DISPOSE METHOD NO MATTER WHAT**

___

## Dart Mixins 

At its simplest, Mixins are a way of adding certain features to classes without having to inherit them.

In Dart, and many other modern day OOP languages, you can inherit from a super/parent class. However, many times, you have features used throughout the codebase but you, either already inherited from a class or you don't want to inherit for a simple feature. This is where mixins come in.

I like to think of mixins as plug-ins that you can add to your classes to give them special capabilities or features.

#### **You would create mixins by:**

```dart
mixin NameOfMixin {
    // Feature or Plug-in you want to add.
}
```

#### **You would use mixins by:**

```dart
class NameOfClass with NameOfMixin {
    // You can use the mixin code like if you had wrote it in the class.
}
```

___

## Prepackaged Flutter Animations

With Flutter, you can use pre-built animations that can be very complex to make yourself. You can do this by using [pub.dev](https://www.pub.dev).

#### **Here is a list of some of the best:**

1.  [Animated Text](https://pub.dev/packages/animated_text_kit)
2.  [Sequence Animations](https://pub.dev/packages/flutter_sequence_animation)
3.  [Rubber](https://pub.dev/packages/rubber)
4.  [Sprung](https://pub.dev/packages/sprung)
