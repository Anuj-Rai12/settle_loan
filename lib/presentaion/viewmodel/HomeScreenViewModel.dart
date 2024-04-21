import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loansettle/data/datastore/LoanSettleSharedPreference.dart';
import 'package:loansettle/utils/BlocEvent.dart';
import 'package:loansettle/utils/SealedState.dart';

import '../../data/repo/HomeScreenRepositroy.dart';

class HomeScreenViewModel extends Bloc<BlocEvent, SealedState> {
  final _repo = HomeScreenRepositroy();
  final _sharedPref = LoanSettleSharedPreference();

  HomeScreenViewModel() : super(SealedState.initial()) {
    on<DataRequested>((event, emit) async {
      emit(SealedState.loading(data: "Loading info..."));
      try {
        var response = await _repo.getHomeScreen(_sharedPref.getClientID());
        emit(SealedState.success(success: response));
      } catch (e) {
        emit(SealedState.error(e.toString(), null));
      }
    });
  }
}
