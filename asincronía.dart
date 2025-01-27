import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

/// Ejecuta una función asíncrona que imprime información sobre su ejecución.
Future<void> ejecutarFuncionAsincrona(String nombre, int segundos) async {
  final inicio = DateTime.now();
  print("[$nombre] Iniciando: ${inicio.toIso8601String()}");
  print("[$nombre] Duración esperada: $segundos segundos.");

  // Simula un retraso
  await Future.delayed(Duration(seconds: segundos));

  final fin = DateTime.now();
  print("[$nombre] Finalizando: ${fin.toIso8601String()}");
  }

  Future<void> obtenerDatosRickAndMorty() async {
  // URL de la API de Rick and Morty
  const url = 'https://rickandmortyapi.com/api/character';

  try {
    // Realizar la solicitud GET
    final respuesta = await http.get(Uri.parse(url));

    // Comprobar el estado de la respuesta
    if (respuesta.statusCode == 200) {
      // Decodificar el cuerpo de la respuesta
      final datos = jsonDecode(respuesta.body);

      // Obtener y procesar la lista de personajes
      final personajes = datos['results'] as List;

      print('Personajes de Rick and Morty:');
      for (var personaje in personajes) {
        print('- ${personaje['name']} (${personaje['species']})');
      }
    } else {
      print('Error al obtener datos: ${respuesta.statusCode}');
    }
  } catch (e) {
    print('Error al conectar con la API: $e');
  }
}




void main() {
  // Ejecuta varias funciones asíncronas con diferentes parámetros
  print("Inicio del programa...");

  // Se ejecutan asíncronamente
  ejecutarFuncionAsincrona("Tarea 1", 3);
  ejecutarFuncionAsincrona("Tarea 2", 5);
  ejecutarFuncionAsincrona("Tarea 3", 2);

  print("Programa sigue ejecutándose mientras las tareas terminan...");

  print('Obteniendo datos de Rick and Morty...');
  obtenerDatosRickAndMorty();
}
