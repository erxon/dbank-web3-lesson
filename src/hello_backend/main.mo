import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor {
  //Orthogonal persistence
  stable var currentValue : Float = 100;

  //Tracking Time
  var startTime = Time.now();

  public func topUp(amount : Float) {
    currentValue += amount;
    Debug.print(debug_show (currentValue));
  };

  public func withdraw(amount : Float) {
    let tempValue : Float = currentValue - amount;

    if (tempValue >= 0) {
      currentValue -= amount;
      Debug.print(debug_show (currentValue));
    } else {
      Debug.print("Invalid number");
    };
  };

  //Query function
  public query func checkBalance() : async Float {
    return currentValue;
  };

  //Compound Interest
  public func compoundInterest() {
    let currentTime = Time.now();
    let timeElapsedNS = currentTime - startTime;
    let timeElapsedS = timeElapsedNS / 1000000000;
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS));

    startTime := currentTime;
  };
};
