import './forecast.dart' as forecast;

Future<void> main() async {
  // testing with Bend, OR coordinates

  // double lat = 44.05;
  // double lon = -121.31;
  // TODO: Seach for latitutes and longitudes of 5 cities in the US on the internet
  // Create a for loop that will generate forecasts arrays for each city
  // TODO: create forecasts and forecastsHourly both of type List<forecast.Forecast>
List<List<double>> coords =  [
[44.05,-121.31],
[36.778261,-119.417932],
[39.550051,-105.782067],
[41.603221,-73.087749],
[38.905985,-77.033418]

];

  for (List<double> coord in coords){
  List<forecast.Forecast> forecasts = await forecast.getForecastFromPoints(coord[0], coord[1]);
  List<forecast.Forecast> forecastsHourly = await forecast.getForecastHourlyFromPoints(coord[0],coord[1]);
  }
}