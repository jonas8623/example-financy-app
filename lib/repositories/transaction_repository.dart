import 'package:example_financy/models/models.dart';

abstract class TransactionRepository {

  Future<List<TransactionModel>> getAllTransactions();

}

class TransactionRepositoryImplement implements TransactionRepository {

  @override
  Future<List<TransactionModel>> getAllTransactions() async {
   return [
      TransactionModel(
          title: 'Salary',
          value: 800,
          date: DateTime.now().millisecondsSinceEpoch
      ),
      TransactionModel(
          title: 'Dinner',
          value: -30,
          date: DateTime.now().subtract(const Duration(days: 2)).millisecondsSinceEpoch
      ),
   ];
  }
}