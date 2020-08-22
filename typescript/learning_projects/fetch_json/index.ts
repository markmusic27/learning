import axios from 'axios';

const url = 'https://jsonplaceholder.typicode.com/todos/1';

interface Todo {
  id: number;
  title: string;
  completed: boolean;
}

axios.get(url).then((response) => {
  const todo = response.data as Todo;
  showToDo(todo.id, todo.title, todo.completed);
});

const showToDo = (id: number, title: string, completed: boolean) => {
  console.log(`
  The To-Do with ID: ${id},
  Has a title of: ${title},
  Is it completed? ${completed}
  `);
};
