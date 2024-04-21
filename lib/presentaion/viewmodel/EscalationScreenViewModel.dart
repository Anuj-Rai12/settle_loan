import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loansettle/data/repo/EscalationRepository.dart';
import '../../utils/BlocEvent.dart';
import '../../utils/SealedState.dart';

class EscalationScreenViewModel extends Bloc<BlocEvent, SealedState> {
  final _repo = EscalationRepository();

  EscalationScreenViewModel() : super(SealedState.initial()) {
    on<DataRequested>((event, emit) async {
      emit(SealedState.loading(data: "Loading info..."));
      try{
        var response= await _repo.getEscalationRequest();
        emit(SealedState.success(success: response));
      }catch(e){
        emit(SealedState.error(e.toString(), null));
      }
    });
  }
}
