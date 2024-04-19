
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loansettle/data/datastore/LoanSettleSharedPreference.dart';
import 'package:loansettle/data/repo/LoginRepository.dart';
import 'package:loansettle/domain/model/login/LoginRequest.dart';
import 'package:loansettle/utils/BlocEvent.dart';
import '../../utils/FilesUtils.dart';
import '../../utils/SealedState.dart';

class LoginViewModel extends Bloc<BlocEvent, SealedState> {

  final _login = LoginRepository();

  LoginViewModel() : super(SealedState.initial()) {
    on<DataRequested>((event, emit) async {
      emit(SealedState.loading(data: "please wait check for the user"));
      //await Future<void>.delayed(const Duration(seconds: 4));
      try{
      var response= await _login.getLogin(event.data as LoginRequest);
      var sharePref=LoanSettleSharedPreference();

        if(response.data?.result ==0){
          sharePref.setUserIsLogin();
          emit(SealedState.error(response.data?.message, null));
        }else {
          sharePref.setUserIsLogin();
          emit(SealedState.success(success: response));
        }
      }catch(e){
        debugLogs("ERORR is $e");
        emit(SealedState.error(e.toString(), null));
      }
    });
  }
}
