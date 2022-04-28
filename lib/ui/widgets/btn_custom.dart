part of 'widgets.dart';

class Btn_Custom extends StatelessWidget {

  final String text;
  final double width;
  final double height;
  final double border;
  final Color colorText;
  final Color backgroundColor;
  final double fontSize;
  final VoidCallback? onPressed;

  const Btn_Custom({
    Key? key,
    required this.text,
    required this.width,
    this.onPressed,
    
    this.height = 50,
    this.border = 8.0,
    this.colorText = Colors.white,
    this.fontSize = 19,
    this.backgroundColor = ColorsCustom.kprimaryColor
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Colors.white,
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(border))
        ),
        child: Custom_Text(text: text, color: colorText, fontSize: fontSize),
        onPressed: onPressed, 
      ),
    );
  }
}