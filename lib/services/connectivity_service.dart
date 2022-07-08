import 'dart:io';

class ConnectivityService{

  Future<bool> checkInternetAvailability() async {
    bool? internetAvailable;
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        internetAvailable = true;
      }
    } on SocketException catch (_) {
      internetAvailable = false;
    }

    return internetAvailable!;
  }
}