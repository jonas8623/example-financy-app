import 'package:example_financy/bloc/bloc.dart';
import 'package:example_financy/constant.dart';
import 'package:example_financy/models/models.dart';
import 'package:example_financy/views/views.dart';
import 'package:example_financy/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class View extends StatefulWidget {
  const View({Key? key}) : super(key: key);

  @override
  State<View> createState() => _ViewState();
}

class _ViewState extends State<View> {

  late final PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final bloc = BlocProvider.of<AuthBloc>(context);

    return BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          return Scaffold(
            body: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              children: const [
                ViewHome(),
                ViewStats(),
                ViewWallet(),
                ViewProfile()
              ],
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: () {},
                backgroundColor: Constant.color2,
                child: const Icon(Icons.add),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: WidgetBottomAppBar(
                selectedColor: Constant.color2,
                children: [
                  BottomAppBarModel(
                    label: 'Home',
                    firstIcon: Icons.home,
                    secondIcon: Icons.home_outlined,
                    onPressed: () => _pageController.jumpToPage(0)
                  ),
                  BottomAppBarModel(
                      label: 'Stats',
                      firstIcon: Icons.analytics,
                      secondIcon: Icons.analytics_outlined,
                      onPressed: () => _pageController.jumpToPage(1)
                  ),
                  BottomAppBarModel.empty(),
                  BottomAppBarModel(
                      label: 'Wallet',
                      firstIcon: Icons.wallet,
                      secondIcon: Icons.wallet_outlined,
                      onPressed: () => _pageController.jumpToPage(2)
                  ),
                  BottomAppBarModel(
                      label: 'Profile',
                      firstIcon: Icons.person,
                      secondIcon: Icons.person_outline,
                      onPressed: () => _pageController.jumpToPage(3)
                  ),
                ]
            ),
          );
        }
    );
  }
}