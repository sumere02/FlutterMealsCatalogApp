import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:meals/providers/meals_provider.dart";

enum Filter{
  glutenFree,
  lactoseFree,
  vegetarian,
}

class FiltersNotifier extends StateNotifier<Map<Filter,bool>>{
  FiltersNotifier(): super({
    Filter.glutenFree: false,
    Filter.lactoseFree: false,
    Filter.vegetarian: false,
  });
  void setFilter(Filter filter,bool isActive){
    state = {
      ...state,
      filter: isActive,
    };
  }

  void setFilters(Map<Filter,bool> chosenFilters){
    state = chosenFilters;
  }
}

final filtersProvider = StateNotifierProvider<FiltersNotifier,Map<Filter,bool>>((ref) {
  return FiltersNotifier();
});

final filteredMealsProvider = Provider((ref) {
  final dummyMeals = ref.watch(mealsProvider);
  final activeFilters = ref.watch(filtersProvider);
  return dummyMeals.where(
      (meal) {
        if (activeFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
          return false;
        }
        if (activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
          return false;
        }
        if (activeFilters[Filter.vegetarian]! && !meal.isVegetarian) {
          return false;
        }
        return true;
      },
    ).toList();
});