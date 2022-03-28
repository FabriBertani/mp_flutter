import 'package:mp_flutter/mp_flutter.dart';

class MercadoPago {
  final MercadoCredentials mercadoCredentials;

  late final String? accessToken;

  late final Services services;

  MercadoPago(this.mercadoCredentials) {
    accessToken = mercadoCredentials.accessToken ?? "";
    
    services = Services(accessToken: accessToken);
  }
}