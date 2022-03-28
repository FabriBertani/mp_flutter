[![Pub Version](https://img.shields.io/pub/v/mp_flutter)](https://pub.dev/packages/mp_flutter)
[![GitHub](https://img.shields.io/github/license/FabriBertani/mp_flutter)](https://github.com/FabriBertani/mp_flutter/blob/main/LICENSE)

# MercadoPago Flutter

A Flutter package that mix the best of [mercadopago_transparent](https://pub.dev/packages/mercadopago_transparent) and [mercado_pago](https://pub.dev/packages/mercado_pago) packages.

**Note**: this is a work in progress project.

For detailed docs about MercadoPago, please visit [MercadoPago Developers Guides](https://www.mercadopago.com/developers/en/guides).

## v0.1.0
Currently includes:

* Document identification types available on MercadoPago.
* New card token generation.
* Card token generation for an already saved card.

### Usage
Initialize the package by generating a new `MercadoPago` instance:
   
```dart
import 'package:mp_flutter/mp_flutter.dart';

MercadoCredentials mercadoCredentials = MercadoCredentials(accessToken: 'ACESS_TOKEN');

final mercadoPago = MercadoPago(mercadoCredentials);
```

## Document Types
> To get a list of identification types available on MercadoPago

```dart
List<DocumentType>? documentTypes = <DocumentType>[];

await mercadoPago.services.documentTypes()
  .then((obj) {
    if (obj.isSuccessful) {
      documentTypes = (json.decode(obj.data) as List)
        .map((dt) => DocumentType.fromJson(dt))
        .toList();
    }
  });
```

## Generate new card token
> To generate a new card token use the `newCard` function.

**Note**: To get more details about payment types, id, etc, visit: [MercadoPago payment methods docs](https://www.mercadopago.com/developers/en/guides/resources/localization/payment-methods).

```dart
CardToken cardToken;

await mercadoPago.services.newCard(
  code: '123',
  year: '2025',
  month: 11,
  cardNumber: '4509953566233704',
  documentNumber: '12345678',
  documentType: 'DNI',
  fullName: 'APRO'
).then((obj) {
  if (obj.isSuccessful) {
    cardToken = CardToken.fromJson(obj.data);
  }
});
```

## Token with Card
> Generate a token from a card already saved

```dart
CardSavedToken cardSavedToken;

await mercadoPago.services.tokenWithCard(
  cardId: '1587964933876',
  securityCode: '333'
).then((obj) {
  if (obj.isSuccessful) {
    cardSavedToken = CardSavedToken.fromJson(obj.data);
  }
});
```

## Contributions
Please, feel free to open an [Issue](https://github.com/FabriBertani/mp_flutter/issues) if you found any bugs or submit a PR.

## License
`mp_flutter` is licensed under [MIT](https://github.com/FabriBertani/mp_flutter/blob/main/LICENSE).