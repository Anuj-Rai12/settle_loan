import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loansettle/data/repo/ComplaintAgainstRecoveryAgentRepository.dart';
import 'package:loansettle/utils/BlocEvent.dart';
import 'package:loansettle/utils/SealedState.dart';

class ComplaintAgainstRecoveryAgentViewModel extends Bloc<BlocEvent, SealedState> {
  final _repo = ComplaintAgainstRecoveryAgentRepository();

  ComplaintAgainstRecoveryAgentViewModel() : super(SealedState.initial()) {
    on<DataRequested>((event, emit) async {
      emit(SealedState.loading(data: "Loading info..."));
      try{
        var response= await _repo.complaintAgainstApi();
        emit(SealedState.success(success: response));
      }catch(e){
        emit(SealedState.error(e.toString(), null));
      }
    });
  }
}
