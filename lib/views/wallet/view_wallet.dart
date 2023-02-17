import 'package:flutter/material.dart';

class ViewWallet extends StatefulWidget {
  const ViewWallet({Key? key}) : super(key: key);

  @override
  State<ViewWallet> createState() => _ViewWalletState();
}

class _ViewWalletState extends State<ViewWallet> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Wallet"),),
    );
  }
}
