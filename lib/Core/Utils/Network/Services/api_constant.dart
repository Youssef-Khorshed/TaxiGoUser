class Constants {
  static const String baseUrl = 'https://go-taxi.codecraft1.com/api/';
  static const String walletDeposit = 'deposit';
  static const String walleTransactions = 'transactions';
  static const String walleGetProfileData = 'profile';


  static String depositURL({
    required String amount,
  }) =>
      '$baseUrl$walletDeposit?amount=$amount';

  static String transactionsURL({
    String? transactionType,
    String? paymentMethod,
  }) {
    String url = '$baseUrl$walleTransactions';
    if (transactionType != null && transactionType.isNotEmpty) {
      url += '?transaction_type=$transactionType';
    }
    if (paymentMethod != null && paymentMethod.isNotEmpty) {
      url +=
          '${transactionType != null && transactionType.isNotEmpty ? '&' : '?'}payment_method=$paymentMethod';
    }
    return url;
  }
  static String getProfileURL() => '$baseUrl$walleGetProfileData';
}
