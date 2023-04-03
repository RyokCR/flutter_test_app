


void ex2(){
  Map<String, String> map1 = {'Input.txt': 'Randy', 'Code.py': 'Stan', 'Output.txt': 'Randy'};
  var map2 = groupByOwners(map1);
}

///
/// groupByOwners crea un Map<String, List<String>>
/// Itera por cada par (key, value) que existe en mapEntry y se realizan los siguientes pasos:
/// 1: Si value existe como llave en groupByOwners entonces ya hay guardado al menos 1 file de este dueño
/// Por tanto se agrega el file (key) a la lista
/// 2: Si value no existe como llave en groupByOwners entonces es la primera vez que se encuentra este dueño
/// Por tanto se agrega un nuevo par (value, [key]) que representa el dueño con su primer file
///
Map groupByOwners(Map<String, String> mapEntry){
  Map<String, List<String>> groupByOwnersMap = <String, List<String>>{};
  mapEntry.forEach((key, value) {
    if(groupByOwnersMap.containsKey(value)){
      groupByOwnersMap[value]?.add(key);
    }else{
      groupByOwnersMap.putIfAbsent(value, () => [key]);
    }
  });
  return groupByOwnersMap;

}