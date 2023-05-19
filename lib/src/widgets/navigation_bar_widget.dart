import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/home/home_bloc.dart';

class NavigationBarWidget extends StatelessWidget {
  const NavigationBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (BuildContext context, HomeState state) {
        // TODO: implement listener
      },
      builder: (BuildContext context, HomeState state) {
        return NavigationBar(selectedIndex: state.index,
          onDestinationSelected: (int index) {
            context.read<HomeBloc>().add(NavigateToEvent(index: index));
          },
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
        ]);
      },
    );
  }
}
