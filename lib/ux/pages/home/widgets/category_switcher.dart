import 'package:algorithms_visualizer/ux/pages/home/widgets/category_widget.dart';
import 'package:algorithms_visualizer/ux/providers/pages_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategorySwitcher extends StatelessWidget {
  const CategorySwitcher({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PagesProvider>(
      builder: (_, homeProvider, child) {
        return AnimatedSwitcher(
          duration: const Duration(seconds: 1),
          transitionBuilder: (child, animation) {
            return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1, 0),
                  end: const Offset(0, 0),
                ).animate(
                  CurvedAnimation(parent: animation, curve: Curves.ease),
                ),
                child: child);
          },
          child: CategoryWidget(
            pages: homeProvider.pages,
            key: ValueKey<String>(homeProvider.categoryKey),
          ),
        );
      },
    );
  }
}