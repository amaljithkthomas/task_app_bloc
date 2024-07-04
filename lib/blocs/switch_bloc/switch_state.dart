part of 'switch_cubit.dart';

@immutable
class SwitchState extends Equatable {
  final bool switchState;

  const SwitchState({
    required this.switchState,
  });

  @override
  List<Object?> get props => [switchState];
}

final class SwitchInitial extends SwitchState {
  const SwitchInitial({required super.switchState});
}
