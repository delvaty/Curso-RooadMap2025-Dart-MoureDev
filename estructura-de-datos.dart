import 'dart:collection';
import 'dart:io';

void main() {
  // Creación de una lista
  List<int> numeros = [4, 2, 8, 1];

  // Inserción
  numeros.add(6); // Agrega el número 6
  numeros.insert(2, 5); // Agrega en la posición 2(index) de la lista el #5

  // Actualización
  numeros[0] = 10; // agrega en la posición 0 el #10

  // Borrado
  numeros.remove(8); // elimina el elemento 8
  numeros.removeAt(1); // elimina el # de la posición 1, en este caso es el #2

  // Ordenación
  numeros.sort(); // Ordena los números

  print('Lista: $numeros'); // Salida: Lista: [1, 5, 6, 10]

  // Creación de un conjunto
  Set<String> frutas = {
    'manzana',
    'pera',
    'naranja'
  }; //Coleciión de elementos únicos que no permite duplicados

  // Inserción
  frutas.add('uva');
  frutas.add('pera'); // No se duplicará

  // Borrado
  frutas.remove('naranja');

  // Actualización (eliminamos y volvemos a insertar)
  frutas.remove('pera');
  frutas.add('plátano');

  // Ordenación (convertimos el Set a List temporalmente)
  List<String> frutasOrdenadas = frutas.toList()
    ..sort(); // frutas.toList() convierte el Set en una lista(List). Ess necesario porque un Set no tiene orden explícito pero una lista sí lo tiene
  // ..sort() se usa el operador en cascacda que permite ejecutar un método en un mismo objeto. El método sort() ordena en forma ascendente

  print('Set original: $frutas'); // Salida: {manzana, uva, plátano}
  print('Set ordenado: $frutasOrdenadas'); // Salida: [manzana, plátano, uva]

  // Creación de un mapa
  Map<String, int> stock = {
    'manzana': 10,
    'pera': 15,
    'naranja': 8,
  };

  // Inserción
  stock['uva'] = 20;

  // Actualización
  stock['manzana'] = 5;

  // Borrado
  stock.remove('naranja');

  // Ordenación (por claves)
  var stockOrdenado = Map.fromEntries(
      stock.entries.toList()..sort((a, b) => a.key.compareTo(b.key)));

  print('Mapa original: $stock'); // Salida: {manzana: 5, pera: 15, uva: 20}
  print(
      'Mapa ordenado: $stockOrdenado'); // Salida: {manzana: 5, pera: 15, uva: 20}

  // Creación de una cola
  Queue<String> cola = Queue();

  // Inserción
  cola.add('Elemento 1');
  cola.addFirst('Elemento 0'); // Inserta al inicio
  cola.addLast('Elemento 2'); // Inserta al final

  // Actualización (no hay acceso directo, se necesita eliminar y reinsertar)
  cola.remove('Elemento 0');
  cola.addFirst('Nuevo Elemento 0');

  // Borrado
  cola.removeFirst(); // Elimina el primer elemento
  cola.removeLast(); // Elimina el último elemento

  print('Cola: $cola'); // Salida: Cola: (Elemento 1)



  // Creación de un rango utilizando Iterable
  Iterable<int> rango = Iterable.generate(5, (index) => index + 1);

  // Conversión a List para realizar operaciones
  List<int> listaRango = rango.toList();

  // Inserción
  listaRango.add(6);

  // Borrado
  listaRango.remove(3);

  // Actualización
  listaRango[0] = 10;

  // Ordenación
  listaRango.sort();

  print('Iterable: $listaRango'); // Salida: [2, 4, 5, 6, 10]

  // Dificultad extra
  // Opciones disponibles en el menú
  Map<int, String> option = {
    1: "Opción 1: Búsqueda",
    2: "Opción 2: Inserción",
    3: "Opción 3: Actualización",
    4: "Opción 4: Eliminación de contactos",
    5: "Salir del programa",
  };

  Map<String, int> contact = {
    'robertd': 56395232,
    'ana': 58471236,
    'héctor': 54887654,
    'isaney': 537886454,
  };

  while (true) {
    printMenu(option);
    int? chooseOption = getUserOption(option.keys);

    if (chooseOption == null) {
      print("⚠️ Opción no válida. Intenta de nuevo.");
      continue;
    }

    switch (chooseOption) {
      case 1:
        searchContact(contact);
        break;
      case 2:
        addContact(contact);
        break;
      case 3:
        updateContact(contact);
        break;
      case 4:
        deleteContact(contact);
        break;
      case 5: 
        print("👋 Gracias por usar el programa. ¡Hasta pronto!");
        exit(0); // Finaliza la ejecución del programa
      default:
        print("⚠️ Opción no válida.");
    }
  }
}

void printMenu(Map<int, String> options) {
  print("\nMenú de opciones:");
  options.forEach((key, value) {
    print("$key. $value");
  });
}

int? getUserOption(Iterable<int> validOptions) {
  stdout.write("\nIntroduce el número de la opción que deseas: ");
  String? input = stdin.readLineSync();

  if (input == null || int.tryParse(input) == null) {
    return null;
  }

  int option = int.parse(input);
  return validOptions.contains(option) ? option : null;
}

void searchContact(Map<String, int> contact) {
  stdout.write("\nIntroduce el nombre del contacto a buscar: ");
  String? name = stdin.readLineSync();

  if (name != null && contact.containsKey(name)) {
    print("✅ Contacto encontrado: $name - ${contact[name]}");
  } else {
    print("❌ Contacto no encontrado.");
  }
}

void addContact(Map<String, int> contact) {
  stdout.write("\nIntroduce el nombre del nuevo contacto: ");
  String? name = stdin.readLineSync();

  if (name == null || name.isEmpty) {
    print("⚠️ Nombre inválido.");
    return;
  }

  if (contact.containsKey(name)) {
    print("⚠️ El contacto ya existe.");
    return;
  }

  stdout.write("\nIntroduce el número de teléfono del nuevo contacto: ");
  String? phoneInput = stdin.readLineSync();

  if (phoneInput == null || int.tryParse(phoneInput) == null) {
    print("⚠️ Número de teléfono inválido.");
    return;
  }

  int phone = int.parse(phoneInput);
  contact[name] = phone;
  print("✅ Contacto añadido: $name - $phone");
}

void updateContact(Map<String, int> contact) {
  stdout.write("\nIntroduce el nombre del contacto a actualizar: ");
  String? name = stdin.readLineSync();

  if (name == null || !contact.containsKey(name)) {
    print("❌ Contacto no encontrado.");
    return;
  }

  stdout.write("\nIntroduce el nuevo número de teléfono: ");
  String? phoneInput = stdin.readLineSync();

  if (phoneInput == null || int.tryParse(phoneInput) == null) {
    print("⚠️ Número de teléfono inválido.");
    return;
  }

  int phone = int.parse(phoneInput);
  contact[name] = phone;
  print("✅ Contacto actualizado: $name - $phone");
}

void deleteContact(Map<String, int> contact) {
  stdout.write("\nIntroduce el nombre del contacto a eliminar: ");
  String? name = stdin.readLineSync();

  if (name != null && contact.containsKey(name)) {
    contact.remove(name);
    print("✅ Contacto eliminado: $name");
  } else {
    print("❌ Contacto no encontrado.");
  }






}
