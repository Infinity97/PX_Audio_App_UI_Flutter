import 'package:equatable/equatable.dart';

abstract class InviteEvent extends Equatable {
  const InviteEvent();
}

class GetReferralCode extends InviteEvent{
  final String userId;
  GetReferralCode({this.userId});

  @override
  List<Object> get props => [userId];
}