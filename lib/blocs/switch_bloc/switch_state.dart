// ignore_for_file: public_member_api_docs, sort_constructors_first


part of 'switch_cubit.dart';

@immutable
class SwitchState extends Equatable {
  final bool switchState;

  const SwitchState({
    required this.switchState,
  });

  @override
  List<Object?> get props => [switchState];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'switchState': switchState,
    };
  }

  factory SwitchState.fromMap(Map<String, dynamic> map) {
    return SwitchState(
      switchState: map['switchState'] as bool,
    );
  }


}

final class SwitchInitial extends SwitchState {
  const SwitchInitial({required super.switchState});
}
