import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swissdent/screens/cart_screen/bloc/cart_screen_event.dart';
import 'package:swissdent/screens/cart_screen/bloc/cart_screen_state.dart';

class CartScreenBloc extends Bloc<CartScreenEvent, CartScreenState> {
  double amount = 0;

  CartScreenBloc() : super(CartScreenState(0));

  @override
  Stream<CartScreenState> mapEventToState(CartScreenEvent event) async* {
    yield* mapPlusMinusEvent(event);
  }

  Stream<CartScreenState> mapPlusMinusEvent(CartScreenEvent event) async* {
    if (event is TapOnMinus) {
      if (amount > 0) {
        amount = amount - event.amount;
        yield CartScreenState(amount);
      }
    }
    if (event is TapOnPlus) {
      amount = amount + event.amount;
      yield CartScreenState(amount);
    }
  }
}
