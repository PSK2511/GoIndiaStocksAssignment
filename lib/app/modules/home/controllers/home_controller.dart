import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stocks/app/data/models/request/StockRequest.dart';
import 'package:stocks/app/data/models/response/stocks_response.dart';
import 'package:stocks/app/data/repository/stock_repository.dart';
import 'package:stocks/app/data/values/constants.dart';
import 'package:stocks/base/base_controller.dart';
import 'package:stocks/utils/helper/exception_handler.dart';
import 'package:stocks/utils/helper/text_field_wrapper.dart';

class HomeController extends BaseController<StockRepository>
    with GetSingleTickerProviderStateMixin {
  final searchWrapper = TextFieldWrapper();
  late final tabController;
  final _bulk = RxList<Stock>([]);
  final _block = RxList<Stock>([]);
  final RxBool _isLoading = RxBool(true);
  final List<Stock> _bulkOriginal = [];
  final List<Stock> _blockOriginal = [];
  Rx<DealType> _dealType = DealType.ALL.obs;
  String _query = '';

  //todo empty view

  List<Stock> get bulk => _bulk;
  List<Stock> get block => _block;
  String get dealType => _dealType.value.name;
  bool get isLoading => _isLoading.value;

  _searchListener() {
    searchWrapper.controller.addListener(() {
      _query = searchWrapper.controller.text.trim().toLowerCase();
      _setStock();
    });
  }

  bool _filterStock(Stock stock) {
    bool queryResult = stock.clientName.toLowerCase().contains(_query);
    if (_dealType.value == DealType.ALL) {
      return queryResult;
    }
    return queryResult && stock.dealType == _dealType.value.name;
  }

  _setStock() {
    _bulk.assignAll(_bulkOriginal.where((element) => _filterStock(element)));
    _block.assignAll(_blockOriginal.where((element) => _filterStock(element)));
  }

  showAllStocks() {
    _dealType.value = DealType.ALL;
    _setStock();
  }

  showBuyStockOnly() {
    _dealType.value = DealType.BUY;
    _setStock();
  }

  showSellStockOnly() {
    _dealType.value = DealType.SELL;
    _setStock();
  }

  receiveData() async {
    final bulkResponse = await repository.receiveStocks(
      StockRequest(
        finCode: '100114',
        dealType: 'Bulk_Deal',
      ),
    );
    if (bulkResponse.data != null) {
      if (bulkResponse.data!.data.isNotEmpty) {
        _bulk.assignAll(bulkResponse.data!.data);
        _bulkOriginal.assignAll(bulkResponse.data!.data);
      }
    } else {
      HandleError.handleError(bulkResponse.error);
    }

    final blockResponse = await repository.receiveStocks(
      StockRequest(
        finCode: '100114',
        dealType: 'Block_Deal',
      ),
    );
    if (blockResponse.data != null) {
      if (blockResponse.data!.data.isNotEmpty) {
        _block.assignAll(blockResponse.data!.data);
        _blockOriginal.assignAll(blockResponse.data!.data);
      }
    } else {
      HandleError.handleError(blockResponse.error);
    }
    _isLoading.value = false;
  }

  @override
  void onInit() {
    super.onInit();
    _searchListener();
    tabController = TabController(
      length: 2,
      vsync: this,
    );
    receiveData();
  }
}
