import 'package:clinik_app/core/class/statusRequest.dart';

handilingData(response) {
  if (response is Statusrequest) {
    return response;
  } else {
    return Statusrequest.success;
  }
}
