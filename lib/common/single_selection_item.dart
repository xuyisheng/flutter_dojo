import 'package:flutter/material.dart';

class SingleSelectionItem<T> extends StatelessWidget {
  final SelectionValue<T> selectionValue;
  final SelectionValue<T> selectionGroupValue;
  final ValueChanged<SelectionValue<T>> onChange;

  SingleSelectionItem(this.selectionValue, this.selectionGroupValue, this.onChange);

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      value: selectionValue,
      groupValue: selectionGroupValue,
      onChanged: onChange,
      title: Text(selectionValue.title),
      subtitle: Text(selectionValue.label),
    );
  }
}

/// 单选Item的选项
class SelectionValue<T> {
  final T value;
  final String title;
  final String label;

  const SelectionValue(this.value, this.title, this.label);
}
