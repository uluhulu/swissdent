class CartScreenEvent {}

class TapOnMinus extends CartScreenEvent {
  final double amount;

  TapOnMinus(this.amount);
}

class TapOnPlus extends CartScreenEvent {
  final double amount;

  TapOnPlus(this.amount);
}
