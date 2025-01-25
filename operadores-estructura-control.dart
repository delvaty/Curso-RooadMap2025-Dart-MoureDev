void main() {
  // Operadores aritméticos
  int a = 15, b = 4;
  print("Aritméticos");
  print("Suma: ${a + b}");
  print("Resta: ${a - b}");
  print("Multiplicación: ${a * b}");
  print("División: ${a / b}");
  print("División entera que ignora la parte decimal: ${a ~/ b}");
  print("División módulo, devuelve el resto o residuo: ${a % b}");

  // Operadores lógicos
  bool x = true, y = false;
  print("Lógicos");
  print("AND: ${x && y}");
  print("OR: ${x || y}");
  print("NOT: ${!x}");

  // Operadores de comparación
  print("Comparación");
  print("Igualdad: ${a == b}");
  print("Desigualdad: ${a != b}");
  print("Mayor que: ${a > b}");
  print("Menor que: ${a < b}");
  print("Mayor igual que: ${a >= b}");
  print("Menor igual que: ${a <= b}");

  // Operadores de asignación

  int c = 8;
  print("Asignación");
  print("Inicial: ${c}");
  c += 4;
  print("Suma y asigna: ${c}");
  c *= 3;
  print("Multiplica y asigna: ${c}");

  //Operadores de identidad
  print("Identidad");
  print("Idéntico: ${a == 15}");
  print("No idéntico: ${b != 15}");

  //Operadores de pertenencia
  var list = [1, 2, 3, 4];
  print(list.contains(2)); // true, porque 2 está en la lista
  print(list.contains(5)); // false, porque 5 no está en la lista

  var set = {10, 20, 30};
  print(set.contains(20)); // true
  print(set.contains(15)); // false

  var map = {'a': 1, 'b': 2, 'c': 3};
  print(map.containsKey('b')); // true, porque 'b' es una clave
  print(map.containsValue(3)); // true, porque 3 es un valor

  // Operadores de Bits
  print("Bits");
  print("AND binario: ${a & b}");
  print("OR binario: ${a | b}");
  print("XOR binario: ${a ^ b}");
  print("Desplazamiento izquierda: ${a << 1}");
  print("Desplazamiento derecha: ${a >> 1}");

  // Estructuras de Control: Condicionales
  print("Condicionales:");
  if (a > b) {
    print("a es mayor que b");
  } else {
    print("a no es mayor que b");
  }

  // Estructuras de Control: Iterativas
  print("Iterativas:");
  print("Bucle For:");
  for (int i = 0; i < 5; i++) {
    print("i: ${i}");
  }

  print("Bucle While:");
  int count = 0;
  while (count < 3) {
    print("count: ${count}");
    count++;
  }

  print("Bucle Do-While:");
  int num = 0;
  do {
    print("num: ${num}");
    num++;
  } while (num < 2);

  // Estructuras de Control: Excepciones
  print("Excepciones:");
  try {
    int result = a ~/ 0;
    print("Resultado: ${result}");
  } catch (e) {
    print("Error: División por cero");
  } finally {
    print("Bloque finally ejecutado");
  }

  // Dificultad extra
  var num1 =55;
  for (var i = 10; i <= num1; i++) {
    if(i % 2== 0 && i!=16 && !(i% 3==0)){
      
      print(i);
    }
  }

}
