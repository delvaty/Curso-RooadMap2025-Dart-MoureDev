import 'dart:io';

void main() {
  // Acceso a caracteres específicos
  String texto = "Hola Mundo";
  print(texto[0]); // H (primer carácter)
  print(texto[5]); // M (sexto carácter)

  // Longitud de cadena
  String text = "Hello World";
  print(text.length); //10

  // Subcadenas
  String text1 = "Esto es un texto";
  print(text1.substring(0, 4)); // "Esto" (del índice 0 al 3)
  print(text1.substring(5)); // "es un texto" (del índice 5 hasta el final)

  //Concatenación
  String gretting = "Hola";
  String place = "Mundo";
  print(gretting + " " + place); // "Hola Mundo";
  print("${gretting} ${place}"); // "Hola Mundo" (interpolación)

  // Repetición
  String language = "Dart";
  print(language * 3); // "Dart Dart Dart"

  // Recorrido
  String word = "Hola";
  for (var char in word.runes) {
    print(String.fromCharCode(char)); // Imprime H, o, l, a en líneas separadas
  }

  // Conversión a mayúsculas y minúsculas
  String word1 = "Hola Mundo";
  print(word1.toUpperCase()); // "HOLA MUNDO"
  print(word1.toLowerCase()); // "hola mundo"

  // Reemplazo
  String text2 = "Hola mundo";
  print(text2.replaceAll("o", "O")); // "HOla MundO"
  print(text2.replaceFirst("o", "O")); // "HOla Mundo"

  // División
  String language1 = "Dart es increíble";
  List<String> palabras = language1.split(" ");
  print(palabras); // ["Dart", "es", "increíble"]

  // Unión 
  List<String> word2 = ["Dart", "es", "genial"];
  print(word2.join(" ")); // "Dart es genial"

  // Interpolación
  String lenguaje = "Dart";
  int version = 3;
  print("Estoy aprendiendo $lenguaje versión $version");

  // Verificaciones
  // Verifica si empieza o termina con algo
  String word3 = "Hola Mundo";
  print(word3.startsWith("Hola")); // true
  print(word3.endsWith("Mundo")); // true

  // Contiene un valor
  String texto1 = "Hola Mundo";
  print(texto1.contains("Mundo")); // true

  // Comparaciones
 String texto3 = "Hola";
  String texto4 = "hola";
  print(texto3 == texto4);                // false
  print(texto3.compareTo(texto4));       // Resultado < 0 (mayúsculas vienen primero)
  print(texto3.toLowerCase() == texto4.toLowerCase()); // true

  //Eliminación de espacios
  String text5 = "   Hola Mundo   ";
  print(text5.trim());      // "Hola Mundo"
  print(text5.trimLeft());  // "Hola Mundo   "
  print(text5.trimRight()); // "   Hola Mundo"

  // Conversión
  //  Convertir a lista de caracteres:
  String texto5 = "Hola";
  print(texto5.split("")); // ["H", "o", "l", "a"]

  // Convertir números o valores
  int numero = 123;
  String texto6 = numero.toString();
  print(texto6); // "123"

  // Operaciones Unicode
  String wor4 = "Hola";
  print(wor4.codeUnits); // [72, 111, 108, 97] (códigos Unicode)

  // Validaciones de cadena
  String text6 = "";
  print(text6.isEmpty); // true
  print(text6.isNotEmpty); // false

  // Dificultad extra
  // Entrada de dos palabras
  stdout.write("\nIntroduce la primera palabra: ");
  String? palabra1 = stdin.readLineSync()!.toLowerCase();
  stdout.write("\nIntroduce la segunda palabra: ");
  String? palabra2 = stdin.readLineSync()!.toLowerCase();
  
  // Comprobaciones para la primera palabra
  print("\nAnálisis de la primera palabra: '$palabra1'");
  print("¿Es palíndromo? ${esPalindromo(palabra1)}");
  print("¿Es isograma? ${esIsograma(palabra1)}");

  // Comprobaciones para la segunda palabra
  print("\nAnálisis de la segunda palabra: '$palabra2'");
  print("¿Es palíndromo? ${esPalindromo(palabra2)}");
  print("¿Es isograma? ${esIsograma(palabra2)}");
  
  // Comprobación de anagrama entre las dos palabras
  print("\n¿Son anagramas? ${esAnagrama(palabra1, palabra2)}");


}

bool esPalindromo(String palabra) {
  // Comprobar si la palabra es igual a su reverso
  return palabra == palabra.split('').reversed.join('');
}

bool esAnagrama(String palabra1, String palabra2) {
  // Comprobar si las dos palabras tienen las mismas letras, aunque en diferente orden
  List<String> list1 = palabra1.split('').toList()..sort();
  List<String> list2 = palabra2.split('').toList()..sort();
  return list1.join('') == list2.join('');
}

bool esIsograma(String palabra) {
  // Comprobar si la palabra no tiene letras repetidas
  Set<String> caracteres = {};
  for (var char in palabra.split('')) {
    if (caracteres.contains(char)) {
      return false; // Si se encuentra un carácter repetido, no es un isograma
    }
    caracteres.add(char);
  }
  return true;
}
