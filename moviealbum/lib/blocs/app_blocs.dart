import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttrdemo/blocs/app_events.dart';
import 'package:fluttrdemo/blocs/app_states.dart';
import 'package:fluttrdemo/repository/user_repository.dart';

class UserBloc extends Bloc<UserEvent,UserState>{
  UserRepository _userRepository;
  UserBloc(this._userRepository):super(UserLoadingState()){
    on<UserLoadEvent>((event, emit)async {
      emit(UserLoadingState());
      try {
        final users = await _userRepository.getUsers();
        emit(UserLoadedState(users));
      } catch (e) {
        emit(UserErrorState(e.toString()));
      }
    });
  }
}