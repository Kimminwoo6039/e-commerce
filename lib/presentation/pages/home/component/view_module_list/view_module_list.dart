import 'package:common/core/utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/constant.dart';
import '../../bloc/view_modult-bloc/view_module_bloc.dart';

class ViewModuleList extends StatefulWidget {
  const ViewModuleList({super.key});

  @override
  State<ViewModuleList> createState() => _ViewModuleListState();
}

class _ViewModuleListState extends State<ViewModuleList> {
  final ScrollController scrollController = ScrollController();

  @override
  initState() {
    scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose() {
    scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isEnd) {
      context.read<ViewModuleBloc>().add(ViewModuleFetched());
    }
  }

  bool get _isEnd {
    if (!scrollController.hasClients) return false;

    final maxScroll = scrollController.position.maxScrollExtent;
    final curScroll = scrollController.offset;
    return curScroll >= maxScroll * 0.9;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewModuleBloc, ViewModuleState>(
      builder: (_, state) {
        return (state.status.isInitial || state.viewModules.isEmpty)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
                controller: scrollController,
                children: [
                  ...state.viewModules,
                  if (state.status.isLoading) const LoadingWidget()
                ],
              );
      },
      // switch (state.status) {
      //   case Status.initial:
      //   case Status.loading:
      //     return const Center(
      //       child: CircularProgressIndicator(),
      //     );
      //   case Status.success:
      //     return ListView.separated(
      //       itemBuilder: (_, index) => state.viewModules[index],
      //       separatorBuilder: (_, index) => Divider(
      //         thickness: 4,
      //       ),
      //       itemCount: state.viewModules.length,
      //     );
      //   case Status.error:
      //     return const Center(
      //       child: Text("error"),
      //     );
      // }
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Center(
        child: SizedBox(
          height: 20,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
