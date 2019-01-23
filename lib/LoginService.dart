import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

class LoginState {
  final bool isLoading;
  final bool isLoginButtonEnabled;
  final String error;
  final String token;
  const LoginState({
    @required this.isLoading,
    @required this.isLoginButtonEnabled,
    @required this.error,
    @required this.token,
  });

  factory LoginState.initial() {
    return LoginState(
      isLoading: false,
      isLoginButtonEnabled: true,
      error: '',
      token: '',
    );
  }

  factory LoginState.loading() {
    return LoginState(
      isLoading: true,
      isLoginButtonEnabled: false,
      error: '',
      token: '',
    );
  }

  factory LoginState.failure(String error) {
    return LoginState(
      isLoading: false,
      isLoginButtonEnabled: true,
      error: error,
      token: '',
    );
  }

  factory LoginState.success(String token) {
    return LoginState(
      isLoading: false,
      isLoginButtonEnabled: true,
      error: '',
      token: token,
    );
  }
}


abstract class LoginEvent {}

class LoginButtonPressed extends LoginEvent {
  final String username;
  final String password;

  LoginButtonPressed({@required this.username, @required this.password});
}



class LoginBloc extends Bloc<LoginEvent, LoginState> {
LoginState get initialState => LoginState.initial();

void onLoginButtonPressed({String username, String password}) {
  dispatch(
    LoginButtonPressed(
      username: username,
      password: password,
    ),
  );
}



@override
Stream<LoginState> mapEventToState(LoginState currentState, LoginEvent event) async* {
  if (event is LoginButtonPressed) {
    yield LoginState.loading();

    try {
      final token = await _authenticate(event.username, event.password);
      yield LoginState.success(token);
    } catch (error) {
      yield LoginState.failure(error.toString());
    }
  }
}
}