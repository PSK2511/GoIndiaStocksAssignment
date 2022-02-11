class StockRequest {
  late final String finCode;
  late final String dealType;

  StockRequest({
    required this.dealType,
    required this.finCode,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['fincode'] = this.finCode;
    data['DealType'] = this.dealType;
    return data;
  }
}
