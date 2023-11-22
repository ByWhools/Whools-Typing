import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:typing/Services/LaunchUrl.dart';
import 'package:typing/screens/HomeScreen.dart';

class AppBarDesktop extends StatefulWidget {
  const AppBarDesktop({super.key});

  @override
  State<AppBarDesktop> createState() => _AppBarDesktopState();
}

class _AppBarDesktopState extends State<AppBarDesktop> {
  @override
  Widget build(BuildContext context) {

    return AppBar(
      leadingWidth: 200,
      forceMaterialTransparency: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(
          "WhoolsTyping",
          style: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
                onPressed: () =>
                    launchWebApp("https://github.com/ByWhools/Whools-Typing"),
                child:  Text(
                  "Quiero el Codigo!!",
                  style: GoogleFonts.silkscreen(
                      color: Colors.white,),
                )),
                
            TextButton(
                onPressed: () => launchWebApp("https://www.whools.xyz"),
                child: Text(
                  "Ver proyectos de Whools",
                  style: GoogleFonts.silkscreen(
                      color: Colors.blue,),
                )),
          ],
        ),
      ],
    );
  }
}
