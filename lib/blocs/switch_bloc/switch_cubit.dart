
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

part 'switch_state.dart';

class SwitchCubit extends HydratedCubit<SwitchState> {

    @override
  fromJson(Map<String, dynamic> json) {
  return SwitchState.fromMap(json);
  }
  
  @override
  Map<String, dynamic>? toJson(state) {
   return state.toMap();
  }
  SwitchCubit() : super(const SwitchInitial(switchState: false));

  void switchOn() {
    emit(const SwitchInitial(switchState: true));
  }

  void switchOff() {
    emit(const SwitchInitial(switchState: false));
  }
  

}
