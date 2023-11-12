
part of 'view_module_bloc.dart';

abstract class ViewModuleEvent {
  const ViewModuleEvent();
}


class ViewModultInitalized extends ViewModuleEvent {
  final int tabId;

  ViewModultInitalized(this.tabId);
}