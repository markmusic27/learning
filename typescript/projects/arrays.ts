interface Person {
  name: string;
  lastName: string;
  age: Date;
  summary(): string;
}

const markProperties = {
  name: 'Mark',
  lastName: 'Music',
  age: new Date(),
  summary() {
    return `Name: ${this.name} ${this.lastName}
Age: ${this.age}`;
  },
};

const printDetails = (mark: Person) => {
  console.log(mark.summary());
};

printDetails(markProperties);
