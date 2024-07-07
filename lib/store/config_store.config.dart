// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_new_architectua/bloc/common/common_bloc.dart' as _i5;
import 'package:flutter_new_architectua/bloc/count/count_bloc.dart' as _i6;
import 'package:flutter_new_architectua/bloc/todo_list/todo_list_bloc.dart'
    as _i7;
import 'package:flutter_new_architectua/navigation/app_navigator.dart' as _i3;
import 'package:flutter_new_architectua/navigation/app_router.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.AppNavigator>(() => const _i3.AppNavigator());
    gh.lazySingleton<_i4.AppRouter>(() => _i4.AppRouter());
    gh.factory<_i5.CommonBloc>(() => _i5.CommonBloc());
    gh.factory<_i6.CountBloc>(() => _i6.CountBloc());
    gh.factory<_i7.TodoListBloc>(() => _i7.TodoListBloc());
    return this;
  }
}
