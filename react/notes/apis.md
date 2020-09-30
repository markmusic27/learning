# 💽 Fetching API Data in React

## What are we doing?

It is important to note that you **do not render anything before you fetch** your data. **You always fetch your data first.**

What we do is that we:

1.  Show some sort of **loading indicator**
2.  **Fetch the data.**
3.  Update and **show data that we get.**

---

## Where are we doing it?

So the best place to do this is **not in the render method** (return in functional) but in **another method called `componentDidMount`.**

```ts
const componentName = () => {
    componentDidMount() {
        //CODE HERE
    }

    return (
        //CODE HERE
    )
}
```

Before that, however, we **need to show the loading with state.**

```ts
const componentName = () => {
    state = {
        loading: true;

    }

    componentDidMount() {
        //CODE HERE
    }

    return (
        <div>
            {state.loading ? <div>loading...<div> : <div>person...<div>}
        <div>
    )
}
```

Now we can **fetch the data.**

```ts
const displayPerson = () => {
    state = {
        loading: false;
        person: null
    }

    async componentDidMount() {
        const url = "apiURL.com";
        const key = "apiKey";
        const response = await fetch(url)
        const data = response.json()
        setState({ person: data.person })
    }

    return (
        <div>
            {state.loading || !state. person ?
            <div>loading...<div> :
            <div>person...<div>
            }
        <div>
    )
}
```
