import Debug "mo:base/Debug";

actor {
  var currentValue = 100;

  public func topUp(amount : Nat) {
    currentValue += amount;
    Debug.print(debug_show (currentValue));
  };

  public func withdraw(amount : Nat) {
    let tempValue : Int = currentValue - amount;

    if (tempValue >= 0) {
      currentValue -= amount;
      Debug.print(debug_show (currentValue));
    } else {
      Debug.print("Invalid number");
    };
  };

  //Query function
  public query func checkBalance() : async Nat{
    return currentValue;
  };


};
