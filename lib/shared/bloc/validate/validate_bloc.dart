import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'validate_event.dart';
part 'validate_state.dart';

class ValidateBloc extends Bloc<ValidateEvent, ValidateState> {
  ValidateBloc() : super(ValidateInitial()) {
    on<ValidateEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
