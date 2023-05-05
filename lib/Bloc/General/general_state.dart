
part of 'general_bloc.dart';

@immutable
abstract class GeneralState {

  final bool showMenuHome;

  const GeneralState({
    this.showMenuHome = true
  });
}



class GeneralInitial extends GeneralState {}

class SetMenuHomeState extends GeneralState{
  final bool menu;

  const SetMenuHomeState({required this.menu}) : super(showMenuHome: menu);
}

