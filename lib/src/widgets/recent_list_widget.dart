import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_app/src/models/asset_model.dart';
import 'package:nasa_app/src/models/collection_response.dart';
import 'package:nasa_app/src/widgets/recent_item_widget.dart';

import '../repositories/data_repository/data_repository.dart';

class RecentListWidget extends StatefulWidget {
  const RecentListWidget({super.key});

  @override
  State<RecentListWidget> createState() => _RecentListWidgetState();
}

class _RecentListWidgetState extends State<RecentListWidget> {
  BuiltList<AssetModel> _assets = BuiltList<AssetModel>();
  bool isLoading = false;

  @override
  void initState() {
    _getAssets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child:
                Text('Recent', style: Theme.of(context).textTheme.titleMedium)),
        if (isLoading) ...[
          const RecentItemWidgetLoading(),
          const RecentItemWidgetLoading(),
          const RecentItemWidgetLoading(),
          const RecentItemWidgetLoading(),
          const RecentItemWidgetLoading(),
        ] else ...[
          Column(
            children: _assets.map((e) => RecentItemWidget(asset: e,)).toList(),
          )
        ]
      ],
    );
  }

  Future<void> _getAssets() async {
    setState(() {
      isLoading = true;
    });
    CollectionResponse response =
        await RepositoryProvider.of<DataRepository>(context).getRecent();

    setState(() {
      isLoading = false;
    });

    if (response.code == 200) {
      setState(() {
        _assets = response.data!.items;
      });
    }
  }
}
