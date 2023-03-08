import 'package:flutter/material.dart';
import 'types/label_display_type.dart';
import 'views/desktop_view.dart';
import 'views/mobile_view.dart';
import 'views/tablet_view.dart';
import 'package:stacked/stacked.dart';
import 'types/shell_view_model.dart';
import 'types/navigation_element.dart';
import 'package:responsive_builder/responsive_builder.dart';

class FlutterAdaptiveNavigationScaffold extends StatelessWidget {
  /// Required. The list of destinations for the navigation in the app. Should have atleast 1 element.
  final List<NavigationElement> destinations;

  /// Optional. Determines which labels to display on Tablets and Mobile screens.
  /// Ignored on desktops. Defaults to showing only the selected labels.
  final LabelDisplayType labelDisplayType;

  /// Optional. Defines the widget to be used as the appBar.
  final PreferredSizeWidget? appBar;

  /// Optional. Determines the width of the drawer in terms of percentage of the viewport width. Default: 20%.
  /// Should be expressed as a fraction (between 0 and 1)
  final double drawerWidthFraction;
  const FlutterAdaptiveNavigationScaffold({
    super.key,
    required this.destinations,
    this.appBar,
    this.drawerWidthFraction = 0.2,
    this.labelDisplayType = LabelDisplayType.selected,
  })  : assert(0 < drawerWidthFraction && drawerWidthFraction < 1),
        assert(destinations.length > 1);

  ShellViewModel get shellViewModel => ShellViewModel(
        navigationElements: destinations,
      );

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ShellViewModel>.reactive(
      viewModelBuilder: () => shellViewModel,
      onViewModelReady: (viewModel) {
        viewModel.labelDisplayType = labelDisplayType;
      },
      builder: (context, viewModel, child) {
        return ScreenTypeLayout.builder(
          mobile: (ctx) => MobileView(
            viewModel: viewModel,
            appBar: appBar,
          ),
          tablet: (ctx) => TabletView(
            viewModel: viewModel,
            appBar: appBar,
          ),
          desktop: (ctx) => DesktopView(
            viewModel: viewModel,
            appBar: appBar,
            drawerWidthFraction: drawerWidthFraction,
          ),
        );
      },
    );
  }
}
