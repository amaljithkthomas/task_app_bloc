import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'switch_state.dart';

class SwitchCubit extends Cubit<SwitchState> {
  SwitchCubit() : super(const SwitchInitial(switchState: false));

  void switchOn() {
    emit(const SwitchInitial(switchState: true));
  }

  void switchOff() {
    emit(const SwitchInitial(switchState: false));
  }
}
