import Debug "mo:base/Debug";

actor {
  var currentValue = 100;

  public func topUp(amount: Nat){
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  public func withdraw(amount: Nat){
    currentValue -= amount;
    Debug.print(debug_show(currentValue));
  };
};
