import 'package:flutter/material.dart';
import 'package:daily_coding/theme/fonts.dart';

class BottomSelector extends StatelessWidget {
  final List<dynamic> options;
  final String title;
  final Widget Function(dynamic) optionTitle;
  final dynamic curState;
  final dynamic onSelected;

  BottomSelector(
      {this.options,
      this.title,
      this.optionTitle,
      this.curState,
      this.onSelected});

  Widget renderChangeHeader(String title) => ListTile(
        title: Text(title, style: MyFonts.largeText),
      );

  renderOption(
          BuildContext context, optionTitle, dynamic curState, onSelected) =>
      (dynamic option) {
        bool selected = option == curState;
        return ListTile(
          contentPadding: const EdgeInsets.all(0.0),
          title: optionTitle(option),
          selected: selected,
          onTap: selected
              ? null
              : () {
                  onSelected?.call(option);
                  Navigator.of(context).pop();
                },
        );
      };

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: ListTile.divideTiles(
        context: context,
        tiles: [renderChangeHeader(title)]..addAll(options
            .map(renderOption(context, optionTitle, curState, onSelected))),
      ).toList(),
    );
  }
}
