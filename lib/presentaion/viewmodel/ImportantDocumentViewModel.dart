import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loansettle/data/repo/ImportantContactsRepository.dart';
import 'package:loansettle/data/repo/ImportantDocumentRepository.dart';
import 'package:loansettle/utils/BlocEvent.dart';
import 'package:loansettle/utils/SealedState.dart';

class ImportantDocumentViewModel extends Bloc<BlocEvent, SealedState> {
  ImportantDocumentViewModel() : super(SealedState.initial()) {
    final repo = ImportantDocumentRepository();

    on<DataRequested>((event, emit) async {
      emit(SealedState.loading(data: "Loading info..."));
      try {
        var response = await repo.getImpDoc();
        emit(SealedState.success(success: response));
      } catch (e) {
        emit(SealedState.error(e.toString(), null));
      }
    });
  }
}
