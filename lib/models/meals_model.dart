// Meal model

class Meal {
  final String name;
  final int calories;
  final DateTime time;
  final String photo;

  Meal({
    required this.name,
    required this.calories,
    required this.time,
    required this.photo,
  });



  Map<String, dynamic> toJson() => {
    'name': name,
    'calories': calories,
    'time': time.toIso8601String(),
    'photo': photo,
  };

  static Meal fromJson(Map<String, dynamic> json) {
    return Meal(
      name: json['name'],
      calories: json['calories'],
      time: DateTime.parse(json['time']),
      photo: json['photo'],
    );
  }
}