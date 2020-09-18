# ⚙️ Mastering Typed Arrays

## Arrays in TypeScript

Arrays in TS are **basically the same** as in JS. We can still `push` and `pop` etc. _The only difference is that in TS, **we will mostly only use indexes of the same type** in the array._

**EXAMPLE:** If we create an array of strings, we will only put indexes with types of string in the array.

You could put indexes with different types but you **have** to be very specific on what are the types by using _Type Annotation_.

```ts
const shoeMakers: string[] = ["nike", "adidas" "puma"];
```

**CODE DECONSTRUCTION:** This code snippet is basically just initializing and declaring a variable called `shoeMaker`. We are giving it a value of an array of indexes with a type of string. The `: string[]` is not necessary since type inference would do that for us but that is how you would quick type annotations with an array.

To show 2 or 3 dimensional arrays with type annotation, you would simply put multiple pairs of square brackets like this:

```ts
const array: number[][] = [
  [13, 12, 11],
  [10, 9, 8],
  [7, 6, 5],
];
```

**Read the `number[][]` from right to left.**

1.  We would first see the `[]` which would indicate an array.
2.  Then we would see the second `[][]` which would indicate an array inside of the array.
3.  Finally, we see the key word `number` which indicates that the indexes in that array have a type of number.

---

## Typed Arrays

Arrays in TS have many **pros** and **cons**:

_Here are some of the **pros:**_

1.  If you use bracket notation to pull a value from an array and assign it to a variable, type inference will automatically set the type of the variable to the type of the index that you're pulling.
2.  It will also help us to not add incompatible values into an array.
3.  Anytime we create an array, we automatically get access to many useful functions like `map`, `forEach`, and `reduce`.

---

## Multiple Type Arrays

Another bonus to typed arrays is that they allow you to have multiple types although **this is _NOT_ encouraged**.

What you would do is simply use the **_or_** ( `|` )operator in TS.

**Note that it is one pipe sign and _not two_.**

```ts
const differentDates: (Date | string)[] = [new Date(), '27/02/05'];
```

As you can see, it is also important to **wrap the types in parenthesis** (`()`) and **then using the brackets** (`[]`) to indicate the type annotation.

**Type inference will also do this for you.**

---

## When to Use Typed Arrays

The answer is simple and clear:

We will use Typed Arrays **any time we need to represent a collection of records with some arbitrary sort order.**

However, there is another thing very similar to arrays called **Tuples**.
