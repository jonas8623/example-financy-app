import 'package:example_financy/bloc/bloc.dart';
import 'package:example_financy/repositories/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {

  final TransactionRepository transactionRepository;

  TransactionBloc({required this.transactionRepository}) : super(TransactionLoadingState()) {

    on<LoadTransactionEvent>((event, emit) => _displayTransaction(event, emit));
  }

  Future<void> _displayTransaction(LoadTransactionEvent event, Emitter<TransactionState> emit) async {

    await Future.delayed(const Duration(milliseconds: 100));
    emit(TransactionLoadingState());

    try {
      final transactions = await transactionRepository.getAllTransactions();

      if(transactions.isNotEmpty) {
        emit(TransactionsUploadedSuccessfully(transactions: transactions));
      } else if(transactions.isEmpty) {
        emit(EmptyTransactions(message: "There aren't transactions"));
      } else {
        emit(ErrorLoadingTransaction(message: "An error occurred while loading transactions"));
      }
    } catch(error) {
      emit(ErrorLoadingTransaction(message: "An error occurred while loading transactions: $error"));
    }
  }
}