import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:renbmi/app_state.dart';
import 'package:renbmi/reducers.dart';
import 'widgets/gender_selector.dart';
import 'widgets/height_slider.dart';
import 'widgets/weight_age_control.dart';
import 'widgets/customcard.dart'; // Import CustomCard
import 'package:renbmi/action.dart';
import 'package:renbmi/widgets/bmi_calculate.dart';

void main() {
  final store = Store<AppState>(appReducer, initialState: AppState());
  runApp(MyApp(store: store));
}


class MyApp extends StatelessWidget {
  final Store<AppState> store;

  MyApp({required this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: Text(
              'BMI Calculator',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.black,
          ),
          body: StoreConnector<AppState, AppState>(
            converter: (store) => store.state,
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GenderSelector(
                    isMale: state.isMale,
                    onToggle: () => StoreProvider.of<AppState>(context).dispatch(ToggleGender()),
                  ),
                  SizedBox(height: 20),
                  CustomCard(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: HeightSlider(
                      height: state.height,
                      onHeightChanged: (height) => StoreProvider.of<AppState>(context).dispatch(SetHeight(height)),
                      textStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: CustomCard(
                          child: WeightAgeControl(
                            label: 'Weight',
                            value: state.weight,
                            onIncrement: () => StoreProvider.of<AppState>(context).dispatch(SetWeight(state.weight + 1)),
                            onDecrement: () => StoreProvider.of<AppState>(context).dispatch(SetWeight(state.weight - 1)),
                            textStyle: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Expanded(
                        child: CustomCard(
                          child: WeightAgeControl(
                            label: 'Age',
                            value: state.age,
                            onIncrement: () => StoreProvider.of<AppState>(context).dispatch(SetAge(state.age + 1)),
                            onDecrement: () => StoreProvider.of<AppState>(context).dispatch(SetAge(state.age - 1)),
                            textStyle: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFF0066),
                    ),
                    onPressed: () {
                      double heightInMeters = state.height / 100;
                      double weight = state.weight.toDouble();

                      // Create BMICalculator instance
                      BMICalculator bmiCalculator = BMICalculator(height: heightInMeters, weight: weight);

                      double bmi = bmiCalculator.calculateBMI();
                      String bmiCategory = bmiCalculator.getBMICategory();

                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(
                              'BMI Result',
                              style: TextStyle(color: Colors.black),
                            ),
                            content: Text(
                              'Gender: ${state.isMale ? 'Men' : 'Women'}\n'
                              'Height: ${state.height}cm\n'
                              'Weight: ${state.weight}kg\n'
                              'Age: ${state.age}\n'
                              'Your BMI is ${bmi.toStringAsFixed(2)}\n'
                              'Category: $bmiCategory',
                              style: TextStyle(color: Colors.black),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: Text(
                                  'Done',
                                  style: TextStyle(color: Color(0xFFFF0066)),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text('Calculate', style: TextStyle(color: Colors.white)),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}