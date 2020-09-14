# 📸 Type Annotations With Functions & Objects

## More On Type Annotations Around Functions

These notes with go into detail on how to use _Type Annotations_ with _functions_ is TS.

**The point of Type Annotations with functions is to tell TS what arguments said function will receive and the type of value it will return.**

In the last notes, we weren't really using type annotations with functions. **_We were just giving a variable a type of function._**

Type Inference can also be applied to functions but it will only work with the type of value that a function returns. Basically, Type Inference completely ignores arguments in a function.

**IN CODE:**

```ts
const divide = (num1: number, num2: number): number => {
  return num1 / num2;
};
```

**CODE DECONSTRUCTION:**

In this snippet, we have a function called divide which divides `num1` and `num2` which are the two inputs. The function then returns `num1 / num2`. _In regards to the Type Annotation, there are to essential things to remember:_

1. Always add the type of an input: `num1: number`, `num2: number`. In this case, the function takes input `num1` which is supposed to be a number and input `num3` which is also supposed to be a number.
2. Always add the type of value that the function returns after the parenthesis: `(num1: number, num2: number): number`. In this case, the function returns a **value of type number.**

---

## Inference Around Functions

_**Something important to remember is that TS is only worried about the types in your code, not the logic in your code.**_

With Type Inference around functions, you don't have to add the Type Annotation for return in a function.

```ts
const predictGame = (ratingA: number, ratingB: number) => {
  let equation = (ratingA - ratingB) / 400;
  equation = Math.pow(10, equation);
  equation = equation + 1;
  equation = 1 / equation;
  equation = equation.toFixed(2);
  return Number(equation);
};
```

In this snippet, TS knows that the function is returning a number because of `Number(equation);`.

**However, it is essential to _never skip this step_ since it makes the code clear and there are instances where we need it.**

---

## Annotations Around Anonymous Functions

With anonymous functions, the code is also pretty simple:

```ts
//Declaring Functions with Function Keyword:
function addSentence (sent1: string, sent2: string): string {
  return sent1 + " " + sent2;
}

//Anonymous Functions Assigned to a Variable:
const turnToNum (num: number): number {
  return Number(num);
}
```

As you can see in the code snippet, we are declaring what the function will return **immediately after the parenthesis.** We do this in both scenarios.

---

## Void & Never

There are two types that are unique. These are `never` and `void`.

**Void is used when a function doesn't return anything.**

```ts
const runMe = (message: string): void => {
  console.log(message);
};
```

This function doesn't return anything, therefor, it has a type of void.

**Never is used when a function never ends (aka when it throws out an error). _These are very rare._**

```ts
const throwError = (message: string): never => {
  throw new Error(message);
};
```

This code is going to leave out of the function early since it will throw an error if called. This means that we would use the type never. **Remember, the `never` type is very rare!**

---

## Destructuring with Annotations

In _ES15_, JS started to allow you to destructure objects to get exactly what you want from them. This is also possible with TS.

```ts
const myGoals = {
  goal1 : "Do La Ruta de Los Conquistadores race",
  goal2 : "Create an app that gets featured in the App Store.",
  goal3 : "Meet someone who you genuinely enjoy spending time with."
}

const getGoal1 = ({goal1} : {goal1: string}) = {
  console.log(goal1)
}

getGoal1(myGoals);
```

**CODE DECONSTRUCTION:** Here, we are first creating an object called `myGoals` which has three parameters: `goal1`, `goal2`, `goal3`. Then we are creating a function that destructures myGoals.

- `{goal1}` is simply getting the parameter `goal1` from the `myGoals` object
- `:` _the colon_ divides the actual desructuring with the TS Annotations.
- `{goal1: string}` is simply telling TS that `goal1` has a type of string.
- `console.log(goal1)` is just printing `goal1` to the console.

Finally, we are calling `getGoal1()` and giving it an input of an object called `myGoals`.

LES GOOOO
