import 'package:flutter/material.dart';
import '../../flutter_adaptive_navigation.dart';
import '../types/shell_view_model.dart';

class DesktopView extends StatelessWidget {
  final ShellViewModel viewModel;
  final PreferredSizeWidget? appBar;
  final double drawerWidthFraction;
  final Color? backgroundColor;
  const DesktopView({
    super.key,
    required this.viewModel,
    this.appBar,
    required this.drawerWidthFraction,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final fullWidth = MediaQuery.of(context).size.width;
    final width = fullWidth * drawerWidthFraction;
    return Scaffold(
      appBar: appBar,
      body: Row(
        children: [
          _buildDrawer(width),
          _buildDivider(),
          _buildMainContents(context),
        ],
      ),
    );
  }

  VerticalDivider _buildDivider() {
    return const VerticalDivider(
      thickness: 1,
      width: 2,
    );
  }

  Widget _buildMainContents(BuildContext context) {
    return Expanded(
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: viewModel.getSelectedDestination(Breakpoint.desktop),
      ),
    );
  }

  Widget _buildDrawer(double width) {
    return Container(
      width: width,
      color: backgroundColor,
      child: _buildListView(),
    );
  }

  ListView _buildListView() {
    return ListView.builder(
      itemBuilder: (ctx, index) {
        final navigationElement = viewModel.navigationElements[index];
        final isSelected =
            navigationElement == viewModel.selectedNavigationElement;
        return _buildListTile(
          navigationElement,
          index,
          isSelected,
        );
      },
      itemCount: viewModel.navigationElements.length,
    );
  }

  ListTile _buildListTile(
    NavigationElement navigationElement,
    int index,
    bool isSelected,
  ) {
    return ListTile(
      leading: isSelected && navigationElement.selectedIcon != null
          ? navigationElement.selectedIcon!
          : navigationElement.icon,
      title: Text(navigationElement.label),
      selected: isSelected,
      onTap: () => viewModel.selectedDestination = index,
    );
  }
}
