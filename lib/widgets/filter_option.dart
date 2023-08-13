import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/filters_provider.dart';

class FilterItem extends ConsumerWidget {
  const FilterItem(
      {required this.itemFilterSet,
      required this.title,
      required this.subtitle,
      required this.itemFilter,
      super.key});
  final bool itemFilterSet;
  final String title;
  final String subtitle;
  final Filter itemFilter;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return SwitchListTile(
      value: itemFilterSet,
      onChanged: (isChecked) {
        ref.read(filtersProvider.notifier).setFilter(itemFilter, isChecked);
      },
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context)
            .textTheme
            .labelMedium!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(
        left: 34,
        right: 22,
      ),
    );
  }
}


