import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_state.dart';

import '../../models/weather_model.dart';
import '../../services/weather_service.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherService) : super(WeatherLoading());

  WeatherService weatherService;
  WeatherModel? weatherModel;

  Future<void> getWeather({required String cityName}) async {
    emit(WeatherLoading());
    try {
      weatherModel = await weatherService.getWeather(cityName: cityName);
      if (weatherModel != null) {
        emit(WeatherSuccess(weatherModel));
      } else {
        emit(WeatherFailure());
      }
    } catch (e) {
      emit(WeatherFailure());
    }
  }
}
