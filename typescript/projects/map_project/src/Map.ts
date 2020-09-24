export const map = new google.maps.Map(document.getElementById('map'), {
  zoom: 8,
  center: {
    lat: -34.397,
    lng: 150.644,
  },
  backgroundColor: '#48A9A6',
});

interface MapInputs {
  zoom: number;
  center: {
    lat: number;
    lng: number;
  };
  backgroundColor: string;
}

interface MarkerInput {
  location: {
    lat: number;
    lng: number;
  };
}

export class Map {
  newMap: google.maps.Map;
  constructor(mapInputs: MapInputs, divId: string) {
    this.newMap = new google.maps.Map(document.getElementById(divId), {
      zoom: mapInputs.zoom,
      center: {
        lat: mapInputs.center.lat,
        lng: mapInputs.center.lng,
      },
      backgroundColor: mapInputs.backgroundColor,
    });
  }
  addMarker(markerInput: MarkerInput) {
    new google.maps.Marker({
      map: this.newMap,
      position: {
        lat: markerInput.location.lat,
        lng: markerInput.location.lng,
      },
    });
  }
}
