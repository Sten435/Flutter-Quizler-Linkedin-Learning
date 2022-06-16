void main() {
  // Car myNormalCar = Car();

  // print(myNormalCar.numberOfSeats);

  // myNormalCar.drive();

  // ElectricCar myTesla = ElectricCar();

  // myTesla.drive();

  // myTesla.recharege();

  // LevitatingCar mylev = LevitatingCar();

  // mylev.drive();

  SelfDrivingCar mySelf = SelfDrivingCar("Wetterenstraat 1 Gent");

  mySelf.drive();
}

class Car {
  int numberOfSeats = 5;

  void drive() {
    print('Car is driving.');
  }
}

class ElectricCar extends Car {
  int batteryLevel = 100;

  void recharege() {
    batteryLevel = 100;
  }
}

class LevitatingCar extends Car {
  @override
  void drive() {
    print('floating');
  }
}

class SelfDrivingCar extends Car {
  String destination;

  SelfDrivingCar(String userDestination) {
    destination = userDestination;
  }

  @override
  void drive() {
    super.drive();

    print('sterring towards $destination');
  }
}
