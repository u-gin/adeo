import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:testproject/services/connectivity_service.dart';

class ConnectivityProvider extends ChangeNotifier{

  ConnectivityService get service => GetIt.I<ConnectivityService>();

  late bool internetConnected = false;

  ConnectivityProvider(){
    checkConnection();
  }

  checkConnection () async{
    internetConnected = await service.checkInternetAvailability();
    notifyListeners();
  }
}