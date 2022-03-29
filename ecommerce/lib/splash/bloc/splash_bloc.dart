import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<SplashStartEvent>((event, emit) async {
      await Future<dynamic>.delayed(const Duration(seconds: 5));
      emit(SplashNavigateHome());
    });
  }
}
