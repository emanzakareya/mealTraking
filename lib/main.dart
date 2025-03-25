import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_traking/presentation/controller/meal_cubit.dart';
import 'package:meal_traking/presentation/screens/home_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final MealCubit mealCubit = MealCubit();
  await mealCubit.loadMeals();
  runApp(MyApp(mealCubit: mealCubit));
}

class MyApp extends StatelessWidget {
  final MealCubit mealCubit;
  const MyApp({super.key,  required this.mealCubit});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => mealCubit,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Meal Tracker',
        theme: ThemeData(
          primarySwatch: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
