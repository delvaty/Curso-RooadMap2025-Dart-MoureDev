void main() {
  void PrintString() {
    print("Hello World");
  }

  int sum(int a, int b) {
    return a + b;
  }

  int substract(int a, int b) {
    return a - b;
  }

  String global = "Esto es global";

  void main(List<int> args) {
    // Variable local
    String local = "esto es local";

    // Función anidada
    void function_External() {
      void function_Internal() {
        print("Esto es una función interna");
      }

      print("Esto es una función externa");
      function_Internal();
    }

    function_External();

    PrintString();
    print(sum(5, 4));
    print(substract(5, 4));
    print(global);
    print(local);
  }

  /* String a= "fizz";
  String b= "buzz"; */

  int result(String a, String b) {
    int count = 0;
    for (var i = 1; i <= 100; i++) {
      if (i % 3 == 0 && i % 5 == 0) {
        print(a + b);
      } else if (i % 3 == 0) {
        print(a);
      } else if (i % 5 == 0) {
        print(b);
      } else {
        print(i);
        count++;
      }
    }
    return count;
  }
  print(result("Fizz", "Buzz"));
}
