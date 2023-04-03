void ex1(){
  solution([3, 1, 2, 2]);
}
///
/// Existían 2 errores en la implementación de solution
///
/// El primero:
/// El valor inicial de small era 0, esto provocaba que si todos los valores de numbers
/// eran mayores que 0, small nunca cambiaría su valor y devolvería 0 como resultado a pesar de que 0
/// no se formaba parte de numbers
///
/// El segundo:
/// El el ciclo for el valor inicial de i era 1, lo cual provoca que nunca se revisara el valor numbers[0],
/// Si el elemento más pequeño era numbers[0] solution devolvería un resultado incorrecto
///
void solution(List<int> numbers){
  var small = 1000; ///Valor previo: small=0

  for (var i =0; i<numbers.length;i++){ ///Valor previo: i=0
    if(small > numbers[i]){
      small = numbers[i];
    }
  }

  print(small);
}


