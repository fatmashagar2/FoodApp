abstract class AuthStates{}
class AuthInitialState extends AuthStates{}
class RegisterLoadingState extends AuthStates{}
class LoginLoadingState extends AuthStates{}
class RegisterSuccessState extends AuthStates{}
class LoginSuccessState extends AuthStates{}

class FailedState extends AuthStates{
  String message;
  FailedState({required this.message});
}
class LoginFailedState extends AuthStates{
  String message;
  LoginFailedState({required this.message});
}