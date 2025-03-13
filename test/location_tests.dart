import 'package:test/test.dart';
import 'package:weatherapp/models/location.dart';

void main() {
  test('Creating a Location object using the normal constructor', testNormalConstructor);
  test('Creating a Location object from a json (fromJson function)', testFromJson);
  test('Getting json data from a Location object (toJson function)', testToJson);
  test('Comparing two locations for equality (equal example)', testEqualLocations);
  test('Comparing two locations for equality (unequal example)', testUnequalLocations);
}

void testNormalConstructor() {
  var location = Location(
    state: 'Oregon',
    city: 'Corvallis',
    zip: '97330',
    latitude: 44.5646,
    longitude: -123.2620,
  );

  expect(location.state, 'Oregon');
  expect(location.city, 'Corvallis');
  expect(location.zip, '97330');
  expect(location.latitude, 44.5646);
  expect(location.longitude, -123.2620);
}

void testFromJson() {
  var json = {
    "state": "Oregon",
    "city": "Corvallis",
    "zip": "97330",
    "latitude": 44.5646,
    "longitude": -123.2620,
    "url": null
  };

  var location = Location.fromJson(json);

  expect(location.state, 'Oregon');
  expect(location.city, 'Corvallis');
  expect(location.zip, '97330');
  expect(location.latitude, 44.5646);
  expect(location.longitude, -123.2620);
}

void testToJson() {
  var location = Location(
    state: 'Oregon',
    city: 'Corvallis',
    zip: '97330',
    latitude: 44.5646,
    longitude: -123.2620,
  );

  var json = location.toJson();

  expect(json['state'], 'Oregon');
  expect(json['city'], 'Corvallis');
  expect(json['zip'], '97330');
  expect(json['latitude'], 44.5646);
  expect(json['longitude'], -123.2620);
}

void testEqualLocations() {
  var location1 = Location(
    state: 'Oregon',
    city: 'Corvallis',
    zip: '97330',
    latitude: 44.5646,
    longitude: -123.2620,
  );

  var location2 = Location(
    state: 'Oregon',
    city: 'Corvallis',
    zip: '97330',
    latitude: 44.5646,
    longitude: -123.2620,
  );

  expect(location1 == location2, true);
}

void testUnequalLocations() {
  var location1 = Location(
    state: 'Oregon',
    city: 'Corvallis',
    zip: '97330',
    latitude: 44.5646,
    longitude: -123.2620,
  );

  var location2 = Location(
    state: 'California',
    city: 'Los Angeles',
    zip: '90001',
    latitude: 34.0522,
    longitude: -118.2437,
  );

  expect(location1 == location2, false);
}

