
class Paymentget {
  String invoiceNumber;
  String merchant;
  String image;
  String amount;
  String discount;
  String tax;
  String commissions;
  String payableAmount;
  String createdTime;
  String expiryTime;

  Paymentget({
    required this.invoiceNumber,
    required this.merchant,
    required this.image,
    required this.amount,
    required this.discount,
    required this.tax,
    required this.commissions,
    required this.payableAmount,
    required this.createdTime,
    required this.expiryTime,
  });

  factory Paymentget.fromJson(Map<String, dynamic> json) {
    return Paymentget(
      invoiceNumber: json['invoice_number'] as String,
      merchant: json['merchant'] as String,
      image: json['image'] as String,
      amount: json['amount'] as String,
      discount: json['discount'] as String,
      tax: json['tax'] as String,
      commissions: json['commissions'] as String,
      payableAmount: json['payable_amount'] as String,
      createdTime: json['created_time'] as String,
      expiryTime: json['expiry_time'] as String,
    );
  }
}
