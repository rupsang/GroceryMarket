part of 'helpers.dart';

void modalSuccess(BuildContext context, String text,
    {required VoidCallback onPressed}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.black12,
    builder: (context) {
      return AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        content: SizedBox(
          height: 250,
          child: Column(
            children: [
              Row(
                children: const [
                  Custom_Text(
                      text: 'Grocery Market',
                      color: ColorsCustom.kprimaryColor,
                      fontWeight: FontWeight.w500),
                  // Custom_Text(text: 'Farm', fontWeight: FontWeight.w500),
                ],
              ),
              const Divider(),
              const SizedBox(height: 10.0),
              Container(
                  height: 90,
                  width: 90,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          colors: [Colors.white, ColorsCustom.kprimaryColor])),
                  child: Container(
                    margin: const EdgeInsets.all(10.0),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorsCustom.kprimaryColor),
                    child:
                        const Icon(Icons.check, color: Colors.white, size: 38),
                  )),
              const SizedBox(height: 35.0),
              Custom_Text(
                  text: text, fontSize: 17, fontWeight: FontWeight.w400),
              const SizedBox(height: 20.0),
              InkWell(
                onTap: Navigator.of(context).pop,
                child: Container(
                  alignment: Alignment.center,
                  height: 35,
                  width: 150,
                  decoration: BoxDecoration(
                      color: ColorsCustom.kprimaryColor,
                      borderRadius: BorderRadius.circular(5.0)),
                  child: const Custom_Text(
                      text: 'OK', color: Colors.white, fontSize: 17),
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}
