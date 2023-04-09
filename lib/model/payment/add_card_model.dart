class AddPaymentCardModel {
  final String id;
  final String object;
  final String brand;
  final String country;
  final String customer;
  final String cvcCheck;
  final int expMonth;
  final int expYear;
  final String fingerprint;
  final String funding;
  final String last4;

  AddPaymentCardModel({
    required this.id,
    required this.object,
    required this.brand,
    required this.country,
    required this.customer,
    required this.expMonth,
    required this.expYear,
    required this.fingerprint,
    required this.funding,
    required this.last4,
    required this.cvcCheck,
  });

  factory AddPaymentCardModel.fromJson(Map<String, dynamic> json) {
    return AddPaymentCardModel(
      id: json['data']['id'],
      object: json['data']['object'],
      brand: json['data']['brand'],
      country: json['data']['country'],
      customer: json['data']['customer'],
      expMonth: json['data']['exp_month'],
      expYear: json['data']['exp_year'],
      fingerprint: json['data']['fingerprint'],
      funding: json['data']['funding'],
      last4: json['data']['last4'],
      cvcCheck: json['data']['cvc_check'],
    );
  }
}
