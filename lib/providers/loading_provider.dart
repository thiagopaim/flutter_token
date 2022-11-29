import 'package:flutter/foundation.dart';

class LoadingProvider with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  void setLoadingStatus(status) {
    _loading = status;
    notifyListeners();
  }
}
