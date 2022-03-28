import 'package:mp_flutter/mp_flutter.dart';

class Services {
  final RestService _restService = RestService();
  final ApiResponse _apiResponse = ApiResponse();

  final String? accessToken;

  Services({required this.accessToken});

  /// This function gets a list of identification types available
  /// on MercadoPago
  Future<MercadoObject> documentTypes() async {
    final result = await _restService.get(
        path: '/v1/identification_types',
        accessToken: accessToken as String);
    
    return _apiResponse.response(result);
  }


  /// This function generates a new card token.
  /// 
  /// To get more details about payment types, id, etc, visit:
  /// https://www.mercadopago.com/developers/en/guides/resources/localization/payment-methods
  Future<MercadoObject> newCard({
    required String code,
    required String year,
    required int month,
    required String cardNumber,
    required String documentType,
    required String documentNumber,
    required String fullName
  }) async {
    final card = Card(
      securityCode: code,
      expirationYear: year,
      expirationMonth: month,
      cardNumber: cardNumber,
      cardHolder: CardHolder(
        identification: Identification(
          number: documentNumber,
          type: documentType
        ),
        name: fullName
      )
    );

    final result = await _restService.post(
      path: '/v1/card_tokens',
      data: card.toJson(),
      accessToken: accessToken as String);

    return _apiResponse.response(result);
  }

  /// This function generates a token from a card already saved,
  /// using the [cardId] id of the saved card and the
  /// [securityCode] card security code.
  Future<MercadoObject> tokenWithCard({
    required String cardId,
    required String securityCode
  }) async {
    final result = await _restService.post(
      path: '/v1/card_tokens',
      data: {'cardId': cardId, 'securityCode': securityCode},
      accessToken: accessToken as String);

    return _apiResponse.response(result);
  }
}