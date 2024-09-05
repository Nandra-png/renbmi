class AppState {
  final int height;
  final int weight;
  final int age;
  final bool isMale;


  AppState({this.height = 180, this.weight = 76, this.age = 17, this.isMale = true});


  AppState copyWith({int? height, int? weight, int? age, bool? isMale}) {
    return AppState(
      height: height ?? this.height,
      weight: weight ?? this.weight,
      age: age ?? this.age,
      isMale: isMale ?? this.isMale,
    );
  }
}
