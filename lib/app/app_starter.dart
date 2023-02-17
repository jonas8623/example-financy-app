import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/bloc.dart';
import '../extensions/extensions.dart';
import '../views/views.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => DeviceSizeData.init(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final bloc = BlocProvider.of<AppStartedBloc>(context);

    return BlocBuilder<AppStartedBloc, AppStartedState>(
        bloc: bloc,
        builder: (context, state) {

          if(state is AppSuccessState) {
            return const View();

          } else if(state is Loading) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()));

          }

          return const ViewOnBoarding();
        }
    );
  }
}
