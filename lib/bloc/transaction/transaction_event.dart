import 'package:equatable/equatable.dart';

import '../../models/models.dart';

abstract class TransactionEvent extends Equatable {

  @override
  List<Object> get props => [];

}

class LoadTransactionEvent extends TransactionEvent {

  final List<TransactionModel>? transactions;

  LoadTransactionEvent({this.transactions});
}