part of 'carousel_bloc.dart';

abstract class CarouselEvent {}

class CarouselFirstCardDismissed extends CarouselEvent {
  CarouselFirstCardDismissed();
}

class CarouselSecondCardDismissed extends CarouselEvent {
  CarouselSecondCardDismissed();
}

class CarouselThirdCardDismissed extends CarouselEvent {
  CarouselThirdCardDismissed();
}
