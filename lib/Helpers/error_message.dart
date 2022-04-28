part of 'helpers.dart';

void errorMessageSnack(BuildContext context, String error){

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Custom_Text(text: error, color: Colors.white), 
      backgroundColor: Colors.red
    )
  );

}