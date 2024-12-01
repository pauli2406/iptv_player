import 'package:flutter/cupertino.dart' hide OverlayVisibilityMode;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iptv_player/home/widgets/grid_layout_windows_widget.dart';
import 'package:iptv_player/service/collections/item_category.dart';

class GridLayoutWidget extends StatelessWidget {
  final String title;
  final AsyncValue<List> channelProvider;
  final AsyncValue<List<ItemCategory>> categories;
  final String placeHolderForSearchField;
  final double height;
  final double width;
  final TextEditingController searchController;
  final Widget Function(BuildContext, double, dynamic) itemBuilder;

  final String errorText;
  final Function(ItemCategory?) onCategoryChanged;

  final bool showBackButton;

  const GridLayoutWidget({
    super.key,
    required this.title,
    required this.channelProvider,
    required this.categories,
    required this.placeHolderForSearchField,
    required this.height,
    required this.width,
    required this.errorText,
    required this.onCategoryChanged,
    required this.searchController,
    required this.itemBuilder,
    this.showBackButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return GridLayoutWindowsWidget(
      title: title,
      channelProvider: channelProvider,
      categories: categories,
      placeHolderForSearchField: placeHolderForSearchField,
      height: height,
      width: width,
      searchController: searchController,
      itemBuilder: itemBuilder,
      errorText: errorText,
      onCategoryChanged: onCategoryChanged,
    );
  }
}
