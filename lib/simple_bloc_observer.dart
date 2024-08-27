import 'package:bloc/bloc.dart';

class SimpleBlocObserver extends BlocObserver 
{
  @override
  void onTransition(Bloc bloc, Transition transition) {
        super.onTransition(bloc, transition);

  }
@override
  void onChange(BlocBase bloc, Change change) {
   
    super.onChange(bloc, change);
  }
}
