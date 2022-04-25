import 'package:hooks_riverpod/hooks_riverpod.dart';

class _TurnsProvider extends StateNotifier<double> {
  _TurnsProvider() : super(0);

  void increment(double value) => state += value;

  void decrement(double value) => state -= value;
}

final turnsRef =
    StateNotifierProvider<_TurnsProvider, double>((_) => _TurnsProvider());
