import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stocks/app/data/values/strings.dart';
import 'package:stocks/app/modules/home/views/stocksView.dart';
import 'package:stocks/app/theme/app_colors.dart';
import 'package:stocks/app/theme/styles.dart';
import 'package:stocks/widgets/text_field/custom_text_field.dart';

import '../controllers/home_controller.dart';
import 'filter.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TabBar(
              indicatorColor: AppColors.red,
              indicatorWeight: 4,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    Strings.bulkDeal,
                    style: Styles.tsPrimaryColorRegular18,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    Strings.blockDeal,
                    style: Styles.tsPrimaryColorRegular18,
                  ),
                ),
              ],
              controller: controller.tabController,
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Filter(
                      borderColor: controller.dealType == 'ALL'
                          ? AppColors.black
                          : AppColors.transparent,
                      style: controller.dealType == 'ALL'
                          ? Styles.tsBlackRegular18
                          : Styles.tsWhiteColorRegular18,
                      bgColor: AppColors.lightBlue,
                      title: Strings.all,
                      onTap: controller.showAllStocks,
                    ),
                    Filter(
                      bgColor: AppColors.green,
                      title: Strings.buy,
                      onTap: controller.showBuyStockOnly,
                      borderColor: controller.dealType == 'BUY'
                          ? AppColors.black
                          : AppColors.transparent,
                      style: controller.dealType == 'BUY'
                          ? Styles.tsBlackRegular18
                          : Styles.tsWhiteColorRegular18,
                    ),
                    Filter(
                      bgColor: AppColors.red,
                      title: Strings.sell,
                      onTap: controller.showSellStockOnly,
                      borderColor: controller.dealType == 'SELL'
                          ? AppColors.black
                          : AppColors.transparent,
                      style: controller.dealType == 'SELL'
                          ? Styles.tsBlackRegular18
                          : Styles.tsWhiteColorRegular18,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: CustomTextField(
                wrapper: controller.searchWrapper,
                hintText: Strings.searchClientName,
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 10, 12, 6),
              child: Container(
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0.2,
                      blurRadius: 0.2,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Obx(
                () => TabBarView(
                  controller: controller.tabController,
                  children: [
                    controller.isLoading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : StocksView(
                            data: controller.bulk,
                          ),
                    controller.isLoading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : StocksView(
                            data: controller.block,
                          ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
