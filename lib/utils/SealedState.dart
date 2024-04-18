
import 'package:sealed_flutter_bloc/sealed_flutter_bloc.dart';
import 'ApiWrapperResponse.dart';

class SealedState<T,S> extends Union4Impl<Inital,Loading,Success,Error>{
  static const unions=Quartet<Inital,Loading,Success,Error>();

  SealedState._(Union4<Inital,Loading,Success,Error> union):super(union);

  factory SealedState.initial()=> SealedState._(unions.first(Inital()));

  factory SealedState.loading({required T data})=> SealedState._(unions.second(Loading(data)));

  factory SealedState.success({required S success})=> SealedState._(unions.third(Success(success)));

  factory SealedState.error(String? err,Exception? e)=> SealedState._(unions.fourth(Error(e,err)));

}