import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/configs/usecase.dart';
import '../../../data/models/result/data_state.dart';
import '../../models/weather/weather.dart';
import '../../repositories/weather_repository.dart';
import '../../service_providers.dart';

part 'weather_updates.dart';
part 'weather_usecases.g.dart';
