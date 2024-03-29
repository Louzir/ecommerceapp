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
              const Row(
                children: [
                  TextFrave(
                      text: 'E_commerce ',
                      color: Colors.redAccent,
                      fontWeight: FontWeight.w500),
                  TextFrave(text: 'marque_B', fontWeight: FontWeight.w500),
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
                          colors: [Colors.white, Colors.redAccent])),
                  child: Container(
                    margin: const EdgeInsets.all(10.0),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.redAccent),
                    child:
                        const Icon(Icons.check, color: Colors.white, size: 38),
                  )),
              const SizedBox(height: 35.0),
              TextFrave(text: text, fontSize: 15, fontWeight: FontWeight.w400),
              const SizedBox(height: 20.0),
              InkWell(
                onTap: onPressed,
                child: Container(
                  alignment: Alignment.center,
                  height: 30,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(5.0)),
                  child: const TextFrave(
                      text: 'Done', color: Colors.white, fontSize: 14),
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}
