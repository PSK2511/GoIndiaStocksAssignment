class StocksResponse {
  late final List<Stock> data;
  String? status;

  StocksResponse({required this.data, this.status});

  StocksResponse.fromJson(Map<String, dynamic> json) {
    if (json['Data'] != null) {
      data = <Stock>[];
      json['Data'].forEach((v) {
        data.add(new Stock.fromJson(v));
      });
    }
    status = json['Status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['Data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['Status'] = this.status;
    return data;
  }
}

class Stock {
  late final String finCode;
  late final String clientName;
  late final String dealType;
  late final String quantity;
  late final String value;
  late final String tradePrice;
  late final String dealDate;
  late final String exchange;

  Stock(
      {required this.finCode,
      required this.clientName,
      required this.dealType,
      required this.quantity,
      required this.value,
      required this.tradePrice,
      required this.dealDate,
      required this.exchange});

  Stock.fromJson(Map<String, dynamic> json) {
    finCode = json['FinCode'];
    clientName = json['ClientName'];
    dealType = json['DealType'];
    quantity = json['Quantity'];
    value = json['Value'];
    tradePrice = json['TradePrice'];
    dealDate = json['DealDate'];
    exchange = json['Exchange'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['FinCode'] = this.finCode;
    data['ClientName'] = this.clientName;
    data['DealType'] = this.dealType;
    data['Quantity'] = this.quantity;
    data['Value'] = this.value;
    data['TradePrice'] = this.tradePrice;
    data['DealDate'] = this.dealDate;
    data['Exchange'] = this.exchange;
    return data;
  }
}
