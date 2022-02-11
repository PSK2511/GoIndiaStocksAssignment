import 'package:get/get_utils/src/extensions/string_extensions.dart';
import 'package:intl/intl.dart';

class Strings {
  Strings._privateConstructor();

  static const appName = 'Sample App';
  static const empty = '';
  static const mobileNumber = 'Mobile Number';
  static const getOTP = 'Get OTP';
  static const retry = 'Retry';
  static const bulkDeal = 'Bulk Deal';
  static const blockDeal = 'Block Deal';
  static const buy = 'Buy';
  static const all = 'All';
  static const sell = 'Sell';
  static const searchClientName = 'Search Client Name';
  static const BUY = 'BUY';
  static const bought = 'Bought ';
  static const sold = 'Sold ';
  static const clientName = 'Client Name';
  static const tradePrice = 'Trade Price';

  static appendRs(String amount) => 'Rs $amount';

  static capitalizeFirstOfEach(String name) =>
      name.split(" ").map((str) => str.capitalize).join(" ");

  static sharesFormat(String number) =>
      NumberFormat.decimalPattern().format(int.parse(number));

  static amountFormat(String number) => NumberFormat.compactCurrency(
        symbol: '₹ ',
        locale: "en_IN",
        decimalDigits: 3,
      ).format(double.parse(number));
}

class ErrorMessages {
  ErrorMessages._privateConstructor();

  static const unauthorized = 'You are not authorized';
  static const noInternet = 'Please check your internet connection';
  static const connectionTimeout = 'Please check your internet connection';
  static const networkGeneral = 'Something went wrong. Please try again later.';
  static const invalidPhone = 'Invalid Mobile number';
  static const invalidOTP = 'Invalid OTP';
  static const invalidName = 'Invalid Name';
  static const invalidEmail = 'Invalid Email';
}
