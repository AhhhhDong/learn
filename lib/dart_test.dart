import 'dart:math';

//Main函数
//void main(){}
// List<String> args 用于接收控制台命令
//void main(List<String> args) {}
void main() {
  //var 关键字
  var bike = new Bicycle(1, 1);
  //可以省略"new"关键字
  Bicycle bike1 = Bicycle(1, 1);
  //常量
  final Bicycle bike2 = Bicycle(1, 1);
  //这里调用了get方法，注意是通过变量.方法名
  print("任何未赋值的变量，都为${bike.speed}");
  //这里调用了set方法,注意是直接变量.方法名 = x;
  bike.speed = 1;
  print(bike.speed);
  print(bike._speedPrivate);
  print(bike);

  var recatangle = Rectangle(1, origin: Point(1, 1), width: 1);
  recatangle.set(1, null, 1);
}

//构造函数
class Bicycle {
  int cadence, gear;

  //以"_"开头的变量为私有变量,任何未赋值的变量值都为null
  int _speedPrivate;

  //在dart中，普通变量不需要设置get/set方法
  int speedPublic;

//  传统写法
//  Bicycle(int cadence, int speed, int gear) {
//    this.cadence = cadence;
//    this.speed = speed;
//    this.gear = gear;
//  }
  //简写,可以没有方法体，必须有";"结尾
  Bicycle(this.cadence, this.gear);

  @override
  String toString() {
    return "Bicycle:$_speedPrivate mph";
  }

  //get关键字
  int get speed => _speedPrivate;

  //set关键字
  set speed(int value) {
    _speedPrivate = value;
  }
}

class Rectangle {
  int width;
  int height;
  Point origin;

  //{}中为可选命名参数 = 后面的是默认值
  Rectangle(
    this.height, {
    this.origin = const Point(0, 0),
    this.width = 0,
  });

  //可选位置参数
  void set(int height, [Point origin = const Point(0, 0), int width]) {
    this.height = height;
    this.origin = origin;
    this.width = width;
  }
}

//抽象类
abstract class Shape {
  //抽象方法，没有方法体
  num get area;

  void a() {}
}

//Flutter是没有interface的，但是Flutter中的每个类都是一个隐式的接口，这个接口包含类里的所有成员变量，以及定义的方法。
//如果有一个类 A,你想让类B拥有A的API，但又不想拥有A里的实现，那么你就应该把A当做接口，类B implements 类A.
class Circle1 implements Shape {
//如果使用implements 关键字，则必须重写父类的方法
  @override
  // TODO: implement area
  num get area => null;

  @override
  void a() {
    // TODO: implement a
  }
}

//使用extends 关键字，则无需重写父类方法，但是必须重写抽象方法
class Circle2 extends Shape {
  @override
  // TODO: implement area
  num get area => null;
}
//mixins，非继承
class Circle3 with Shape{
  @override
  // TODO: implement area
  num get area => null;
}
//on 关键字，用于限定，如果要mixin Shape1 必须先继承Shape或实现Shape接口
mixin Shape1 on Shape{

}
class Circle4 extends Shape with Shape1{
  @override
  // TODO: implement area
  num get area => null;
}

class Circle5 implements Shape {
  @override
  void a() {
    // TODO: implement a
  }

  @override
  // TODO: implement area
  num get area => null;

}



