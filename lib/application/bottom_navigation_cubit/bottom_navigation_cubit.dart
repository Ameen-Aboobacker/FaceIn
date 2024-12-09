import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigationCubit extends Cubit<int> {
  BottomNavigationCubit() : super(1);
  void onChangeIndex(int value) {
    emit(value);
  }
}
