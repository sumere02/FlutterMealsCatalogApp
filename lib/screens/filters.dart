import 'package:flutter/material.dart';
import 'package:meals/widgets/filter_option.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/filters_provider.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Filters"),
      ),
      body: Column(
        children: [
          FilterItem(
            title: "Gluten-free",
            subtitle: "Only include gluten-free meals.",
            itemFilterSet: activeFilters[Filter.glutenFree]!,
            itemFilter: Filter.glutenFree,
          ),
          FilterItem(
            itemFilterSet: activeFilters[Filter.lactoseFree]!,
            itemFilter: Filter.lactoseFree,
            title: "Lactose-free",
            subtitle: "Only include Lactose-free meals.",
          ),
          FilterItem(
            itemFilterSet: activeFilters[Filter.vegetarian]!,
            itemFilter: Filter.vegetarian,
            title: "Vegetarian",
            subtitle: "Only include vegetarian meals.",
          ),
        ],
      ),
    );
  }
}
