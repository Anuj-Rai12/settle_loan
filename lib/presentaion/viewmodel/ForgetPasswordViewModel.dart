import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loansettle/data/repo/LoginRepository.dart';
import 'package:loansettle/utils/SealedState.dart';

import '../../utils/BlocEvent.dart';

class ForgetPasswordViewModel extends Bloc<BlocEvent, SealedState> {
  final _repo = LoginRepository();

  ForgetPasswordViewModel() : super(SealedState.initial()) {
    on<DataRequested>((event, emit) async {
      try {
        var response= await _repo.forgetPassword(event.data as String);
        emit(SealedState.success(success: response));
      } catch (e) {
        emit(SealedState.error(e.toString(), null));
      }
    });
  }
}
