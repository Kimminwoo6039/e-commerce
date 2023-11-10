part of 'menu_bloc.dart';

abstract class MenuEvent {
  const MenuEvent();

}

class MenuIntiialized extends MenuEvent {
  final MallType mallType;

  MenuIntiialized(this.mallType);
}