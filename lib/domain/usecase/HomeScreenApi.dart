
import 'package:loansettle/domain/model/home/HomeScreenResponse.dart';

abstract class HomeScreenApi {

  Future<List<HomeScreenResponse>> getHomeScreen(int clientId);


}
