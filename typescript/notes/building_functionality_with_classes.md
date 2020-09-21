# 🐝 Building Functionality with Classes

## Classes

Think of classes as a **blueprint or a template to create an object** with **different fields (_values_) and methods (_functions_) attached to it** to **represent a "thing"**.

To understand classes, we must divide the section into two pillars.

### **How classes are built:**

```ts
class Airplane {
  fly() {
    console.log('swoosh');
  }

  brake() {
    console.log('brrrrr');
  }
}

const a380 = new Airplane();

const a340 = new Airplane();
```

**CODE DECONSTRUCTION:** With classes, there are some things to keep in mind:

1.  Their first character is **always** capitalized.
2.  They are **coded like objects**. If you want to create a method, you would do it like if you were with an object.
3.  When **creating a new instance** from that class, you would use the `new` keyword.
4.  They are divided into **instance methods** (_what they do_) and **instance properties** (_what they have_)
5.  Every class **has a constructor** (_a method_) It is ran only once during the life of the object and run when it's being created. **It is used to setup your object**.
6.  In constructors, you **can setup instance properties.**

---

## Basic Inheritance

One interesting thing about **classes is that they can be built on each other.** You can **inherit whatever properties and methods you want and overwrite the ones you don't.**

```ts
class Vehicle {
  move() {
    console.log('swoosh');
  }
}

class Helicopter extends Vehicle {
  fly() {
    console.log('tiki tiki');
  }
}

class Boat extends Vehicle {
  float() {
    console.log('vroom');
  }
}

const boat = new Boat();
const helicopter = new Helicopter();

boat.move();
helicopter.move();
```

**CODE DECONSTRUCTION:** As you can see in the code snippet, we are using the `extends` keyword to tell TS that we are extending from the `Vehicle` class. **This allows for all of the properties and methods that `Vehicle`has to be passed on to the `Boat` and `Helicopter` classes.**

---

## Instance Method Modifiers

In TS, there is a thing called **`modifiers`**. These basically allow us to tell TS that has access to a variable and function. So a modifier has three states:

- **Public:** This method can be called any where, any time.
- **Private:** This method can only be called by other methods in this class.
- **Protected:** This method can be called by other methods in this class, or by other methods in child classes.

**The default of a variable and a function is _`public`_.**

```ts
class Vehicle {
  protected move() {
    console.log('swoosh');
  }
}

class Helicopter extends Vehicle {
  fly() {
    console.log(`${this.move()}`);
  }
}
```

**CODE DECONSTRUCTION:** In this code snippet, we can see that `move()` has a modifier of protected. This allows for the `Helicopter` class to access it. However, it cannot be accessed outside of a child class.

---

## Fields in Classes

Here is where constructors come in handy. **Since classes are just templates to create objects, it is best if we pass in the fields that we are using in a box.**

```ts
class Quadrilateral {
  calculateArea() {
    return this.hight * this.width;
  }
  constructor(public hight: number, public width: number) {}
}

const rectangle = new Quadrilateral(100, 20);

console.log(rectangle.calculateArea());
```

**CODE DECONSTRUCTION:** As we can see in this code snippet, we are creating a `constructor` with arguments of `height` and `width`. **We are giving them the `public` modifier to save code.** These parameters can then be used throughout the class.

---

## Fields with Inheritance

Whenever using fields and classes (_specially superclasses_), we must remember some key points:

1.  If a class extends another class and that class has a constructor, **the child class will inherit the constructor.**

2.  To overwrite the class, we must define another one and call the `super()` method. This method basically calls the super class's constructor. **Remember, if your super class takes any inputs, we must input them in the `super()` method.**

3.  A tip is that if you find yourself overwriting a constructor that is in a super class, **the constructor should probably not be in the super class.**

```ts
class Drink {
  constructor(public sugar: number, public flavor: string) {
    console.log(
      `This drink has a sugar content of ${sugar} and has a flavor of ${flavor}.`
    );
  }
}

class Soda extends Drink {
  constructor(sugar: number, flavor: string) {
    super(sugar, flavor);
  }
}

const fanta = new Soda(10, `orange`);
```
