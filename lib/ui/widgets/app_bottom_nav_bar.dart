import 'package:flutter/material.dart';
import 'package:scheduled_health/utils/extensions/theme_extension.dart';

const bottomNavBarHeight = 65.0;

final class AppBottomNavBarItem {
  final String label;
  final IconData? icon;

  AppBottomNavBarItem({required this.label, required this.icon});
}

final class AppBottomNavBar extends StatefulWidget {
  final List<AppBottomNavBarItem> navItems;

  final ValueChanged<int>? onTap;

  final int? currentIndex;

  const AppBottomNavBar({
    super.key,
    required this.navItems,
    this.onTap,
    this.currentIndex,
  });

  @override
  State<AppBottomNavBar> createState() => _AppBottomNavBarState();
}

class _AppBottomNavBarState extends State<AppBottomNavBar> {
  static const _onClickDuration = Duration(milliseconds: 150);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8.0),
          topRight: Radius.circular(8.0),
        ),
        child: Container(
          height: bottomNavBarHeight + MediaQuery.paddingOf(context).bottom,
          decoration: BoxDecoration(
            color: context.colors.white,
            border: Border(
              top: BorderSide(
                color: context.colors.white,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List<Widget>.generate(
              widget.navItems.length,
              (index) {
                final currentNavBar = widget.navItems[index];
                final isSelected = index == widget.currentIndex;
                final foregroundColor = isSelected
                    ? context.colors.greenSplash
                    : context.colors.gray700;

                return GestureDetector(
                  onTap: Feedback.wrapForTap(
                      () => widget.onTap?.call(index), context),
                  behavior: HitTestBehavior.translucent,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      minWidth: kMinInteractiveDimension,
                      minHeight: kMinInteractiveDimension,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedSwitcher(
                          duration: _onClickDuration,
                          reverseDuration: _onClickDuration,
                          switchInCurve: Curves.easeIn,
                          switchOutCurve: Curves.easeOut,
                          child: Icon(
                            currentNavBar.icon,
                            color: foregroundColor,
                          ),
                        ),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            currentNavBar.label,
                            style: context.typography.input.copyWith(
                              color: foregroundColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
