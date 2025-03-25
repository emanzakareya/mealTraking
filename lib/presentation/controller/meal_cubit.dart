import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_traking/models/meals_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';


class MealCubit extends Cubit<List<Meal>> {
  MealCubit() : super([]);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController caloriesController = TextEditingController();

  void addMeal(Meal meal) {
    emit([...state, meal]);
  }



  void deleteMeal(int index) async {
    final updatedMeals = List<Meal>.from(state)..removeAt(index);
    final prefs = await SharedPreferences.getInstance();
    List<String> mealList = updatedMeals.map((meal) => jsonEncode(meal.toJson())).toList();
    await prefs.setStringList('meals', mealList); // Update saved meals
    emit(updatedMeals);
  }



  Future<void> saveMeals() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> mealList = state.map((meal) => jsonEncode(meal.toJson())).toList();
    await prefs.setStringList('meals', mealList);
  }

  Future<void> loadMeals() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? mealList = prefs.getStringList('meals');
    if (mealList != null) {
      emit(mealList.map((meal) => Meal.fromJson(jsonDecode(meal))).toList());
    }
  }

  int calculateTotalCalories() {
    return state.fold(0, (sum, meal) => sum + meal.calories);
  }
}