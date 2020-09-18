# 🦈 Tuples in Typescript

## Tuples in Typescript

A tuple is an array like structure **where each element represents some property of a record.**

The big difference is between tuples and arrays is that **tuples are made for multiple types while arrays are not.**

```ts
//Objects
{
    name : "Mark",
    age : 15,
    coder : true
}

//Tuples
["Mark", 15, true]
```

As you can see, **order is essential** in tuples. As developers, we have to **remember the order** of tuples. With tuples, we don't **have the name of the property** like `name` or `age`.

---

## Tuples in Action

What allows tuples to be different from arrays is that they **lock the order of the types in the tuple**.

```ts
// Array
const food: string[] = ['hamburger', 'fries', 'milkshake'];

// Tuple
const drink: [string, boolean, number] = ['brown', true, 40];
```

Arrays will **allow you to use different types but without order**. Tuples **depend on order so they lock it.**

The main difference is that in tuples, you **declare the types within the brackets**.

You can also use **type alias.** This basically allows you to create a type and assign it as a type annotation.

```ts
type Drink = [string, boolean, number];

const coke: Drink = ['brown', true, 40];
```

**CODE DECONSTRUCTION:** This code snippet is using type alias. By using the keyword `type`, we are able to create a new type that we can assign as type annotation.

1.  `type` is telling TS that we are creating a type.
2.  `Drink` is the name of the type. **Notice how it starts with a capital letter.**
3.  `=` tells TS that whatever goes after it is the type.
4.  `[string, boolean, number]` tells TS that `Drink` is a type of tuple with order of `string, boolean, number`.

---

## Why Tuples

Lets be hones, we won't be using tuples that much. They are **built for a specific use** and we **don't come into that situation often**.

There, however, are a couple exceptions. Like if you're working with a CSP file and any one represents say a single row, you might reach out to a tuple.

However, the biggest reason why we don't use tuples that often is because they don't illustrate what the values are and what they mean.

```ts
const planeSpecs: [number, number] = [250, 50];
```

If I showed you this line of code, we **have no idea what the `250` and `50` are**.

But if I showed you this:

```ts
const planeSpecs = {
  maxPassenger: 250,
  weight: 50,
};
```

With Objects, **we are forced to input a key for each property which gives us more context to what the numbers mean.** Now we know that `250` is the max capacity of passengers and `50` being the weight of the plane.
