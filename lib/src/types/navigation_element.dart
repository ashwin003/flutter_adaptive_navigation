import 'package:flutter/material.dart';

import 'breakpoint.dart';

/// An individual destination for app navigation
class NavigationElement extends NavigationDestination {
  /// Default body for the navigation element. Will be used for all breakpoints.
  final ValueGetter<Widget>? builder;

  /// Allows overriding the body for specific breakpoints.
  /// Need not be specified if all breakpoints require the same view.
  final Map<Breakpoint, ValueGetter<Widget>>? breakpointBasedBuilder;

  const NavigationElement({
    super.key,
    this.builder,
    this.breakpointBasedBuilder,
    required Widget icon,
    required String label,
    Widget? selectedIcon,
    String? tooltip,
  }) : super(
          icon: icon,
          label: label,
          selectedIcon: selectedIcon,
          tooltip: tooltip,
        );

  Widget getBody(Breakpoint breakpoint) {
    if (breakpointBasedBuilder?.containsKey(breakpoint) ?? false) {
      return breakpointBasedBuilder![breakpoint]!();
    }
    if (builder != null) {
      return builder!();
    }
    throw Exception(
      'Destination not defined for $label for the breakpoint ${breakpoint.name}',
    );
  }
}
