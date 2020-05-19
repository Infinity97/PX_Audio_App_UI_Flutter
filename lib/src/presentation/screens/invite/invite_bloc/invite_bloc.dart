import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_ecommerce_youtube/src/data/repository/users_repository.dart';
import 'bloc.dart';

class InviteBloc extends Bloc<InviteEvent, InviteState> {
  final UsersRepository usersRepository;

  InviteBloc({@required this.usersRepository});

  @override
  InviteState get initialState => InitialInviteState();

  @override
  Stream<InviteState> mapEventToState(
    InviteEvent event,
  ) async* {
    yield LoadingInviteState();
    if (event is GetReferralCode) {
      try {
        final String referralCode =
            await usersRepository.fetchReferralCode(event.userId);
        yield LoadedInviteState(referralCode: referralCode);
      } catch (Exception) {
        yield ErrorInviteState(
            message: "An Exception occured for user ID ${event.userId}");
      }
    }
  }
}
