import 'package:flutter/material.dart';
import 'breakpoint.dart';
import 'label_display_type.dart';
import 'navigation_element.dart';

import 'base_view_model.dart';

class ShellViewModel extends BaseViewModel {
  final List<NavigationElement> navigationElements;

  ShellViewModel({
    required this.navigationElements,
  });

  int _selectedDestination = 0;
  int get selectedDestination => _selectedDestination;
  set selectedDestination(int value) {
    _selectedDestination = value;
    notifyListeners();
  }

  NavigationElement get selectedNavigationElement =>
      navigationElements[selectedDestination];

  LabelDisplayType _labelDisplayType = LabelDisplayType.selected;
  LabelDisplayType get labelDisplayType => _labelDisplayType;
  set labelDisplayType(LabelDisplayType value) {
    _labelDisplayType = value;
    notifyListeners();
  }

  Widget getSelectedDestination(Breakpoint breakpoint) {
    return navigationElements[selectedDestination].getBody(breakpoint);
  }

  bool get showSelectedLabel => [
        LabelDisplayType.all,
        LabelDisplayType.selected,
      ].contains(labelDisplayType);

  bool get showUnselectedLabels => [
        LabelDisplayType.all,
      ].contains(labelDisplayType);
}
