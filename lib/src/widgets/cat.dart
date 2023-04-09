import 'package:flutter/material.dart';

class Cat extends StatelessWidget {
  const Cat({super.key});

  @override
  build(context) {
    return Image.network('https://www.kindpng.com/picc/m/676-6767891_black-cat-head-clipart-hd-png-download.png');
  }
}