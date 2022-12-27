import 'package:flutter/material.dart';

import '../../flutter_adaptive_navigation.dart';
import '../types/shell_view_model.dart';

class TabletView extends StatelessWidget {
  final ShellViewModel viewModel;
  final PreferredSizeWidget? appBar;
  const TabletView({
    super.key,
    required this.viewModel,
    this.appBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Row(
        children: [
          _buildNavigationRail(),
          _buildDivider(),
          _buildMainContents(),
        ],
      ),
    );
  }

  Widget _buildMainContents() {
    return Expanded(
      child: viewModel.getSelectedDestination(Breakpoint.tablet),
    );
  }

  NavigationRail _buildNavigationRail() {
    return NavigationRail(
      destinations: viewModel.navigationElements
          .map(_prepareNavigationRailDestination)
          .toList(),
      selectedIndex: viewModel.selectedDestination,
      onDestinationSelected: (value) => viewModel.selectedDestination = value,
      labelType: _prepareLabelType(),
    );
  }

  VerticalDivider _buildDivider() {
    return const VerticalDivider(
      thickness: 1,
      width: 2,
    );
  }

  NavigationRailDestination _prepareNavigationRailDestination(
      NavigationElement e) {
    return NavigationRailDestination(
      icon: e.icon,
      selectedIcon: e.selectedIcon,
      label: Text(e.label),
    );
  }

  NavigationRailLabelType _prepareLabelType() {
    switch (viewModel.labelDisplayType) {
      case LabelDisplayType.all:
        return NavigationRailLabelType.all;
      case LabelDisplayType.selected:
        return NavigationRailLabelType.selected;
      case LabelDisplayType.none:
        return NavigationRailLabelType.none;
    }
  }
}
