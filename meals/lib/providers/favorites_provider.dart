import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';


class FavoriteMealsNotifier extends StateNotifier<List<Meal>>{
  FavoriteMealsNotifier() : super([]);

  bool toggleMealFavoriteStatus(Meal meal){
    final mealIsFavorite = state.contains(meal);

    if(mealIsFavorite){
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    }else{
      //con el operador ... se saca los elementos de la lista state para meterlos en na nueva lista juanto con el meal que es el nuevo plato fav
      state = [...state, meal];
      return true;
    }
  }

}

//Esta optimiza datos que pueden cambiar
final favoriteMealsProvider = StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref){
  return FavoriteMealsNotifier();
});