class Transaction {
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  Transaction({
    required this.id,
    required this.title,
    required this.date,
    required this.amount,
  });
}

// ITS NOT A CLASS IT ACTS AS A MODEL FOR OUR DATA FROMAT IN A WAY