//Implementación Clase Abstracta
abstract class SmartDevice{
  String id = "";
  String brand = "";

  
  SmartDevice(this.id, this.brand);
  
  void initializeSystem();
}


//Implementacion de Mixins
mixin ConnectToWifi{
  void connect(String network, String password){
    print("Conectado a la red WIFI: $network");
  }
}

mixin GPS{
  void getLocation(){
    print("Obteniendo ubicacion de GPS");
  }
}

mixin BatteryManager{
  int batteryLevel = 100;
  
  void showBatteryLevel(){
    print("Nivel de bateria: $batteryLevel%");
  }
}

mixin Camera{
  void takePhoto(String brand) => print("Tomando foto desde $brand");
}

mixin Diagnostic{
  void runDiagnostic() => print("Ejecutando diagnóstico del sistema");
}






//Implementación de Clases con extends y con mixins
class Drone extends SmartDevice with ConnectToWifi, GPS, Camera, BatteryManager{
  Drone(String id, String brand) : super(id, brand);
  
  @override
  void initializeSystem(){
    print("Inicializando motores y sensores del Drone $id $brand");
  }
}


class SmartWatch extends SmartDevice with ConnectToWifi, BatteryManager, Diagnostic{
  SmartWatch (String id, String brand) : super(id, brand);
  
  @override
  void initializeSystem(){
    print("Inicializando sensores biométricos de $id $brand");
  }
}






//Creación de clase abstracta para utilzar implements
abstract class Cleaner {
  void startClean();
}


//Implementacion de clases con extends, implements y mixins
class RobotCleaner extends SmartDevice with BatteryManager, Diagnostic implements Cleaner{
  RobotCleaner(String id, String brand): super (id, brand);
  
  @override
  void initializeSystem(){
    print("Inicializando sistema de limpieza de $id $brand");
  }
  
  @override
  void startClean(){
    print("Robot limpiando la casa");
  }
}





void main() {
  Drone drone = Drone("DR-01", "DJI");
  drone.initializeSystem();
  drone.connect("Tecnar", "12345678");
  drone.getLocation();
  drone.takePhoto(drone.brand);
  drone.showBatteryLevel();
  
  
  print("\n----------------");

  SmartWatch watch = SmartWatch("SW-10", "Samsung");
  watch.initializeSystem();
  watch.runDiagnostic();
  watch.showBatteryLevel();

  print("\n----------------");

  RobotCleaner robot = RobotCleaner("RC-99", "Xiaomi");
  robot.initializeSystem();
  robot.startClean();
  robot.runDiagnostic();
  
  

}
