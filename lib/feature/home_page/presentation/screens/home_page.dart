import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/home_page_cubit.dart';
import '../widgets/completed_orders_widget.dart';
import '../widgets/new_orders_widget.dart';
import '../widgets/tab_bar_widget.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: const Color(0XFFF5F5F5),
          appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            title: const Text(
              'orders',
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.white,
          ),
          body: Column(
            children: [
              BlocBuilder<HomePageCubit, HomePageState>(
                builder: (context, state) {
                  if (state is TabChanged) {
                    _tabController!.animateTo(state.index);
                    return Row(
                      children: [
                        TabBarWidget(
                          text: "New",
                          index: 0,
                        ),
                        TabBarWidget(
                          text: "Completed",
                          index: 1,
                        ),
                      ],
                    );
                  } else {
                    return Row(
                      children: [
                        TabBarWidget(
                          text: "New",
                          index: 0,
                        ),
                        TabBarWidget(
                          text: "Completed",
                          index: 1,
                        ),
                      ],
                    );
                  }
                },
              ),
              Expanded(
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _tabController,
                  children: const [

                    NewOrderScreenWidget(),
                    CompleteOrdersScreenWidget(),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
