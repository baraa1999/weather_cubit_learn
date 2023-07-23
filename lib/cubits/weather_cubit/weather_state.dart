import 'package:weather_app/models/weather_model.dart';

abstract class WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherSuccess extends WeatherState {
  WeatherSuccess(WeatherModel? weatherModel);
}

class WeatherFailure extends WeatherState {}
