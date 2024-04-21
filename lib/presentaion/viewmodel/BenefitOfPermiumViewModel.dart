import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loansettle/data/repo/BenfitOfPremoumRepository.dart';
import 'package:loansettle/utils/BlocEvent.dart';
import 'package:loansettle/utils/SealedState.dart';

class BenefitOfPermiumViewModel extends Bloc<BlocEvent, SealedState> {
  BenefitOfPermiumViewModel() : super(SealedState.initial()) {
    final _repo = BenfitOfPremoumRepository();

    on<DataRequested>((event, emit) async {
      emit(SealedState.loading(data: "Loading info..."));
      try {
        var response = await _repo.getPremium();
        emit(SealedState.success(success: response));
      } catch (e) {
        emit(SealedState.error(e.toString(), null));
      }
    });
  }

}
