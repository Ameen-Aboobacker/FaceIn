import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'face_scanning_event.dart';
part 'face_scanning_state.dart';

class FaceScanningBloc extends Bloc<FaceScanningEvent, FaceScanningState> {
  FaceScanningBloc() : super(ScanningInitial()) {
    on<FaceScanningEvent>((event, emit) {});
  }
}
