import 'package:archonit_test_task/presentation/bloc/home_bloc.dart';
import 'package:archonit_test_task/presentation/bloc/home_events.dart';
import 'package:archonit_test_task/presentation/bloc/home_states.dart';
import 'package:archonit_test_task/presentation/controllers/color_controller.dart';
import 'package:archonit_test_task/presentation/views/home_error_view.dart';
import 'package:archonit_test_task/presentation/views/home_loading_view.dart';
import 'package:archonit_test_task/presentation/views/home_success_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController scrollController = ScrollController();
  late final ColorController colorController;

  @override
  void initState() {
    super.initState();

    colorController = ColorController();
    context.read<HomeBloc>().add(HomeEvents.init());

    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        context.read<HomeBloc>().add(HomeEvents.updateCoins());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<HomeBloc, HomeStates>(
          builder: (context, state) {
            return state.map(
              init: () => SizedBox.shrink(),
              loading: () => HomeLoadingView(),
              loaded:
                  (data) => HomeSuccessView(
                    coins: data.coins,
                    colorController: colorController,
                    scrollController: scrollController,
                    uploadedAllCoins: data.uploadedAllCoins,
                  ),
              error: (data) => HomeErrorView(data.error),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
