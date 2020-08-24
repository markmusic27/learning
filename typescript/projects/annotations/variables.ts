// Commons
const apples: number = 5;
const names: string = 'Mark Music';
const truth: boolean = true;

// Built in objects
let now: Date = new Date();

// Arrays

const nbaTeams: string[] = ['Rockets', 'Sixers', 'Lakers'];
const coolNums: number[] = [1, 2, 3, 4, 5];

// Class

class Person {}

let person1: Person = new Person();
let person2: Person = new Person();

//Object Literall

let myObj: { user1: string; user2: string } = {
  user1: 'filippo',
  user2: 'mark',
};

//Functions

let squared: (num: number) => void = (num: number) => {
  console.log(num * num);
};
