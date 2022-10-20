import 'package:bloc/bloc.dart';
import 'package:insignia_flutter/cubits/app_cubit_states.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits() : super(InitialState()) {
    emit(SelectState());
  }
}
