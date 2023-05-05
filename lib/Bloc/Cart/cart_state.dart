part of 'cart_bloc.dart';

@immutable
abstract class CartState {

  final String totalAmount;
  final String currency;
  final bool? cardActive;
  final CreditCardFrave? creditCardFrave;


  const CartState({
    this.totalAmount = '00.0', 
    this.currency    = 'TND',
    this.cardActive,
    this.creditCardFrave 
  });

  // String get amountPayString => '${ ( this.totalAmount * 100 ).floor() }';
}

class CartInitial extends CartState {

  const CartInitial():super(cardActive: false);
}

class LoadingPaymentState extends CartState {}

class SuccessPaymentState extends CartState {}

class FailurePaymentState extends CartState {
  final String err;

  const FailurePaymentState(this.err);
}

class SetActiveCardState extends CartState {
  final bool active;
  final CreditCardFrave creditCard;

  const SetActiveCardState({required this.active, required this.creditCard}): super(cardActive: active, creditCardFrave: creditCard);
}