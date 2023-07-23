import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class InternetConnectionBloc extends BlocBase {
  InternetConnectionBloc(){
    _settingInternetConnection();
  }

  late bool isConnect;

  void _settingInternetConnection() async{
    final connectivityResult = await (Connectivity().checkConnectivity());
    _checkInternetConnection(connectivityResult);
    Connectivity().onConnectivityChanged.listen((event) => _checkInternetConnection(event));
  }

  void _checkInternetConnection(ConnectivityResult connectivityResult){
    if (connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.mobile) {
      isConnect =  true;
    } else {
      isConnect = false;
    }
  }
}
