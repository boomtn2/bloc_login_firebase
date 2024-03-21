part of 'app_bloc.dart';

sealed class AppEvent {}

class AppLogoutRequested extends AppEvent {}

class _AppUserChanged extends AppEvent {
  final User user;

  _AppUserChanged(this.user);
}
