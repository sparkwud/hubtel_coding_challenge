// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hubtel_coding_challenge/utils/app_drawables.dart';
import 'package:intl/intl.dart';

class TransactionsHistory {
  final String date;
  final List<Transaction> transactions;
  TransactionsHistory({
    required this.date,
    required this.transactions,
  });
}

final transaction = [
  Transaction(
    recipientName: 'Emmanuel Rockson Kwabena Uncle Ebo',
    recipientNumber: '0241234567',
    amount: 500,
    date: DateTime(2022, 5, 23),
    time: '14:45PM',
    logo: AppDrawables.imgMomo,
    isSuccessful: true,
    isFavorite: true,
  ),
  Transaction(
    recipientName: 'Absa Bank',
    recipientNumber: '0241234567',
    amount: 500,
    date: DateTime(2022, 5, 23),
    time: '14:45PM',
    logo: AppDrawables.imgAbsa,
    isSuccessful: false,
    isFavorite: true,
  ),
];

Map<T, List<S>> groupBy<S, T>(Iterable<S> values, T Function(S) key) {
  var map = <T, List<S>>{};
  for (var element in values) {
    (map[key(element)] ??= []).add(element);
  }
  return map;
}

List<TransactionsHistory> groupTransactionsByDate(
  List<Transaction> transactions,
) {
  // Sort transactions by date
  transactions.sort((a, b) => a.date.compareTo(b.date));

  // Group transactions by date
  var grouped = groupBy(
    transactions,
    (Transaction t) => DateTime(t.date.year, t.date.month, t.date.day),
  );

  // Convert grouped transactions to List<TransactionsHistory>
  return grouped.entries.map((entry) {
    return TransactionsHistory(
      date: DateFormat('yyyy-MM-dd').format(entry.key),
      transactions: entry.value,
    );
  }).toList();
}

class Transaction {
  final String recipientName;
  final String recipientNumber;
  final num amount;
  final String time;
  final DateTime date;
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
    required this.date,
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
        date: DateTime(2022, 5, 24),
        time: '14:45PM',
        logo: AppDrawables.imgMomo,
        isSuccessful: true,
        isFavorite: true,
      ),
      Transaction(
        recipientName: 'Absa Bank',
        recipientNumber: '0241234567',
        date: DateTime(2022, 5, 24),
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
        date: DateTime(2022, 5, 23),
        time: '14:45PM',
        logo: AppDrawables.imgMomo,
        isSuccessful: true,
        isFavorite: true,
      ),
      Transaction(
        recipientName: 'Emmanuel Rockson Kwabena Uncle Ebo',
        recipientNumber: '0241234567',
        amount: 500,
        date: DateTime(2022, 5, 23),
        time: '14:45PM',
        logo: AppDrawables.imgMomo,
        isSuccessful: true,
        isFavorite: true,
      ),
      Transaction(
        recipientName: 'Absa Bank',
        recipientNumber: '0241234567',
        amount: 500,
        date: DateTime(2022, 5, 23),
        time: '14:45PM',
        logo: AppDrawables.imgAbsa,
        isSuccessful: false,
        isFavorite: true,
        category: "Other",
      ),
    ],
  ),
];
