import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_app/src/repositories/data_repository/data_repository.dart';
import 'package:nasa_app/src/repositories/data_repository/data_repository_impl.dart';
import 'package:nasa_app/src/repositories/network_repository/network_repository.dart';
import 'package:nasa_app/src/router/routes_handler.dart';
import 'package:nasa_app/src/styles/theme.dart';

import 'blocs/home/home_bloc.dart';
import 'blocs/search/search_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<NetworkRepository>(
              create: (BuildContext context) => NetworkRepository()),
          RepositoryProvider<DataRepository>(
              create: (BuildContext context) => DataRepositoryImpl(
                  networkRepository:
                      RepositoryProvider.of<NetworkRepository>(context)))
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (BuildContext context) => HomeBloc()),
            BlocProvider(
                create: (BuildContext context) => SearchBloc(
                    dataRepository:
                        RepositoryProvider.of<DataRepository>(context))),
          ],
          child: MaterialApp(
            theme: themeData,
            title: 'Material App',
            onGenerateRoute: RoutesHandler().router.generator,
            initialRoute: '/',
          ),
        ));
  }
}
