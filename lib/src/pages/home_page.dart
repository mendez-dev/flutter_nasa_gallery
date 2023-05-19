import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_app/src/pages/search_page.dart';
import 'package:nasa_app/src/repositories/data_repository/data_repository.dart';

import '../blocs/home/home_bloc.dart';
import '../notifications/notification_handler.dart';
import '../utils/logger.dart';
import '../widgets/navigation_bar_widget.dart';
import '../widgets/popular_carousel_widget.dart';
import '../widgets/recent_list_widget.dart';
import 'downloaded_images_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Timer.periodic(const Duration(minutes: 5), (timer) {
      logger.i('Mostrar notificación');
      showBigPictureNotification(
          dataRepository: RepositoryProvider.of<DataRepository>(context));
    });

    RepositoryProvider.of<DataRepository>(context).donloadRandomImages();

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          body: [
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      child: Text('NASA Image and Video Library',
                          style: Theme.of(context).textTheme.titleLarge),
                    ),
                    const PopularCarouselWidget(),
                    const RecentListWidget()
                  ],
                ),
              ),
            ),
            const SearchPage(),
            const DownloadedImagesPage(),
          ][state.index],
          bottomNavigationBar: const NavigationBarWidget(),
        );
      },
    );
  }
}
