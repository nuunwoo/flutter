import 'package:dependencies/dependencies.dart';

enum CartNoValidationError { empty }

class CartNo extends FormzInput<String, CartNoValidationError> {
  const CartNo.pure() : super.pure('');
  const CartNo.dirty([super.value = '']) : super.dirty();

  @override
  CartNoValidationError? validator(String value) {
    if (value.isEmpty) return CartNoValidationError.empty;
    return null;
  }
}
