
abstract class BlocEvent<T>{
  late final T data;
  void input(T data){
    this.data=data;
  }
}



class DataRequested<T> extends BlocEvent {
  DataRequested({required T data}){
    input(data);
  }
}
