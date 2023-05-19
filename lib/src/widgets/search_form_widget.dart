import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_app/src/widgets/year_range_slider_widget.dart';

import '../blocs/search/search_bloc.dart';

class SearchFormWidget extends StatefulWidget {
  const SearchFormWidget({
    super.key,
  });

  @override
  State<SearchFormWidget> createState() => _SearchFormWidgetState();
}

class _SearchFormWidgetState extends State<SearchFormWidget> {
  final debouncer = Debouncer(
    duration: const Duration(milliseconds: 500),
  );

  @override
  void initState() {
    BlocProvider.of<SearchBloc>(context).add(const SearchInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              TextFormField(
                onChanged: _onSearchChanged,
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              // Check box de imagen y video
              Row(
                children: [
                  Checkbox(
                    value: state.showImages,
                    onChanged: (value) => BlocProvider.of<SearchBloc>(context)
                        .add(const ToogleImagesEvent()),
                  ),
                  const Text('Images'),
                  Checkbox(
                    value: state.showVideos,
                    onChanged: (value) => BlocProvider.of<SearchBloc>(context)
                        .add(const ToogleVideosEvent()),
                  ),
                  const Text('Videos'),
                ],
              ),
              // Slider para selecionar el rango de años desde 1920 hasta el año actual
              // permitiendo seleccionar un rango de años e indicando el rango seleccionado
              // en un texto
              const YearRangeSlider()
            ],
          ),
        );
      },
    );
  }

  void _onSearchChanged(String value) {
    debouncer.value = '';
    debouncer.onValue = (value) async {
      BlocProvider.of<SearchBloc>(context).add(ChangeQueryEvent(query: value));
    };

    final timer = Timer.periodic(debouncer.duration, (_) {
      debouncer.value = value;
    });

    Future.delayed(debouncer.duration).then((_) => timer.cancel());
  }
}

/// Nos ayuda a realizar la busqueda solo cuando el
/// usuario ha dejado de escribir en el buscador
class Debouncer<T> {
  Debouncer({required this.duration, this.onValue});

  final Duration duration;

  void Function(T value)? onValue;

  T? _value;
  Timer? _timer;

  T get value => _value!;

  set value(T val) {
    _value = val;
    _timer?.cancel();
    _timer = Timer(duration, () => onValue!(_value!));
  }
}
