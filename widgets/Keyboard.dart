import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:typing/words/Keyboards.dart';

class KeyBoard extends StatefulWidget {
  const KeyBoard({Key? key}) : super(key: key);

  @override
  State<KeyBoard> createState() => _KeyBoardState();
}

class _KeyBoardState extends State<KeyBoard> {
  String typedText = '';
  final AudioCache _audioCache = AudioCache();

  @override
  void initState() {
    super.initState();
    RawKeyboard.instance.addListener(_onKeyPressed);
  }

  @override
  void dispose() {
    RawKeyboard.instance.removeListener(_onKeyPressed);
    super.dispose();
  }

  void _onKeyPressed(RawKeyEvent event) {
    if (event is RawKeyDownEvent) {
      setState(() {
        final String? keyLabel = event.logicalKey.keyLabel;
        if (keyLabel != null && keyPressed.containsKey(keyLabel)) {
          typedText += keyLabel;
          keyPressed[keyLabel] = true;
          Future.delayed(Duration(milliseconds: 100), () {
            setState(() {
              keyPressed[keyLabel] = false;
            });
          });
        } else if (event.logicalKey == LogicalKeyboardKey.backspace) {
          if (typedText.isNotEmpty) {
            _playKeySound();
            setState(() {
              typedText = typedText.substring(0, typedText.length - 1);
            });
          }
        }
      });
    }
  }

  void _playKeySound() {
    _audioCache.load(
        'key_sound.mp3'); // Cambia 'key_sound.mp3' al nombre de tu archivo de sonido
  }

  void onKeyPressed(String value) {
    setState(() {
      typedText += value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildKeyBoard(),
      ],
    );
  }

  Widget buildKeyBoard() {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildKey('Q'),
              buildKey('W'),
              buildKey('E'),
              buildKey('R'),
              buildKey('T'),
              buildKey('Y'),
              buildKey('U'),
              buildKey('I'),
              buildKey('O'),
              buildKey('P'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildKey('A'),
              buildKey('S'),
              buildKey('D'),
              buildKey('F'),
              buildKey('G'),
              buildKey('H'),
              buildKey('J'),
              buildKey('K'),
              buildKey('L'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildKey('Z'),
              buildKey('X'),
              buildKey('C'),
              buildKey('V'),
              buildKey('B'),
              buildKey('N'),
              buildKey('M'),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildKey(String keyValue, {bool isSpecial = false}) {
    return GestureDetector(
      onTap: () {
        if (isSpecial && keyValue == 'DEL') {
          setState(() {
            typedText = typedText.isNotEmpty
                ? typedText.substring(0, typedText.length - 1)
                : '';
          });
        } else {
          setState(() {
            typedText += keyValue;
            if (keyPressed.containsKey(keyValue)) {
              keyPressed[keyValue] = true;
              Future.delayed(const Duration(milliseconds: 100), () {
                setState(() {
                  keyPressed[keyValue] = false;
                });
              });
            }
          });
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        margin: const EdgeInsets.all(5.0),
        padding: const EdgeInsets.all(15.0),
        color: (keyPressed[keyValue] ?? false)
            ? Colors.green
            : (isSpecial ? Colors.redAccent : Colors.transparent),
        child: Text(
          keyValue,
          style: const TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
