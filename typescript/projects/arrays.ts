const database = {
  mark: {
    age: 15,
    fav_color: 'blue',
    sex: 'male',
  },
  filippo: {
    age: 14,
    fav_color: 'green',
    sex: 'male',
  },
  dani: {
    age: 12,
    fav_color: 'yellow',
    sex: 'female',
  },
};

const {
  dani: { age },
}: { dani: { age: number } } = database;

console.log(age);
