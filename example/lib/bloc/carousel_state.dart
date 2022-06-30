part of 'carousel_bloc.dart';

class CarouselState {
  CarouselState(
      {required this.showFirstCard,
      required this.showSecondCard,
      required this.showThirdCard});

  final bool showFirstCard;
  final bool showSecondCard;
  final bool showThirdCard;

  CarouselState copyWith({
    bool? showFirstCard,
    bool? showSecondCard,
    bool? showThirdCard,
  }) {
    return CarouselState(
      showFirstCard: showFirstCard ?? this.showFirstCard,
      showSecondCard: showSecondCard ?? this.showSecondCard,
      showThirdCard: showThirdCard ?? this.showThirdCard,
    );
  }
}
