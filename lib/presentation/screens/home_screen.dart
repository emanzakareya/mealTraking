import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_traking/models/meals_model.dart';
import 'package:meal_traking/presentation/controller/meal_cubit.dart';
import 'package:meal_traking/presentation/screens/add_meal_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _sortBy = 'name';
  @override
  void initState() {
    super.initState();
    context.read<MealCubit>().loadMeals(); // Ensure meals are loaded when HomeScreen initializes
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meal Tracker'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (String value) {
              setState(() {
                _sortBy = value;
              });
            },
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem(value: 'name', child: Text('Sort by Name')),
              const PopupMenuItem(value: 'calories', child: Text('Sort by Calories')),
              const PopupMenuItem(value: 'time', child: Text('Sort by Time')),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Text('Total Calories: ${context.watch<MealCubit>().calculateTotalCalories()} kcal',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Expanded(
            child: BlocBuilder<MealCubit, List<Meal>>(
              builder: (context, meals) {
                List<Meal> sortedMeals = List.from(meals);
                if (_sortBy == 'name') {
                  sortedMeals.sort((a, b) => a.name.compareTo(b.name));
                } else if (_sortBy == 'calories') {
                  sortedMeals.sort((a, b) => a.calories.compareTo(b.calories));
                } else if (_sortBy == 'time') {
                  sortedMeals.sort((a, b) => a.time.compareTo(b.time));
                }
                return ListView.builder(
                  itemCount: sortedMeals.length,
                  itemBuilder: (context, index) {
                    final meal = sortedMeals[index];
                    return  ListTile(
                         leading: SizedBox(
                           width: 50, // Set an appropriate width
                           height: 50,
                           child: Image.file(File(meal.photo), fit: BoxFit.cover),
                         ),
                         title: Text(meal.name),
                         subtitle: Text('${meal.calories} kcal | ${meal.time.copyWith(minute: meal.time.minute)}'),
                     trailing: IconButton(
                         icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => context.read<MealCubit>().deleteMeal(index),                     ),
                      );
                  },
                );
              },
            ),
          ),

        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddMealScreen()),
          ).then((_) {
            setState(() {}); // Refresh when returning
          }),
        child: Icon(Icons.add,size: 40,color: Colors.deepPurple,),
      ),
    );
  }
}
