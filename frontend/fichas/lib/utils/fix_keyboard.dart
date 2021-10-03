import 'package:flutter/services.dart';

class FixKeyboard {
  static String fixAccent(String value) {
    String newValue = value
        // A
        .replaceAll('´´a', 'á')
        .replaceAll('``a', 'à')
        .replaceAll('^^a', 'â')
        .replaceAll('~~a', 'ã')
        .replaceAll('´´A', 'Á')
        .replaceAll('``A', 'À')
        .replaceAll('^^A', 'Â')
        .replaceAll('~~A', 'Ã')
        // E
        .replaceAll('´´e', 'é')
        .replaceAll('``e', 'è')
        .replaceAll('^^e', 'ê')
        .replaceAll('´´E', 'É')
        .replaceAll('``E', 'È')
        .replaceAll('^^E', 'Ê')
        // I
        .replaceAll('´´i', 'í')
        .replaceAll('``i', 'ì')
        .replaceAll('^^i', 'î')
        .replaceAll('´´I', 'Í')
        .replaceAll('``I', 'Ì')
        .replaceAll('^^I', 'î')
        // O
        .replaceAll('´´o', 'ó')
        .replaceAll('``o', 'ò')
        .replaceAll('^^o', 'ô')
        .replaceAll('~~o', 'õ')
        .replaceAll('´´O', 'Ó')
        .replaceAll('``O', 'Ò')
        .replaceAll('^^O', 'Ô')
        .replaceAll('~~O', 'Õ')
        // U
        .replaceAll('´´u', 'ú')
        .replaceAll('``u', 'ù')
        .replaceAll('^^u', 'û')
        .replaceAll('´´U', 'Ú')
        .replaceAll('``U', 'Ù')
        .replaceAll('^^U', 'Û');
    return newValue;
  }
}

class FixKeyBoardFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    int pos = oldValue.selection.start;
    newValue = TextEditingValue(text: FixKeyboard.fixAccent(oldValue.text));
    pos -= (oldValue.text.length - newValue.text.length);
    if (pos > newValue.text.length) {
      pos = newValue.text.length;
    }
    return TextEditingValue(
      text: newValue.text,
      selection: TextSelection.fromPosition(TextPosition(offset: pos)),
    );
  }
}
