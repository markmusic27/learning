interface Logic {
  data: number[] | string;
  swap(): void;
  compare(): void;
  length: number;
}

export class Sorter {
  constructor(public collection: number[] | string) {}
  sort() {
    const { length } = this.collection;
    for (let i = 0; i < length; i++) {
      for (let j = 0; j < length - i - 1; j++) {}
    }
  }
}

// const leftHand = this.collection[i];
// this.collection[i] = this.collection[i + 1];
// this.collection[i + 1] = leftHand;
