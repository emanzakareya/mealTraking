
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meal_traking/models/meals_model.dart';
import 'package:meal_traking/presentation/controller/meal_cubit.dart';

import '../components/custom_button.dart';
import '../components/text_form_field.dart';


class AddMealScreen extends StatefulWidget {
  const AddMealScreen({super.key});

  @override
  _AddMealScreenState createState() => _AddMealScreenState();
}

class _AddMealScreenState extends State<AddMealScreen> {

  DateTime selectedTime = DateTime.now();
  File? _image;

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Meal')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextFormField(
              labelText: 'Meal Name',
              controller:  context.read<MealCubit>().nameController,
              keyboardType: TextInputType.text,),

            CustomTextFormField(
              labelText: 'Calories',
              controller:  context.read<MealCubit>().caloriesController,
              keyboardType: TextInputType.number,),

            const SizedBox(height: 20),
            CustomButton(
              onPressed: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: selectedTime,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );
                if (picked != null && picked != selectedTime) {
                  setState(() {
                    selectedTime = picked;
                  });
                }
              },
              text: 'Pick Date: ${selectedTime.toLocal()}',
            ),
            const SizedBox(height: 10),
            _image == null
                ? const Text('No image selected')
                : Image.file(_image!, width: 100, height: 100, fit: BoxFit.cover),
            CustomButton(
              onPressed: _pickImage,
             text:'Pick Image',
            ),
            const SizedBox(height: 20),
            CustomButton(
              onPressed: () {
                final String name =  context.read<MealCubit>().nameController.text;
                final int calories = int.tryParse( context.read<MealCubit>().caloriesController.text) ?? 0;
                if (name.isNotEmpty && calories > 0 && _image != null) {
                  final meal = Meal(name: name, calories: calories, time: selectedTime, photo: _image!.path);
                  context.read<MealCubit>().addMeal(meal);
                  context.read<MealCubit>().saveMeals();
                  Navigator.pop(context);
                }
              }, text: 'Add Meal',

            ),

          ],
        ),
      ),
    );
  }
}