/* https://dart.dev/language */
// Comentario de una línea
/* Comentario de varias líneas */
/// Comentarios múltiples de una sola línea

void main() {
  var var1 = 3;
  const var2 = "Esto es un cadena de texto";

  // Datos primitivos
  String myVariable = "Hello Dart";
  var myVariable1 = "Este es otra cadena de texto";
  bool isBoolean = true;
  int myInt = 5456;
  double myDouble = 654.4;
  String? name = "Mi cadena de texto opcional nulleable";
  name = null;
  final myFinal = "Mi propiedad final";
  const myConst = "Valor constante que no cambia";
  final myFinal1 = myConst;
  var language = "Dart";
  List<String> myList = ["¡Hola, bienvenido al lenguaje de programación Dart!"];
  dynamic dynamicType; // Puede ser de cualquier tipo

  // Formas de usar una variable
  // Formas de usar variable
  print(myVariable);
  print('Concatenacion:' + myVariable);
  print('Interpolación: $myVariable');
  print(myList);
  print("¡Hola ${language}!");

  late String
      description; // declaración costosa en algunos casos ya que si no se llama en algún lugar esa variable nunca se ejecuta lo que se le asignó

  description = 'Feijoada!';
  print(description); // en este caso si se llama a esta variable
}
