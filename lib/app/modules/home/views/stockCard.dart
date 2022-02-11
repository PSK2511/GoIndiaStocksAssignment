import 'package:flutter/material.dart';
import 'package:stocks/app/theme/app_colors.dart';
import 'package:stocks/app/theme/styles.dart';

class StockCard extends StatelessWidget {
  final String clientName;
  final String date;
  final String stockTransaction;
  final String value;
  final String quantity;
  final String tradePrice;
  final Color dividerColor;
  final TextStyle transactionStyle;

  StockCard({
    required this.clientName,
    required this.date,
    required this.stockTransaction,
    required this.value,
    required this.tradePrice,
    required this.quantity,
    required this.dividerColor,
    required this.transactionStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 0),
              )
            ]),
        height: 130,
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 26, 10),
          child: Row(
            children: [
              VerticalDivider(
                thickness: 4,
                color: dividerColor,
              ),
              SizedBox(width: 10),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              clientName,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Styles.tsBlackMedium18,
                            ),
                          ),
                          Text(
                            date,
                          ),
                        ],
                      ),
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: stockTransaction + quantity + ' shares ',
                              style: transactionStyle),
                          TextSpan(
                            text: '@ ' + tradePrice,
                            style: Styles.tsBlackRegular18,
                          ),
                        ]),
                      ),
                      Text(
                        'Value ' + value,
                        style: Styles.tsPrimaryColorRegular18,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
