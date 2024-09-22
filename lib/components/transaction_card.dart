import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hubtel_coding_challenge/components/date_chip.dart';
import 'package:hubtel_coding_challenge/components/status_chip.dart';
import 'package:hubtel_coding_challenge/model/transaction_model.dart';
import 'package:hubtel_coding_challenge/utils/app_drawables.dart';

import '../utils/app_palette.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({
    super.key,
    required this.transaction,
  });

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppPalette.borderGray,
          width: 1.2,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            transaction.time,
            style: const TextStyle(
              color: AppPalette.textGray,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 25,
                child: Image.asset(transaction.logo),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            transaction.recipientName,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                        const SizedBox(width: 20),
                        transaction.isSuccessful
                            ? StatusChip.success()
                            : StatusChip.failure(),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          transaction.recipientNumber.replaceAllMapped(
                              RegExp(r'^(\d{3})(\d{3})(\d{4})$'), (match) {
                            return '${match[1]} ${match[2]} ${match[3]}';
                          }),
                          style: const TextStyle(color: AppPalette.textGray),
                        ),
                        Text(
                          "GHS ${transaction.amount}",
                          style: const TextStyle(fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Divider(
            thickness: 1,
            color: AppPalette.borderGray,
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    SvgPicture.asset(AppDrawables.icPerson),
                    const SizedBox(width: 8),
                    Text(transaction.category),
                    if (transaction.reference != null) ...[
                      Container(
                        height: 6,
                        width: 6,
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          color: AppPalette.textGray,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Expanded(
                        child: Text(transaction.reference ?? ""),
                      ),
                    ],
                  ],
                ),
              ),
              if (transaction.isFavorite)
                Container(
                  margin: const EdgeInsets.only(left: 8.0),
                  child: SvgPicture.asset(AppDrawables.icStar),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class TransactionHistoryList extends StatelessWidget {
  const TransactionHistoryList({super.key, required this.history});
  final TransactionsHistory history;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DateChip(
          date: history.date,
        ),
        const SizedBox(height: 10),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final transaction = history.transactions[index];
            return TransactionCard(transaction: transaction);
          },
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemCount: history.transactions.length,
        ),
      ],
    );
  }
}
