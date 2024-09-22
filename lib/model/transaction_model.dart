// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hubtel_coding_challenge/utils/app_drawables.dart';

class TransactionsHistory {
  final String date;
  final List<Transaction> transactions;
  TransactionsHistory({
    required this.date,
    required this.transactions,
  });
}

class Transaction {
  final String recipientName;
  final String recipientNumber;
  final num amount;
  final String time;
  final String logo;
  final String category;
  final String? reference;
  final bool isFavorite;
  final bool isSuccessful;

  Transaction({
    required this.recipientName,
    required this.recipientNumber,
    required this.amount,
    required this.time,
    required this.logo,
    this.category = "Personal",
    this.reference = "Cool your heart wai",
    this.isFavorite = false,
    required this.isSuccessful,
  });
}

final List<TransactionsHistory> historyList = [
  TransactionsHistory(
    date: "May 24, 2022",
    transactions: [
      Transaction(
        recipientName: 'Emmanuel Rockson Kwabena Uncle Ebo',
        recipientNumber: '0241234567',
        amount: 500,
        time: '14:45PM',
        logo: AppDrawables.imgMomo,
        isSuccessful: true,
        isFavorite: true,
      ),
      Transaction(
        recipientName: 'Absa Bank',
        recipientNumber: '0241234567',
        amount: 500,
        time: '14:45PM',
        logo: AppDrawables.imgAbsa,
        isSuccessful: false,
        isFavorite: true,
      ),
    ],
  ),
  TransactionsHistory(
    date: "May 23, 2022",
    transactions: [
      Transaction(
        recipientName: 'Emmanuel Rockson Kwabena Uncle Ebo',
        recipientNumber: '0241234567',
        amount: 500,
        time: '14:45PM',
        logo: AppDrawables.imgMomo,
        isSuccessful: true,
        isFavorite: true,
      ),
      Transaction(
        recipientName: 'Emmanuel Rockson Kwabena Uncle Ebo',
        recipientNumber: '0241234567',
        amount: 500,
        time: '14:45PM',
        logo: AppDrawables.imgMomo,
        isSuccessful: true,
        isFavorite: true,
      ),
      Transaction(
        recipientName: 'Absa Bank',
        recipientNumber: '0241234567',
        amount: 500,
        time: '14:45PM',
        logo: AppDrawables.imgAbsa,
        isSuccessful: false,
        isFavorite: true,
        category: "Other",
      ),
    ],
  ),
];
