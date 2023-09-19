import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practical/appCubit.dart';
import 'package:flutter_practical/cubitStates.dart';

class AppCubitsLogics extends StatefulWidget {
  const AppCubitsLogics({super.key});

  @override
  State<StatefulWidget> createState() => _AppCubitsLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitsLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
      if (state is WelcomeLoadedState) {
        return WelcomePage();
      }
    }));
  }
}
