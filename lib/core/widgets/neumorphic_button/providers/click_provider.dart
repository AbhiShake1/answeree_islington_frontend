import 'package:hooks_riverpod/hooks_riverpod.dart';

class _ClickProvider extends StateNotifier<bool> {
  _ClickProvider() : super(false);

  void flip() => state = !state;
}

final isClickedRef =
    StateNotifierProvider<_ClickProvider, bool>((_) => _ClickProvider());
