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
1. `const` is where you declare the type of variable it is `[var, let, const]`.
2. `variableName` is where you declare the name of the given variable.
3. `: number` is where you declare the type with _type annotation_ . In this case, the value has a type of `number`.
4. `= 5;` is where you declare the value of the varaible. __The value is not the type.__

_You can do the same thing with anything. **For example, built in objects:**_

```ts
let date: Date = new Date();
```
__With arrays, things get a little more complex. Here is how you would assign a type to an array:__

```ts
const nbaTeams: string[] = ["Sixers", "Rockets", "Lakers"];
```
__CODE DECONSTRUCTION:__ The only thing that is different here is how you declare the type. To do this, we have to deconstruct the assignation in to 3 pieces:
1. First, you have to see what are the types of the indexes in the array. In this case, the array has indexes that all have a type of `string`.
2. Second, you would code in the type of the indexes after the `:`. In this case, you would write `: string`
3. Third, you would write `[]` after the index. This indicates TS that your type is an array.  


__NOTE:__ The `[]` dirrectly after `string` _DOES NOT_ create an array. It _ONLY_ tells TS that the type is an array.

