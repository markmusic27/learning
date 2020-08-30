# 📸 Type Annotations With Functions & Objects

## 🏏 More On Type Annotations Around Functions

These notes with go into detail on how to use _Type Annotations_ with _functions_ is TS.

**The point of Type Annotations with functions is to tell TS what arguments said function will recieve and the type of value it will return.**

In the last notes, we weren't really using type annotations with furnctions. **_We were just giving a variable a type of function._**

Type Inference can also be applied to functions but it will only work with the type of value that a function returns. Basically, Type Inference completly ignores arguments in a function.

**IN CODE:**

```ts
const divide = (num1: number, num2: number): number => {
  return num1 / num2;
};
```

**CODE DECONSTRUCTION:**

In this snippet, we have a function called divide which divides `num1` and `num2` which are the two inputs. The fuction then returns `num1 / num2`. _In regards to the Type Annotation, there are to essential things to remember:_

1. Always add the type of an input: `num1: number`, `num2: number`. In this case, the function takes input `num1` which is sopposed to be a number and input `num3` which is also sopposed to be a number.
2. Always add the type of value that the function returns after the parenthesis: `(num1: number, num2: number): number`. In this case, the function returns a **value of type number.**

---

## 🛹 Inference Around Functions
