class Drink {
  constructor(public sugar: number, public flavor: string) {
    console.log(
      `This drink has a sugar content of ${sugar} and has a flavor of ${flavor}.`
    );
  }
}

class Soda extends Drink {
  constructor(sugar: number, flavor: string) {
    super(sugar, flavor);
  }
}

const fanta = new Soda(10, `orange`);
