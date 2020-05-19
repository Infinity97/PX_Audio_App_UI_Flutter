import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_ecommerce_youtube/src/presentation/screens/invite/invite_bloc/bloc.dart';

abstract class InviteState extends Equatable {
  const InviteState();
}

class InitialInviteState extends InviteState {
  @override
  List<Object> get props => [];
}

class LoadingInviteState extends InviteState {
  @override
  List<Object> get props => [];
}

class LoadedInviteState extends InviteState {
  final String referralCode;
  LoadedInviteState({@required this.referralCode});
  @override
  List<Object> get props => [referralCode];
}

class ErrorInviteState extends InviteState {
  final String message;
  ErrorInviteState({this.message});
  @override
  List<Object> get props => [message];
}
