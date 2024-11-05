import 'package:clublab_lite/app/service/logger/logger_service.dart';
import 'package:control/control.dart';

final class StateControllerObserver implements IControllerObserver {
  @override
  void onCreate(Controller controller) {
    LoggerService().i('${controller.runtimeType} created');
  }

  @override
  void onStateChanged<S extends Object>(
      StateController<S> controller, S prevState, S nextState) {
    LoggerService()
        .i('${controller.runtimeType} has change: $prevState -> $nextState');
  }

  @override
  void onError(Controller controller, Object error, StackTrace stackTrace) {
    LoggerService().e(
        message: '${controller.runtimeType} has error:',
        error: error,
        stackTrace: stackTrace);
  }

  @override
  void onDispose(Controller controller) {
    LoggerService().i('${controller.runtimeType} closed');
  }

  @override
  void onHandler(HandlerContext context) {
    // LoggerService().i('${controller.runtimeType} onHandle');
  }
}
