import '../log_state.dart';

extension ToString on LogState {
  String get stringDefinition {
    switch (this) {
      case LogState.successfulSignIn:
        return 'successfulSignIn';
    }
  }

  String get messageDefinition {
    switch (this) {
      case LogState.successfulSignIn:
        return 'Successful sign in';
    }
  }
}
