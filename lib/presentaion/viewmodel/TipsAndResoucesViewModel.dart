import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loansettle/data/repo/TipsAndResourcesRepository.dart';
import 'package:loansettle/utils/BlocEvent.dart';
import 'package:loansettle/utils/SealedState.dart';

class TipsAndResourcesViewModel extends Bloc<BlocEvent, SealedState> {
  final _tipRepo = TipsAndResourcesRepository();

  TipsAndResourcesViewModel() : super(SealedState.initial()) {
    on<DataRequested>((event, emit) async {
      emit(SealedState.loading(data: "Please Wait Loading Tips"));
      try {
        var response = await _tipRepo.tipsAndResource();
        emit(SealedState.success(success: response));
      } catch (e) {
        emit(SealedState.error(e.toString(), null));
      }
    });
  }
}
