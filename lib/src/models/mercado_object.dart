class MercadoObject {
  bool isSuccessful;
  dynamic data;
  String? errorCode;

  MercadoObject({required this.isSuccessful, this.data, this.errorCode});

  @override
  String toString() =>
    'isSuccessful=$isSuccessful, data=$data, errorCode=$errorCode';
}