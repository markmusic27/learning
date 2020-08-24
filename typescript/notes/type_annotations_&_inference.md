# 📼 Type Annotations & Type Inference

## What are they?

**Type Annotation:** It's when we (the developers) tell TS what type of value a variable will refer to.

**Type Inference:** It's when TS guesses (infers) what type of value a variable will refer to.

| Compare          | Type Annotations             | Type Inference              |
| ---------------- | ---------------------------- | --------------------------- |
| **Similarities** | Used to declare value        | Also used to declare value  |
| **Differences**  | We tell TS the type of value | TS infers the type of value |

_The big question is: Are you going to code in the types manually or will you let TS do it for you._

---

## Examples of Type Annotations with Variables

To use _type annotation_ with `variables`, your code would look a little like this:

```ts
const variableName: number = 5;
```

**CODE DECONSTRUCTION:** To understand this code snippet, we have to divide it into 4 pieces:

1. `const` is where you declare the type of variable it is `[var, let, const]`.
2. `variableName` is where you declare the name of the given variable.
3. `: number` is where you declare the type with _type annotation_ . In this case, the value has a type of `number`.
4. `= 5;` is where you declare the value of the varaible. **The value is not the type.**

_You can do the same thing with anything. **For example, built in objects:**_

```ts
let date: Date = new Date();
```

</br>

### **Type annotation with _arrays_**

```ts
const nbaTeams: string[] = ['Sixers', 'Rockets', 'Lakers'];
```

**CODE DECONSTRUCTION:** The only thing that is different here is how you declare the type. To do this, we have to deconstruct the assignation in to 3 pieces:

1. First, you have to see what are the types of the indexes in the array. In this case, the array has indexes that all have a type of `string`.
2. Second, you would code in the type of the indexes after the `:`. In this case, you would write `: string`
3. Third, you would write `[]` after the index. This indicates TS that your type is an array.

**NOTE:** The `[]` dirrectly after `string` _DO NOT_ create an array. It _ONLY_ tells TS that the type is an array.  
</br>

### **Type annotation with _classes_**

```ts
class Dog {}

let puppy: Dog = new Dog();
```

**CODE DECONSTRUCTION:** To understand this snippet of code, we must break it down into 5 pieces:

1. Notice the `class` called Dog. All classes have a capital leter at the beginning.
2. `let` is where you declare the type of variable it is `[var, let, const]`.
3. `puppy` is the name of the variable and where you would declare the name of the variable.
4. `: Dog` is declaring the type of the value. It is stating that the value has a type of the Dog class. _Notice how the D in `Dog` is capitalized and how there is no parenthesis after it._
5. `= new Dog();` is declaring the value of the `puppy` variable. The `new` is a keyword allows you to create a new instance of the class. Then, `Dog()` refers to the class name.

### **Type annotation with _object literals_**

```ts
let objectName: { name: string; age: number } = {
  name: 'Mark',
  age: 15,
};
```

**CODE DECONSTRUCTION:** To understand this code snippet, we must break the code down into 5 pieces::

1. `let` is where you declare the type of variable it is `[var, let, const]`.
2. `objectName` is the name of the variable and where you would declare the name of the object.
3. `{ name: string; age: number; }`
   - The `{}` brackets are telling TS that value is of type object.
   - `name: string; age: number;` is declaring the property name and the value type of _EVERY_ property in the object. For example, the property name is `name`. **_The `:` colon goes dirrectly next to it._** Then the property value type, in this case a `string`, is declared. **_Notice the `;` semicolon after every property value._**
4. Finally, everything that goes after the `=` is the actual object.

### **Type annotation with _functions_**

```ts
const addOne: (num: number) => void = (num: number) => {
  console.log(num + 1);
};
```

**CODE DECONSTRUCTION:** To understand this code snippet, we must deconstruct it into 5 parts:

1. `const` is where you declare the type of variable it is `[var, let, const]`.
2. `addOne` is the name of the variable and where you would declare the name of the function.
3. `: (num: number) => void` is where the type is declared. Think of `const addOne` as a variable. We would declare the type of the value of the variavle `addOne` here.
   - `:` is telling TS that anything after it is the type of the value of the variable.
   - `(num: number)` is where we declare the parameters used inside of the function and their type. _This includes any inputs._
   - `=>` is telling TS that anything after it is what the function is supposed to return.
   - `void` is what this specific function returns. Void is used when the function returns nothing. _Here is where you would type in what the function returns._
4. `=` tells TS that anything after it is the actuall value of the variable. _**After this is where the function is actually declared.**_
5. `(num: number)` is the input that is function expects. The `: number` tells TS what is the type of `num`. _**Here is where you would declare the inputs of the function**_
6. `=>` tells TS that anything after it is the actuall thing the function does.
7. `{ console.log(num + 1); };` is what the function actually does. In this case, it only prints `num + 1` to the console.

---

## Understanding Type Inference

Type inference is TS infering what is the type of the value of a variable. **_TS relys on type inference when we (the developer) don't specify the type of the value of the variable._**

Something that is key is that...

```ts
let name = 'Mark Music';
```

this line of code is actually two steps in one.

1. `let` `name` is the first one and it's where you declare the variable. It is _everything to the left of the equals sign._
2. `= 'Mark Music';` is the second part of the snippet and where you initialize the variable by giving it a value. It is _everything to the right of the equals sign._

_TS depends on this code simplification to see (infer) what is the type of that variable's value._

**NOTE: Type Inference _WILL NOT_ work if the initialization of the variable is done in a seperate line of code. Like this:**

```ts
// Wrong Way
let name;

name = 'Mark';

//Right Way
let name = 'Mark';
```

Notice how the initialization _of the wrong way_ is in a seperate line of code.

### **When should we use one over the other?**

There are _**three**_ main scenerios where we would use Type Annotations instead of just relying on Type Inference.

| Condition           | Type Annotation                                                          | Type Inference |
| ------------------- | ------------------------------------------------------------------------ | -------------- |
| **When to use it?** | When a function returns the `any` type and we need to clarify the value. | Always!        |
|                     | When we declare a variable on one line and initialize it later.          |                |
|                     | When we want a variable to have a type that can't be infered.            |                |
