import 'package:geocoding/geocoding.dart' as geocoding;

// TODO: Create a new class called Location DONE
// This class should store the values of our location: DONE
// city, state, zip, latitude, longitude DONE
// use appropriate data types as well as appropriate null safing for city state zip DONE
// you do not need to create a factory, but you do need the basic contstructor DONE
// use the forecast class as a template to help you DONE

class Location{
 String? city;
 String? state;
 String? zip;
 double? lat;
 double? long;

Location(
    this.city,
    this.state,
    this.zip,
    this.lat,
    this.long,
  );

}


// TODO: set the type of this function to Future<Location?> DONE
// create a Location object from the lat, lon, city, state, and zip DONE
// return the Location if it's found, null if it's not found DONE

Future<Location?> getLocationFromAddress(String rawCity, String rawState, String rawZip) async {
  String address = '$rawCity $rawState $rawZip';
  try{ 
    List<geocoding.Location> locations = await geocoding.locationFromAddress(address);
    double lat = locations[0].latitude;
    double lon = locations[0].longitude;
    List<geocoding.Placemark> placemarks = await geocoding.placemarkFromCoordinates(lat, lon);
    String? state = placemarks[0].administrativeArea;
    String? city = placemarks[0].locality;
    String? zip = placemarks[0].postalCode;
    Location location = Location(city,state,zip,lat,lon);
    print(location);
    return location;
  } on geocoding.NoResultFoundException {
    return null;
  }
}