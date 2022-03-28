import 'package:mp_flutter/mp_flutter.dart';

class ApiResponse {
  MercadoObject response(dynamic response) => _response(response);

  MercadoObject _response(dynamic response) {
    if (response != null) {
      return MercadoObject(
        isSuccessful: true,
        data: response
      );
    } else {
      return MercadoObject(
        isSuccessful: false
      );
    }
  }
}