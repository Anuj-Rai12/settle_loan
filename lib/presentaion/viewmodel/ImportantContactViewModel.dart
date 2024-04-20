import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loansettle/utils/BlocEvent.dart';
import 'package:loansettle/utils/SealedState.dart';
import '../../data/repo/ImportantContactsRepository.dart';

class ImportantContactViewModel extends Bloc<BlocEvent, SealedState> {
  final _repo = ImportantContactsRepository();

  ImportantContactViewModel() : super(SealedState.initial()) {

    on<DataRequested>((event, emit) async {
      try {
        var response = await _repo.importantContact();
        emit(SealedState.success(success: response));
      } catch (e) {
        emit(SealedState.error(e.toString(), null));
      }
    });
  }
}
