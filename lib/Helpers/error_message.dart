part of 'helpers.dart';

void errorMessageSnack(BuildContext context, String error) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: TextFrave(text: error, color: Colors.black),
      backgroundColor: Colors.transparent));
}
