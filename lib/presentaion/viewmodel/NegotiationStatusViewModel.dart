import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loansettle/data/repo/NegotiationStatusRepository.dart';
import 'package:loansettle/utils/BlocEvent.dart';
import 'package:loansettle/utils/FilesUtils.dart';
import 'package:loansettle/utils/SealedState.dart';

import '../../data/datastore/LoanSettleSharedPreference.dart';

class NegotiationStatusViewModel extends Bloc<BlocEvent, SealedState> {
  final _repo = NegotiationStatusRepository();
  final _sharedPref = LoanSettleSharedPreference();

  NegotiationStatusViewModel() : super(SealedState.initial()) {
    on<DataRequested>((event, emit) async {
      emit(SealedState.loading(data: "Loading Data"));
      try {
        var response =
            await _repo.getNegotiationStatus(_sharedPref.getClientID());
        debugLogs("Response $response");
        emit(SealedState.success(success: response));
      } catch (e) {
        emit(SealedState.error(e.toString(), null));
      }
    });
  }
}
