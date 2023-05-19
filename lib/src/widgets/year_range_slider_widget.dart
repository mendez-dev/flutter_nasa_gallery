import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/search/search_bloc.dart';

class YearRangeSlider extends StatefulWidget {
  const YearRangeSlider({Key? key}) : super(key: key);

  @override
  YearRangeSliderState createState() => YearRangeSliderState();
}

class YearRangeSliderState extends State<YearRangeSlider> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${state.initialYear} - ${state.finalYear}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                const Text('1920'),
                Expanded(
                  child: RangeSlider(
                    min: 1920,
                    max: DateTime.now().year.toDouble(),
                    divisions: DateTime.now().year - 1920,
                    values: RangeValues(state.initialYear.toDouble(),
                        state.finalYear.toDouble()),
                        onChangeEnd: (value) {
                          BlocProvider.of<SearchBloc>(context).add(
                            ChangeDataRangeEvent(
                              search: true,
                              finalYear: value.end.toInt(),
                              initialYear: value.start.toInt(),
                            ),
                          );
                        },
                    onChanged: (RangeValues values) {
                      BlocProvider.of<SearchBloc>(context).add(
                          ChangeDataRangeEvent(
                              finalYear: values.end.toInt(),
                              initialYear: values.start.toInt()));
                    },
                  ),
                ),
                Text(DateTime.now().year.toString()),
              ],
            ),
          ],
        );
      },
    );
  }
}
