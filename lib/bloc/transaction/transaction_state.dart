import 'package:equatable/equatable.dart';
import '../../models/models.dart';

abstract class TransactionState extends Equatable {

  @override
  List<Object> get props => [];

}

class TransactionLoadingState extends TransactionState {}

class TransactionsUploadedSuccessfully extends TransactionState {

  final List<TransactionModel>? transactions;

  TransactionsUploadedSuccessfully({required this.transactions});
}

class ErrorLoadingTransaction extends TransactionState {

  final String message;

  ErrorLoadingTransaction({required this.message});
}

class EmptyTransactions extends TransactionState {

  final String message;
  EmptyTransactions({required this.message});
}