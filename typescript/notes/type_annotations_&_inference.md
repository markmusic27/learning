# 📼  Type Annotations & Type Inference
## What are they?

__Type Annotation:__ It's when we (the developers) tell TS what type of value a variable will refer to.

__Type Inference:__ It's when TS guesses (infers) what type of value a variable will refer to.

| Compare          | Type Annotations             | Type Inference              |
| ---------------- | ---------------------------- | --------------------------- |
| __Similarities__ | Used to declare value        | Also used to declare value  |
| __Differences__  | We tell TS the type of value | TS infers the type of value |
  
_The big question is: Are you going to code in the types manually or will you let TS do it for you._

---

## Examples with Variables

To use _type annotation_ with `variables`, your code would look a little like this:
```ts
const variableName: number = 5;
```
__CODE DECONSTRUCTION:__ To understand this code snippet, we have to divide it into 4 pieces:  
1. `const` is where you decide what type of variable it is `[var, let, const]`.
2. `variableName` is the name of the given variable.
3. `: number` is where you declare the type with _type annotation_ .
4. `= 5;` is where you declare the value of the varaible. __The value is not the type.__

