# ⌨️ Type System

__What is a type system:__ A type system is an easy way to refer to the different `properties` and `functions` that a value has.

__For example:__ 
```ts
let a = "red";
```
The value `"red"` has a type of string. You can go more in depth and say: "`red` is a value hat has properties and methods that we asume that a string has".

**_Type is basically a shortcut to describe the different properties and methods that a single value has._**

__REMEMBER:__ Every value in TS has a type.

---

## Examples of Types

__Common types:__
* string - `"example"`
* number - `14`
* boolean - `false`
* Todo - `{id: 1, completed: false, title: "Todo 1"}`

The `Todo` type is an example of a type that is declared in an interface.

In TS, a number is a number is a number. There is no such thing as `int` or `float`. **_A number can have decimals, no decimals, can be negative, etc._**

__There are two groups of types in TS:__
* Primative Types
* Object Types

__Primative Types__ include all of the basic types like numbers, booleans, strings, etc.

__Object Types__ include all types that you creat like objects, functions, classes, and arrrays. The also include any other types that are built into the language itself.

__Why do we even care?__ Types allow the TS compiler to catch errors and it also allows other developers to see understand what type a value has.

---

## More on Types

Whenever you create an object and don't specify a type with an intefrace, __the type will default to be the whole object.__

_Here are some examples of types in action:_

__Example 1:__

```ts
const today = new Date();
today.getDate();
```
In this scenerio, the variable `today` has a type of `Date()`. This means that it has access to all of the properties and methods that `Date()` has. You can see this when dot notation is used to `getDate()`.  
  
__Example 2:__

```ts
const person = {
  age: 20,
};

person.age;
```
In this scenerio, the variable `person` has a type of `object`. This means that it has access to all of the properties and methods that the object has `(like age)`. You can see this when dot notation is used (`person.age;`).  
  
__Example 3:__

```ts
class Color {

};

const red = new Color();
```
In this scenerio, the variable `red` has a type of `Color()`. This means that it has access to all of the properties and methods that `Color()`.

---

## Where to use Types?

The answer is plain and simple. In TS, types are used everywhere. Whether you like it or not, every value has a given type associated with it. TS depends types to catch the simple but annoying errors in your code.
  


















