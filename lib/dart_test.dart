import 'dart:math';
import 'package:quiver/strings.dart';

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
  num x;

  //抽象方法，没有方法体
  num get area;

  void a() {}
}

//Flutter是没有interface的，但是Flutter中的每个类都是一个隐式的接口，这个接口包含类里的所有成员变量，以及定义的方法。
//如果有一个类 A,你想让类B拥有A的API，但又不想拥有A里的实现，那么你就应该把A当做接口，类B implements 类A.
class Circle1 implements Shape {
//如果使用implements 关键字，则必须重写父类的方法和变量
  @override
  num get area => null;

  @override
  void a() {}

  //这里变量也是需要覆写的
  @override
  num x;
}

//使用extends 关键字，则无需重写父类方法，但是必须重写抽象方法
class Circle2 extends Shape {
  @override
  // TODO: implement area
  num get area => null;
}

//mixins，非继承
class Circle3 with Shape {
  @override
  // TODO: implement area
  num get area => null;
}

//on 关键字，用于限定，如果要mixin Shape1 必须先继承Shape或实现Shape接口
mixin Shape1 on Shape {}

class Circle4 extends Shape with Shape1 {
  @override
  // TODO: implement area
  num get area => null;
}

//工厂模式,允许在最外层作用域实现一个工厂方法
Shape shapeFactory(int type) {
  if (type == 1) return Circle1();
  if (type == 2) return Circle2();
  throw "can\'t create";
}

//工厂模式在抽象类中通过factory 关键字增加一个工厂模式的构造方法
abstract class Shape2 {
  //工厂模式的构造方法
  factory Shape2(int type) {
    return null;
  }
}

//这里可以用*代表length个a
String scream(int length) => "A${'a' * length}h";

printScream() {
  const List<int> values = [1, 2, 3, 5, 6];
  for (int i = 0; i < values.length; i++) {
    int length = values[i];
    //这里可以直接把函数传入
    print(scream(length));
    var shape1 = shapeFactory(1);
    var shape2 = Shape2(1);
    //方法联级调用 ..
    shape1..a()..a();
  }
  //使用for in
  for (var length in values) {
    print(scream(length));
  }
  //使用lambda
  values.map(scream).forEach(print);
}

//在dart中，if中只有参数为bool并且true，才为true
//false
bool a = (null);
//false
bool a1 = (printScream());

void checkStringNull(String s) {
  if (s?.isNotEmpty) {
    print("string is not empty");
  }
  if (!s?.isNotEmpty) {
    print("string si Empty");
  }
  //1
  ((x, y) => x == null ? y : x)(1, 2);
  //当x = null 则为2 ，否则为1
  int x = null;
  int y = 2;
  //当x为null 则 z = y ，否则z = x;
  var z = x ?? y;
  //当z 等于null 则，把z赋值为1
  z ??= 1;

  //补充
  //这类三个单引号或者双引号包裹的字符串，里面可以换行
  const helloWorld = """hello 
  World""";

  //字符串和字符串之间自动拼接,需要注意的是，两个字符串中间不能加一个空字符串
  const strAdd = "fasf" "fsf";
//  const strAdd = "fasf""""fsf";这里会报错

  //字符串前面加r 可以使字符串中的\不再转义
  const nextLine = r"换行符:\n";

  //函数闭包
  Subtract subtract(int a) {
    return (int b) => a - b;
  }

  void subtractTest() {
    final x = subtract(5);
    print(x(3));
  }

  //函数别名
  int subtract1(int a, int b) => a - b;
  typeDefTest() {
    var test = subtract1(1, 2);
    print(test is Function);
    print(test is Add);
  }
}

//函数别名，必须申明在类外面。。。吗？
typedef int Add(int a, int b);
typedef int Subtract(int a);
