import 'dart:async';
import 'package:bloc/bloc.dart';
import 'bloc.dart';

class DashboardBlocBloc extends Bloc<DashboardBlocEvent, DashboardBlocState> {
  @override
  DashboardBlocState get initialState => InitialDashboardBlocState();

  @override
  Stream<DashboardBlocState> mapEventToState(
    DashboardBlocEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
