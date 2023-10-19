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
      productName: 'milk',
      price: 5,
      date: '2023-10-18',
      kidName: 'Mohamed Alii'),
  Transaction(
      productName: 'cocacolla',
      price: 2,
      date: '2023-10-19',
      kidName: 'Mohamed Alii'),
  Transaction(
      productName: 'Snack',
      price: 4,
      date: '2023-10-20',
      kidName: 'Mohamed Alii'),
  Transaction(
      productName: 'sablito', price: 2, date: '2023-10-23', kidName: 'Yasmine'),
  Transaction(
      productName: 'Snack', price: 2, date: '2023-10-20', kidName: 'Yasmine'),
  Transaction(
      productName: 'jus', price: 5, date: '2023-10-23', kidName: 'Yasmine'),
  Transaction(
      productName: 'Snack', price: 4, date: '2023-10-20', kidName: 'Yassine'),
  Transaction(
      productName: 'jus', price: 6, date: '2023-10-23', kidName: 'Yassine'),
  Transaction(
      productName: 'Snack', price: 3, date: '2023-10-20', kidName: 'Yassine'),
  Transaction(
      productName: 'mlaoui', price: 5, date: '2023-10-23', kidName: 'Yassine'),
  // Add more transactions as needed
];
