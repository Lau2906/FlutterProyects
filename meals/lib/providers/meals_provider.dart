import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/data/dummy_data.dart';


//Asi se crea un provider básico de una lista que nunca cambia
final mealsProvider = Provider((ref) {
  return dummyMeals;
});