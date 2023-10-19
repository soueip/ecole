class Transaction {
  final String productName;
  final double price;
  final String date;
  final String kidName;

  Transaction({
    required this.productName,
    required this.price,
    required this.date,
    required this.kidName,
  });
}

List<Transaction> transactions = [
  Transaction(
      productName: 'milk', price: 5, date: '2023-10-18', kidName: 'John Doe'),
  Transaction(
      productName: 'Snack', price: 2, date: '2023-10-19', kidName: 'Jane Doe'),
  Transaction(
      productName: 'Snack', price: 4, date: '2023-10-20', kidName: 'Jane Doe'),
  Transaction(
      productName: 'other', price: 6, date: '2023-10-23', kidName: 'Jane Doe'),
  // Add more transactions as needed
];
