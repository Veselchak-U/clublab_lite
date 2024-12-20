import 'dart:async';

import 'package:clublab_lite/features/initial/data/repository/user_repository.dart';
import 'package:control/control.dart';

part 'initial_controller_state.dart';

final class InitialController extends StateController<InitialControllerState> with SequentialControllerHandler {
  final UserRepository _userRepository;

  InitialController(
    this._userRepository, {
    super.initialState = const InitialController$Idle(),
  }) {
    _init();
  }

  void _init() {}

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> authChecking() {
    return handle(
      () async {
        setState(const InitialController$Loading());

        final token = await _userRepository.getAccessToken();
        if (token == null) {
          setState(const InitialController$Unauthorized());

          return;
        }

        setState(const InitialController$Success());
      },
      error: _errorHandler,
      done: _doneHandler,
    );
  }

  Future<void> _errorHandler(Object e, StackTrace st) async {
    setState(InitialController$Error(e, st));
  }

  Future<void> _doneHandler() async {
    setState(const InitialController$Idle());
  }
}
