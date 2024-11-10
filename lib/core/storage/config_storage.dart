import 'package:flutter_new_architectua/core/storage/config_storage.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final GetIt getIt = GetIt.instance;

@injectableInit
void configureInjection() => getIt.init();
