import faker from 'faker';
import { MarkerInput } from './Map';

export class Company implements MarkerInput {
  name: string;
  catchPhrase: string;

  location: {
    lat: number;
    lng: number;
  };

  constructor() {
    this.name = faker.company.companyName();
    this.catchPhrase = faker.company.catchPhrase();

    this.location = {
      lat: Number(faker.address.latitude()),
      lng: Number(faker.address.longitude()),
    };
  }

  returnInfo() {
    return `
    <div>
    <h1>${this.name}.</h1>
    <h3>${this.catchPhrase}</h3>
    </div>
    `;
  }
}
