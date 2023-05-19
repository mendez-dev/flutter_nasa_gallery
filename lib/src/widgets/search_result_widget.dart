import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:nasa_app/src/widgets/recent_item_widget.dart';

import '../blocs/search/search_bloc.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Column(
              children: [
                RecentItemWidgetLoading(),
                RecentItemWidgetLoading(),
                RecentItemWidgetLoading(),
                RecentItemWidgetLoading(),
                RecentItemWidgetLoading(),
              ],
            );
          }

          if (state.isError) {

            return Column(
              children: [
                SizedBox(
                  child: Lottie.asset('assets/lotties/no-result.json'),
                )
              ],
            );
            
          }

          return Column(
            children: state.assets
                .map((e) => RecentItemWidget(
                      asset: e,
                    ))
                .toList(),
          );
        },
      ),
    );
  }
}
