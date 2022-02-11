import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:intl/intl.dart';
import 'package:stocks/app/data/models/response/stocks_response.dart';
import 'package:stocks/app/data/values/strings.dart';
import 'package:stocks/app/modules/home/views/stockCard.dart';
import 'package:stocks/app/theme/app_colors.dart';
import 'package:stocks/app/theme/styles.dart';

class StocksView extends StatelessWidget {
  final List<Stock> data;

  const StocksView({required this.data});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) => StockCard(
          clientName: Strings.capitalizeFirstOfEach(data[index].clientName),
          date: DateFormat.d().format(
                DateTime.parse(data[index].dealDate),
              ) +
              ' ' +
              DateFormat.MMM().format(
                DateTime.parse(data[index].dealDate),
              ) +
              ' ' +
              DateFormat.y().format(
                DateTime.parse(data[index].dealDate),
              ),
          stockTransaction: data[index].dealType == Strings.BUY
              ? Strings.bought
              : Strings.sold,
          value: Strings.amountFormat(data[index].value),
          tradePrice: Strings.appendRs(data[index].tradePrice),
          quantity: Strings.sharesFormat(data[index].quantity),
          dividerColor: data[index].dealType == Strings.BUY
              ? AppColors.green
              : AppColors.red,
          transactionStyle: data[index].dealType == Strings.BUY
              ? Styles.tsGreenRegular18
              : Styles.tsRedRegular18,
        ),
      ),
    );
  }
}
