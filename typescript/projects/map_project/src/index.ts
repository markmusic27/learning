import { User } from './User';
import { Company } from './Company';
import { Map } from './Map';

const map = new Map(
  {
    zoom: 2,
    center: {
      lat: 1,
      lng: 47,
    },
    backgroundColor: '#48A9A6',
  },
  'map'
);

const user = new User();
const company = new Company();
map.addMarker(user);
map.addMarker(company);
