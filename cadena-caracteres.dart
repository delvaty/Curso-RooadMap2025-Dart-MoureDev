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
    4: "Opción 4: Elimanción de contactos",
  };

  Map<String, int> contact = {
    'robertd': 56395232,
    'ana': 58471236,
    'héctor': 54887654,
    'isaney': 537886454
  };

  while (true) {
    // Mostrar menú
    print("\nMenú de opciones: ");
    option.forEach((number, description){
      print("${number}. ${description}");
    });

    // Pedir al usuario que elija una opción
    stdout.write("\nIntroduce el número de la opción que deseas: ");
    String? entries= stdin.readLineSync();

    //Valor de entrada
    if (entries == null || int.tryParse(entries)== null) {
      print("⚠️ Entrada inválida. Introduce un número válido.");
      continue;
    }

    int chooseOption= int.parse(entries);
    
    // Comprobar si existe la opción
    if (option.containsKey(chooseOption)) {
      print("\nHas seleccionado: ${option[chooseOption]}");
    }else{
      print("⚠️ Opción no válida. Intenta de nuevo.");
      continue;
    }

    // Lógica para cada opción
    switch (chooseOption) {
      case 1: // Búsqueda
        stdout.write("\nItroduce el nombre de contacto a buscar: ");
        String? nameSearch = stdin.readLineSync();
        if(nameSearch != null && contact.containsKey(nameSearch)){
          print("✅ Contacto encontrado: ${nameSearch} - ${contact[nameSearch]}");
        }else{
          print("❌ Contacto no encontrado.");
        }
        break;
        case 2: // Inserción
        stdout.write("\nIntroduce el nombre del nuevo contacto: ");
        String? newName = stdin.readLineSync();
        if(newName!= null && newName.isNotEmpty){
          if (contact.containsKey((newName))) {
            print("⚠️ El contacto ya existe");
          }else{
            stdout.write("\nIntroduce el número de teléfono del nuevo contacto: ");
            String? newPhone = stdin.readLineSync();
            if (newPhone != null && int.tryParse(newPhone) != null) {
              contact[newName] = int.parse(newPhone);
              print("✅ Contacto añadido: ${newName} - ${contact[newName]}");

            } else{
              print("⚠️ Número de teléfono inválido.");
            }
          }
        } else{
          print("⚠️ Nombre inválido.");
        }
        break;

        case 3: // Actualización
        stdout.write("\nIntroduce el nombre de contacto a actualizar: ");
        String? updateName= stdin.readLineSync();
        if(updateName != null && contact.containsValue(updateName) ){
          stdout.write("Introduce el nuevo número de teléfono: ");
          String? updatePhone= stdin.readLineSync();
          if (updatePhone != null && int.tryParse(updatePhone) != null) {
            contact[updateName] = int.parse(updatePhone);
            print("✅ Contacto actualizado: $updateName - ${contact[updateName]}");

          }else{
            print("⚠️ Número de teléfono inválido.");

          }
        }else{
          print("❌ Contacto no encontrado.");
        }
        break;

        case 4: // Eliminación
        stdout.write("\nEscribe el nombre de contacto a eliminar: ");
        String? deleteContact = stdin.readLineSync();
        if(deleteContact != null && contact.containsKey(deleteContact)){
          contact.remove(deleteContact);
        }else{
          print("❌ Contacto no encontrado.");
        }
        break;
      default:
      print("⚠️ Opción no válida.");
    }

  }






}
