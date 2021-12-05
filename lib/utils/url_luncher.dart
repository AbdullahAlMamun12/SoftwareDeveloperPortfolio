import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class AppUrlLauncher{

 void launchFacebook() async{

   try{

     var url = 'fb://facewebmodal/f?href=https://www.facebook.com/al.mamun.me12';
     if (await canLaunch(url)) {
       await launch( url, universalLinksOnly: true, );
     } else { throw 'There was a problem to open the url: $url'; }
     debugPrint("andord and ios");
   }
   catch(exception){
     var url = 'https://facebook.com/al.mamun.me12';
     var can = await canLaunch(url);
     if (can) {
       await launch(url,);
     } else {
       throw 'Could not launch $url';
     }
   }

 }
 void launchLinkedin() async{
   var url = 'https://www.linkedin.com/in/al-mamun12';
   var can = await canLaunch(url);
   if (can) {
     await launch(url,);
   } else {
     throw 'Could not launch $url';
   }

 }
 void launchGithub() async{
   var url = 'https://github.com/AbdullahAlMamun12';
   var can = await canLaunch(url);
   if (can) {
     await launch(url,);
   } else {
     throw 'Could not launch $url';
   }

 }

}