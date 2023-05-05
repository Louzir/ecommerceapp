
part of 'helpers.dart';

void loadinUploadFile(BuildContext context){

  showDialog(
    context: context,
    barrierColor: Colors.white54,
    builder: (context) {
       
       return AlertDialog(
         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
         title: const TextFrave(text: 'Uploading Image', color: ColorsFrave.primaryColorFrave),
         content: Container(
           height: 200,
           width: 350,
           decoration: BoxDecoration(
             color: Colors.white,
             borderRadius: BorderRadius.circular(15.0)
           ),
           child: TweenAnimationBuilder(
             tween: Tween(begin: 0.0, end: 1.0),
             duration: const Duration(seconds: 1500),
             builder: (context, double value, child) {
               int percent = ( value * 100 ).ceil();
               return SizedBox(
                 width: 230,
                 height: 230,
                 child: Stack(
                   children: [
                     Align(
                       alignment: Alignment.center,
                       child: ShaderMask(
                         shaderCallback: (rect){
                           return SweepGradient(
                             startAngle: 0.0,
                             endAngle: 3.14 * 2,
                             stops: [ value, value ],
                             center: Alignment.center,
                             colors: const [ ColorsFrave.primaryColorFrave, Colors.transparent ] 
                           ).createShader(rect);
                         },
                         child: Container(
                           height: 230,
                           width: 230,
                           decoration: const BoxDecoration(
                             color: ColorsFrave.primaryColorFrave,
                             shape: BoxShape.circle
                           ),
                         ),
                       ),
                     ),
                     Align(
                       alignment: Alignment.center,
                       child: Container(
                         height: 160,
                         width: 160,
                         decoration: const BoxDecoration(
                           color: Colors.white, shape: BoxShape.circle
                         ),
                         child: Center(child: TextFrave(text: '$percent %', fontSize: 40,)),
                       ),
                     )
                   ],
                 ),
               );
             },
           ),
         ),
       );

     },
  );


}