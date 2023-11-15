import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:typing/Providers/input_Provider.dart';
import 'package:typing/widgets/change_word_text.dart';
import 'package:typing/widgets/type_card.dart';
import 'package:url_launcher/url_launcher.dart';


final actionButtonColor  = WindowButtonColors(
    iconNormal: Colors.white
  );
class HomeScreen extends ConsumerWidget{
  const HomeScreen({Key? key}) : super  (key: key);

  @override
  Widget build(BuildContext context, ref){
    final input = ref.watch(inputProvider);
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
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
                          MinimizeWindowButton(colors: actionButtonColor,),
                          MaximizeWindowButton(colors: actionButtonColor,),
                          CloseWindowButton(colors: actionButtonColor,)
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child:  ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 600),
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                      const  Text(
                        'Whools Typing',
                        style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30
                        ),
                        textAlign: TextAlign.center,
                      ),
                      TextButton(onPressed: (){
                        launchWebApp("https://www.whools.xyz");
                      }, child:  Text("🌐 Whools Page", style: TextStyle(
                        color: Colors.grey.shade300, fontWeight: FontWeight.bold
                      ),))

                        ],
                      ),
                      const SizedBox(height: 25,),
                      width > 350 ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _wordNumbers(),
                          _wpeAndAcc(input),
                        ],
                      ) : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _wordNumbers(),
                          _wpeAndAcc(input),
                        ],
                      ),
                      const SizedBox(height: 15,),
                      const TypeCard(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  Text _wpeAndAcc(InputNotifier input){
    return Text(
      'WPM : ${input.wpm} / ACC: ${input.accuracy}',
      style: const TextStyle(fontSize: 16),
      textAlign: TextAlign.end,
    );
  }

  Row _wordNumbers(){
    return Row(
      children: [
        for(final wordsNumber in [10, 25, 50, 100]) ...{
          ChangeWordsText(wordsNumber),
          if(wordsNumber != 100)
          const Text("/", style: TextStyle(fontSize: 18),)
        }
      ],
    );
  }

}

Future<void> launchWebApp(String url)async{
  if(await canLaunch(url)){
    await launch(url);
  }else{
    throw 'Could not launch $url';
  }
}