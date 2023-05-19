import 'package:flutter/material.dart';

import '../widgets/popular_carousel_widget.dart';
import '../widgets/recent_list_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Text('NASA Image and Video Library',
                    style: Theme.of(context).textTheme.titleLarge),
              ),
              const PopularCarouselWidget(),
              const RecentListWidget()
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(
          // backgroundColor: Theme.of(context).colorScheme.primary,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            NavigationDestination(
              label: 'downloads',
              icon: Icon(Icons.file_download),
            ),
          ]),
    );
  }
}
