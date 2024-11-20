// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_new_architectua/core/bloc/auth/auth_bloc.dart' as _i4;
import 'package:flutter_new_architectua/core/bloc/count/count_bloc.dart' as _i5;
import 'package:flutter_new_architectua/core/bloc/goods/goods_bloc.dart' as _i6;
import 'package:flutter_new_architectua/core/bloc/products/products_bloc.dart'
    as _i7;
import 'package:flutter_new_architectua/core/bloc/profile/profile_bloc.dart'
    as _i8;
import 'package:flutter_new_architectua/core/bloc/todo_list/todo_list_bloc.dart'
    as _i9;
import 'package:flutter_new_architectua/core/navigation/app_navigator.dart'
    as _i10;
import 'package:flutter_new_architectua/core/navigation/app_router.dart' as _i3;
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
    gh.lazySingleton<_i3.AppRouter>(() => _i3.AppRouter());
    gh.factory<_i4.AuthBloc>(() => _i4.AuthBloc());
    gh.factory<_i5.CountBloc>(() => _i5.CountBloc());
    gh.factory<_i6.GoodsBloc>(() => _i6.GoodsBloc());
    gh.factory<_i7.ProductsBloc>(() => _i7.ProductsBloc());
    gh.factory<_i8.ProfileBloc>(() => _i8.ProfileBloc());
    gh.factory<_i9.TodoListBloc>(() => _i9.TodoListBloc());
    gh.lazySingleton<_i10.AppNavigator>(
        () => _i10.AppNavigator(gh<_i3.AppRouter>()));
    return this;
  }
}
