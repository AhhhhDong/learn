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
