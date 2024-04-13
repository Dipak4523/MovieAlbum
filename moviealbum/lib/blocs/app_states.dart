
import 'package:equatable/equatable.dart';
import 'package:fluttrdemo/model/UserModel.dart';

abstract class UserState extends Equatable{}

class UserLoadingState extends UserState{

  @override
  List<Object?> get props => [];

}

class UserLoadedState extends UserState{

  final List<UserModel> userModelList;
  UserLoadedState(this.userModelList);

  @override
  List<Object?> get props => [userModelList];

}

class UserErrorState extends UserState {
  final String error;
  UserErrorState(this.error);
  @override
  List<Object?> get props => [error];
}


