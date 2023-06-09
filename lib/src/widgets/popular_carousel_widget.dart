import 'package:built_collection/built_collection.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/asset_model.dart';
import '../repositories/data_repository/data_repository.dart';
import 'carousel_card_widget.dart';

class PopularCarouselWidget extends StatefulWidget {
  const PopularCarouselWidget({Key? key}) : super(key: key);

  @override
  State<PopularCarouselWidget> createState() => _PopularCarouselWidgetState();
}

class _PopularCarouselWidgetState extends State<PopularCarouselWidget> {
  BuiltList<AssetModel> _assets = BuiltList<AssetModel>();
  bool isLoading = false;
  bool isError = false;

  @override
  void initState() {
    _getAssets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child:
                Text('Popular', style: Theme.of(context).textTheme.headline6),
          ),
          CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 1.2,
              enlargeCenterPage: false,
            ),
            items: List.generate(4, (index) {
              return const CarouselCardWidgetLoading();
            }),
          ),
        ],
      );
    }

    if (isError) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text('Popular', style: Theme.of(context).textTheme.headline6),
        ),
        CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 1.2,
            enlargeCenterPage: false,
          ),
          items: _assets.map((e) => CarouselCardWidget(asset: e)).toList(),
        ),
      ],
    );
  }

  Future<void> _getAssets() async {
    setState(() {
      isLoading = true;
    });

    final response =
        await RepositoryProvider.of<DataRepository>(context).getPopular();

    if (!mounted) {
      return; // Verificar si el widget está montado antes de continuar
    }

    setState(() {
      isLoading = false;
    });

    if (response.code == 200) {
      setState(() {
        _assets = response.data!.items;
      });
    } else {
      setState(() {
        isError = true;
      });
    }
  }
}
