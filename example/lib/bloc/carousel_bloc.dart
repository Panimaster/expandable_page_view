import 'package:bloc/bloc.dart';

part 'carousel_event.dart';
part 'carousel_state.dart';

class CarouselBloc extends Bloc<CarouselEvent, CarouselState> {
  CarouselBloc()
      : super(
          CarouselState(
            showFirstCard: true,
            showSecondCard: true,
            showThirdCard: true,
          ),
        ) {
    on<CarouselFirstCardDismissed>((event, emit) {
      emit(state.copyWith(showFirstCard: false));
    });

    on<CarouselSecondCardDismissed>((event, emit) {
      emit(state.copyWith(showSecondCard: false));
    });

    on<CarouselThirdCardDismissed>((event, emit) {
      emit(state.copyWith(showThirdCard: false));
    });
  }
}
