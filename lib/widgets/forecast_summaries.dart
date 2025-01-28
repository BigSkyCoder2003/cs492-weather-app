import 'package:flutter/material.dart';
import 'package:weatherapp/scripts/forecast.dart' as forecast;
import 'package:weatherapp/widgets/forecast_summary_widget.dart';

class ForecastSummaries extends StatelessWidget {
  const ForecastSummaries({
    super.key,
    required List<forecast.Forecast> forecasts,
  }) : _forecasts = forecasts;

  final List<forecast.Forecast> _forecasts;

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [];
    for(var i = 0; i<_forecasts.length; i++){
    list.add(ForecastSummaryWidget(currentForecast: _forecasts[i]));
    }
    
      return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: list),
    );
      
  }
}
