import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:typing/Services/LaunchUrl.dart';
import 'package:typing/widgets/PopUpIcon.dart';

class AppBarMobile extends StatefulWidget {
  const AppBarMobile({super.key});

  @override
  State<AppBarMobile> createState() => _AppBarMobileState();
}

class _AppBarMobileState extends State<AppBarMobile> {
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
        Builder(
          builder: (BuildContext context) {
            return IconButton(
                tooltip: "How to sell D*** Online Fast?",
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
                icon: const Icon(
                  Boxicons.bx_grid,
                  color: Colors.white,
                  size: 20,
                ));
          },
        )
      ],
    );
  }
}

class DrawerMobile extends StatefulWidget {
  const DrawerMobile({super.key});

  @override
  State<DrawerMobile> createState() => _DrawerMobileState();
}

class _DrawerMobileState extends State<DrawerMobile> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xff282a36),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 1),
              leading: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Boxicons.bx_arrow_to_left)),
              title: Text(
                "Whools?",
                style:
                    GoogleFonts.silkscreen(color: Colors.white, fontSize: 18),
              ),
            ),
            ListTile(
              title: Text(
                'Quiero el Codigo',
                style: GoogleFonts.silkscreen(color: Colors.white),
              ),
              onTap: () {
                launchWebApp("https://github.com/ByWhools/Whools-Typing");
              },
            ),
            ListTile(
              title: Text(
                'Ver proyectos de Whools',
                style: GoogleFonts.silkscreen(color: Colors.white),
              ),
              onTap: () {
                launchWebApp("https://www.whools.xyz");
              },
            ),
            Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        launchWebApp("https://www.instagram.com/bywhools/");
                      },
                      child: const PopupIcon(
                        icon: Boxicons.bxl_instagram,
                        color: Color(0xffe1306c),
                        text: 'Instagram',
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        launchWebApp("https://github.com/byWhools");
                      },
                      child: const PopupIcon(
                        icon: Boxicons.bxl_github,
                        color: Color(0xff333333),
                        text: 'GitHub',
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        launchWebApp("https://tiktok.com/@bywhools");
                      },
                      child: const PopupIcon(
                        icon: Boxicons.bxl_tiktok,
                        color: Colors.black,
                        text: 'Tiktok',
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        launchWebApp(
                            "https://www.youtube.com/channel/UCurK_L8UkxOyCI_k76bP97w");
                      },
                      child: const PopupIcon(
                        icon: Boxicons.bxl_youtube,
                        color: Color(0xffde463b),
                        text: 'Youtube',
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        launchWebApp("https://discord.gg/3C3sTwkRM2");
                      },
                      child: const PopupIcon(
                        icon: Boxicons.bxl_discord,
                        color: Color.fromARGB(255, 24, 116, 254),
                        text: 'Discord',
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
