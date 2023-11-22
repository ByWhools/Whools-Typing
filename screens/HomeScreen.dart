import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:typing/Appbars/Desktop.dart';
import 'package:typing/Appbars/Mobile.dart';
import 'package:typing/Providers/input_Provider.dart';
import 'package:typing/Services/LaunchUrl.dart';
import 'package:typing/widgets/Keyboard.dart';
import 'package:typing/widgets/PopUpIcon.dart';
import 'package:typing/widgets/change_word_text.dart';
import 'package:typing/widgets/type_card.dart';
import 'package:boxicons/boxicons.dart';

final actionButtonColor = WindowButtonColors(iconNormal: Colors.white);

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final input = ref.watch(inputProvider);
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(width, 90),
            child: width < 800 ? const AppBarMobile() : const AppBarDesktop()),
        body: Center(
          child: Column(
            children: [
              ColoredBox(
                color: Color.fromARGB(255, 0, 0, 0),
                child: WindowTitleBarBox(
                  child: Row(
                    children: [
                      Expanded(child: MoveWindow()),
                      Row(
                        children: [
                          MinimizeWindowButton(
                            colors: actionButtonColor,
                          ),
                          MaximizeWindowButton(
                            colors: actionButtonColor,
                          ),
                          CloseWindowButton(
                            colors: actionButtonColor,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 600),
                  child: ListView(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    children: [
                      width > 350
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _wordNumbers(),
                                _wpeAndAcc(input),
                              ],
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _wordNumbers(),
                                _wpeAndAcc(input),
                              ],
                            ),
                      const SizedBox(
                        height: 15,
                      ),
                      const TypeCard(),
                      const SizedBox(
                        height: 40,
                      ),
                      width < 800 ? const SizedBox() : const KeyBoard(),
                      const SizedBox(
                        height: 100,
                      ),
                      width < 800
                          ? const SizedBox()
                          : Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    launchWebApp(
                                        "https://www.instagram.com/bywhools/");
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
                                    launchWebApp(
                                        "https://tiktok.com/@bywhools");
                                  },
                                  child: const PopupIcon(
                                    icon: Boxicons.bxl_tiktok,
                                    color: Colors.black,
                                    text: 'Tiktok',
                                  ),
                                ),
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
                                    launchWebApp(
                                        "https://discord.gg/3C3sTwkRM2");
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
                  ),
                ),
              ),
            ],
          ),
        ),
        endDrawer: width < 800 ? const  DrawerMobile() : null,
      ),
    );
  }

  Text _wpeAndAcc(InputNotifier input) {
    return Text(
      'WPM: ${input.wpm} / ACC: ${input.accuracy}%',
      style: const TextStyle(fontSize: 16),
      textAlign: TextAlign.end,
    );
  }

  Row _wordNumbers() {
    return Row(
      children: [
        for (final wordsNumber in [10, 25, 50, 100]) ...[
          ChangeWordsText(wordsNumber),
          if (wordsNumber != 100)
            const Text('/', style: TextStyle(fontSize: 18)),
        ],
      ],
    );
  }
}
