# 🐝 Useful Notes

## What is this?

Throughout my journey as a TypeScript developer, I have come across **some useful tips, practices and code** that I will probably need to look back on at some point.

---

## Satisfying Interfaces with Classes

You got a interface that you want to be **satisfied by a class**?

**_Just use the `implements` keyword. Like this:_**

```ts
interface Drink {
  flavor: string;
  caffeine: boolean;
  nutritiousValue(): string;
}

class Fanta implements Drink {
    flavor: "orange",
    caffeine: false,
    nutritiousValue() {
        return `
            Flavor: ${this.flavor}
            Caffeine: ${this.caffeine}
        `
    }
}
```

---

## Creating a `tsconfig.json` file

This config file basically tells the **TS compiler what and what not to do**. What you would do is run the following command in the terminal.

```
tsc --init
```

---

## Compiler Hot Reload

**Are you tired of having to run `ts-node index.ts`?** Just make the compiler **hot reload when you save** by running the following command in the terminal.

```
tsc -w ./___
```

---

## Create `package.json` file

All you have to do is run the following command:

```
npm init -y
```

---

## Automate The Building Process

Whenever you're working with Node, **you can automate the whole building process.** All you have to do is follow the next three steps:

1.  Make sure that you have a `package.json` file. If not, run `npm init -y` in your terminal.
2.  Install **nodemon** and **concurrently** by running `npm install nodemon concurrently`
3.  In the `package.json` file, add the following lines of code:

```json
"scripts": {
    "start:build": "tsc -w",
    "start:run": "nodemon build/index.js",
    "start": "concurrently npm:start:*"
  },
```

---

## Typed Or Operator

When using the or `|` operator in TS, TS will automatically check which properties and methods both types have in common. TS will only permit us use of the common properties and methods. Beyond that, TS will only let us use the

---

## Type Guard

A **type guard** is essentially checking the type of anything in TS.

```ts
const arrayOfNumbers = [1, 2, 3, 4, 5, 6]

if (arrayOfNumbers instanceOf Array){
  return "true"
} else {
  return "false"
}
```

**CODE DECONSTRUCTION:** You use the `instanceOf` to check the type of anything in TS. IN this code snippet, **we're simply checking if `arrayOfNumbers` has an instance of `Array`.**

**NOTE:** If you are checking if the type is of type `number`, `string`, or `boolean`, **use keyword `typeOf` instead of `instanceOf`.**
