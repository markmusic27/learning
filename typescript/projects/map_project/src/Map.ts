interface MapInputs {
  zoom: number;
  center: {
    lat: number;
    lng: number;
  };
  backgroundColor: string;
}

export interface MarkerInput {
  location: {
    lat: number;
    lng: number;
  };
  returnInfo(): string;
}

export class Map {
  private newMap: google.maps.Map;
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
    const marker = new google.maps.Marker({
      map: this.newMap,
      position: {
        lat: markerInput.location.lat,
        lng: markerInput.location.lng,
      },
    });

    marker.addListener('click', () => {
      const infoWindow = new google.maps.InfoWindow({
        content: markerInput.returnInfo(),
      });
      infoWindow.open(this.newMap, marker);
    });
  }
}
