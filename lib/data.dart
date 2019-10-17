import 'dart:ui';

var data1 = [
  new Pollution(1980, 'USA', 30),
  new Pollution(1980, 'Asia', 40),
  new Pollution(1980, 'Europe', 10),
];
var data2 = [
  new Pollution(1985, 'USA', 100),
  new Pollution(1980, 'Asia', 150),
  new Pollution(1985, 'Europe', 80),
];
var data3 = [
  new Pollution(1985, 'USA', 200),
  new Pollution(1980, 'Asia', 300),
  new Pollution(1985, 'Europe', 180),
];

var piedata = [
  new Task('Work', 35.8, Color(0xff3366cc)),
  new Task('Eat', 8.3, Color(0xff990099)),
  new Task('Commute', 10.8, Color(0xff109618)),
  new Task('TV', 15.6, Color(0xfffdbe19)),
  new Task('Sleep', 19.2, Color(0xffff9900)),
  new Task('Other', 10.3, Color(0xffdc3912)),
];

var linesalesdata = [
  new Sales(0, 45),
  new Sales(1, 56),
  new Sales(2, 55),
  new Sales(3, 60),
  new Sales(4, 61),
  new Sales(5, 70),
];
var linesalesdata1 = [
  new Sales(0, 35),
  new Sales(1, 46),
  new Sales(2, 45),
  new Sales(3, 50),
  new Sales(4, 51),
  new Sales(5, 60),
];

var linesalesdata2 = [
  new Sales(0, 20),
  new Sales(1, 24),
  new Sales(2, 25),
  new Sales(3, 40),
  new Sales(4, 45),
  new Sales(5, 60),
];

class Pollution {
  String place;
  int year;
  int quantity;

  Pollution(this.year, this.place, this.quantity);
}

class Task {
  String task;
  double taskvalue;
  Color colorval;

  Task(this.task, this.taskvalue, this.colorval);
}

class Sales {
  int yearval;
  int salesval;

  Sales(this.yearval, this.salesval);
}
