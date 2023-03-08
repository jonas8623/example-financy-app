import 'package:example_financy/bloc/bloc.dart';
import 'package:example_financy/constant.dart';
import 'package:example_financy/extensions/extensions.dart';
import 'package:example_financy/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewHome extends StatefulWidget {
  const ViewHome({Key? key}) : super(key: key);

  @override
  State<ViewHome> createState() => _ViewHomeState();
}

class _ViewHomeState extends State<ViewHome> {
  List<TransactionModel> transactions = [];

  double get textScaleFactor =>
      MediaQuery.of(context).size.width < 360 ? 0.7 : 1.0;
  double get iconSize => MediaQuery.of(context).size.width < 360 ? 16.0 : 24.0;

  Widget _backgroundColor() {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Constant.color1, Constant.color2]),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.elliptical(500, 30),
              bottomRight: Radius.elliptical(500, 30))),
      height: 287.getDeviceHeight,
    );
  }

  Widget _text(
      {required String text,
      required double fontSize,
      FontWeight? fontWeight,
      Color? color}) {
    return Text(
      text,
      textScaleFactor: textScaleFactor,
      style: TextStyle(
          fontWeight: fontWeight,
          fontSize: fontSize,
          color: color ?? Colors.white),
    );
  }

  Widget _rowInformationUser() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _text(text: 'Good Afternoon,', fontSize: 16.0),
            _text(
                text: 'Jonas User Test',
                fontSize: 24.0,
                fontWeight: FontWeight.bold)
          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(
              vertical: 8.getDeviceHeight, horizontal: 8.getDeviceWidth),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(4.0)),
              color: Colors.white.withOpacity(0.06)),
          child: Stack(
            alignment: const AlignmentDirectional(0.5, -0.5),
            children: [
              const Icon(
                Icons.notifications_none_outlined,
                color: Colors.white,
              ),
              Container(
                width: 8.getDeviceWidth,
                height: 8.getDeviceWidth,
                decoration: BoxDecoration(
                    color: Colors.deepOrange.shade300,
                    borderRadius: BorderRadius.circular(4.0)),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _rowValues(
      {required IconData icon, required String title, required String value}) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(4.0),
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.06),
              borderRadius: const BorderRadius.all(Radius.circular(16.0))),
          child: Icon(
            icon,
            color: Colors.white,
            size: iconSize,
          ),
        ),
        const SizedBox(
          width: 4.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _text(text: title, fontSize: 18.0, fontWeight: FontWeight.w400),
            _text(text: value, fontSize: 20.0, fontWeight: FontWeight.w600)
          ],
        ),
      ],
    );
  }

  Widget _card() {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: 24.getDeviceWidth, vertical: 32.getDeviceHeight),
      decoration: const BoxDecoration(
          color: Constant.color2,
          borderRadius: BorderRadius.all(Radius.circular(16.0))),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _text(
                      text: 'Total Balance',
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400),
                  _text(
                      text: '\$ 1,556.00',
                      fontSize: 30.0,
                      fontWeight: FontWeight.w600),
                ],
              ),
              GestureDetector(
                onTap: () {},
                child: PopupMenuButton(
                    padding: EdgeInsets.zero,
                    itemBuilder: (context) => [
                          const PopupMenuItem(
                              height: 24.0, child: Text("Item 1"))
                        ],
                    child: const Icon(
                      Icons.more_horiz,
                      color: Colors.white,
                    )),
              )
            ],
          ),
          SizedBox(height: 36.getDeviceHeight),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _rowValues(
                  icon: Icons.arrow_downward,
                  title: 'Income',
                  value: '\$ 1,840.00'),
              _rowValues(
                  icon: Icons.arrow_upward,
                  title: 'Expenses',
                  value: '\$ 284.00'),
            ],
          )
        ],
      ),
    );
  }

  Widget _displayTransaction() {
    final bloc = BlocProvider.of<TransactionBloc>(context);

    return BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          if (state is TransactionLoadingState) {
            return const Center(child: CircularProgressIndicator());

          } else if (state is EmptyTransactions) {
            return Center(child: Text(state.message));

          } else if (state is TransactionsUploadedSuccessfully) {
            transactions = state.transactions!;
          }

          return Expanded(
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: transactions.length,
                  itemBuilder: (context, index) {
                    final transaction = transactions[index];

                    final color = transaction.value.isNegative
                        ? Colors.redAccent
                        : Constant.color2;

                    final value = transaction.value.toStringAsFixed(2);

                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 14.0, vertical: 8.0),
                      leading: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white54,
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: const Icon(Icons.monetization_on_outlined),
                      ),
                      title: _text(
                          text: transaction.title,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87),
                      subtitle: _text(
                          text: DateTime.fromMillisecondsSinceEpoch(transaction.date).toString(),
                          fontSize: 16.0,
                          color: Colors.black54),
                      trailing:
                          _text(text: value, fontSize: 20.0, color: color),
                    );
                  }));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: _backgroundColor(),
            ),
            Positioned(
              left: 24.0,
              right: 24.0,
              top: 74.getDeviceHeight,
              child: _rowInformationUser(),
            ),
            Positioned(
              left: 24.getDeviceWidth,
              right: 24.getDeviceWidth,
              top: 155.getDeviceHeight,
              child: _card(),
            ),
            Positioned(
                top: 397.getDeviceHeight,
                bottom: 0,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _text(
                              text: "Transaction History",
                              fontSize: 22.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          _text(
                              text: "See all",
                              fontSize: 16.0,
                              color: Colors.black54),
                        ],
                      ),
                    ),
                    _displayTransaction(),
                  ],
                ))
          ],
        ));
  }
}
