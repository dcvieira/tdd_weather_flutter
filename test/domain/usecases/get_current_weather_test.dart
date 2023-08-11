import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:tdd_weather_app/domain/entities/weather.dart';
import 'package:tdd_weather_app/domain/usecases/get_current_weather.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetCurrentWeatherUseCase useCase;
  late MockWeatherRepository mockWeatherRepository;

  const testeWeatherDetail = WeatherEntity(
    cityName: 'New York',
    main: 'Clouds',
    description: 'scattered clouds',
    iconCode: '03d',
    temperature: 280.32,
    pressure: 1012,
    humidity: 81,
  );

  const testCityName = 'New York';

  setUp(() {
    mockWeatherRepository = MockWeatherRepository();
    useCase = GetCurrentWeatherUseCase(mockWeatherRepository);
  });

  test('should get current weather detail from the repository', () async {
    // arrange
    when(mockWeatherRepository.getCurrentWeather(testCityName))
        .thenAnswer((_) async => const Right(testeWeatherDetail));

    // act
    final result = await useCase.execute(testCityName);

    // assert
    expect(result, const Right(testeWeatherDetail));
  });
}
