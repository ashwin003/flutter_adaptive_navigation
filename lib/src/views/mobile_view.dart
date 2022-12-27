import 'package:flutter/material.dart';

import '../../flutter_adaptive_navigation.dart';
import '../types/shell_view_model.dart';

class MobileView extends StatelessWidget {
  final ShellViewModel viewModel;
  final PreferredSizeWidget? appBar;
  const MobileView({
    super.key,
    required this.viewModel,
    this.appBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: viewModel.getSelectedDestination(Breakpoint.mobile),
      bottomNavigationBar: _prepareBottomNavigationBar(context),
    );
  }

  BottomNavigationBar _prepareBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: viewModel.selectedDestination,
      onTap: (value) => viewModel.selectedDestination = value,
      showSelectedLabels: viewModel.showSelectedLabel,
      showUnselectedLabels: viewModel.showUnselectedLabels,
      selectedItemColor: Theme.of(context).colorScheme.primary,
      unselectedItemColor: Theme.of(context).textTheme.bodyMedium?.color,
      items: viewModel.navigationElements
          .map(_prepareBottomNavigationBarItem)
          .toList(),
    );
  }

  BottomNavigationBarItem _prepareBottomNavigationBarItem(NavigationElement e) {
    return BottomNavigationBarItem(
      icon: e.icon,
      label: e.label,
      activeIcon: e.selectedIcon,
      tooltip: e.tooltip,
    );
  }
}
