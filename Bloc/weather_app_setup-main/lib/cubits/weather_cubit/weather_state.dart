import 'package:weather_app/models/weather_model.dart';

class WeatherState {}
class WeatherInitial extends WeatherState{}

class WeatherLoading extends WeatherState{}
class WeatherSuccess extends WeatherState{
  WeatherSuccess({required this.weatherModel});
  WeatherModel weatherModel;
}
class WeatherFailier extends WeatherState{}