import 'package:flutter/material.dart';

import '../widgets/search_form_widget.dart';
import '../widgets/search_result_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Text('Search Images and Videos',
                style: Theme.of(context).textTheme.titleLarge),
          ),
          const SearchFormWidget(),
          const Expanded(child: SearchResultWidget())
        ],
      ),
    );
  }
}
