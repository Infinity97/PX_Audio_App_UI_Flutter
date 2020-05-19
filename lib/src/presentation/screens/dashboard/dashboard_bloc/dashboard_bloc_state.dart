import 'package:equatable/equatable.dart';

abstract class DashboardBlocState extends Equatable {
  const DashboardBlocState();
}

class InitialDashboardBlocState extends DashboardBlocState {
  @override
  List<Object> get props => [];
}
