void main() {

  // Asignación por valor
  int a = 10;
  int b = a; // Se copia el valor de a en b
  b = 20;

  print('a: $a'); // a sigue siendo 10
  print('b: $b'); // b es 20

  // Asignación por referencia
  List<int> list1 = [1, 2, 3];
  List<int> list2 = list1; // list2 apunta a la misma referencia que list1
  list2.add(4);

  print('list1: $list1'); // Ambos muestran [1, 2, 3, 4]
  print('list2: $list2');

  // Funciones con variables pasadas por valor
  int original = 10;
  modifyPrimitive(original);
  print('Outside function: $original'); // Muestra 10 (sin cambios)
}

void modifyPrimitive(int number) {
  number = 42; // Cambia solo la copia local
  print('Inside function: $number'); // Muestra 42
}
