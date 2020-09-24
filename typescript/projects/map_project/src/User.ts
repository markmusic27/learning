import faker from 'faker';
import { MarkerInput } from './Map';

export class User implements MarkerInput {
  name: string;
  lastName: string;

  location: {
    lat: number;
    lng: number;
  };

  constructor() {
    this.name = faker.name.firstName();
    this.lastName = faker.name.lastName();
    this.location = {
      lat: Number(faker.address.latitude()),
      lng: Number(faker.address.longitude()),
    };
  }

  returnInfo() {
    return `
    <div>
    <h1>
    Business Owner: ${this.name} ${this.lastName}
    </h1>
    </div>
    `;
  }
}
