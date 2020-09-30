# 📌 Everything API

## Promises

**Think of promises as a literal promise**. For example, "_I promise to make good docs_". If I succeed at this, I will be **resolving** my promise. Else, I will be **rejecting** my promise.

```ts
let promise = new Promise((resolve, reject) => {
  let docsQuality = true;

  if (docsQuality == true) {
    resolve('Success');
  } else {
    reject('Failed');
  }
});

promise
  .then((message) => {
    console.log(`This is in the then ${message}`);
  })
  .catch((message)) => {
    console.log(`This is in the catch ${message}`)
  };
```

---

## Fetch API

The fetch API is a tool that's **built into the browser** (JS, TS) to **make asynchronous requests** to different network resources using **methods like `GET`, `POST`, `PUT`, etc.**

```ts
fetch('https://apiurl.com');
```

Fetch **has two arguments**; the **first is the URL of the API**. The **second is optional** but is where you can **define what method** you want to use like `POST` or `GET`.

Since **fetch works with `promises`**, you can use **async and await or .then and .catch.**

```ts
fetch('https://apiurl.com');
    .then((res) => console.log(res))
```

The `.then()` **will return a promise which has a property of `body`** which is where all of our data lyes. That, however, **returns another promise that we have to turn into JSON.**

```ts
fetch("https://apiurl.com");
    .then((res) => res.json())
    .then((body) => console.log(data))
```

However, this is **only half of what you can do with fetch**. You can **set the other parameter** and give the fetch property more info like the method.

```ts
fetch('https://apiurl.com'{
    method: "POST", //Here is where you can also use PUT or GET
})
  .then((res) => res.json())
  .then((body) => console.log(body));
```

As you can see, we are **inputting an object with a property of `method`**.

We can also go beyond that and input things like `headers` and `body`.

```ts
fetch('https://apiurl.com'{
    method: "POST", //Here is where you can also use PUT or GET
    headers: {
        "content-types": "application/json"
    },
    body: JSON.stringify({
        name: "User 1"
    })
})
  .then((res) => res.json())
  .then((body) => console.log(body));
```

**NOTE:**

- Make sure that you include the `headers` property if you're using the `body` property.
- Use `JSON.stringify()` when adding properties to the body.

```ts
fetch('url', {
  method: 'POST',
  header: {
    'content-types': 'application/json',
  },
  body: {
    name: 'User1',
  },
})
  .then((res) => body.json())
  .then((body) => console.log(body));
```
