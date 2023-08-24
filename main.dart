import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

String getFullName(String firstName, String lastName){
  return firstName+' ' + lastName;
}

String getFullNameLambda(String firstName, String lastName) => '$firstName $lastName';
class chapter6Cat{
  final String name;
  chapter6Cat(this.name);
}

class chapter6Person{
  final String firstName;
  final String lastName;
  chapter6Person(this.firstName,this.lastName);
}

extension FullName on chapter6Person{
  String get fullName => '$firstName $lastName';
}

Future <int> something (int a){
  return Future.delayed(const Duration(seconds: 3), () => a*2);
}

extension Run on chapter6Cat{
  void run(){
    print("Cat $name is running");
  }
}

Stream<String>getNameStream(){
  return Stream.periodic(const Duration(seconds: 1), (value){
    return 'Foo';
  });
}

Iterable<int>getTwoThree() sync*{
  //return [1, 2, 3];
  yield 1;
  yield 2;
  yield 3;
}

void chapter7() async{
  print("7777777777777777777777777777");
  final meow = chapter6Cat('Fluffers');
  print(meow.name);
  meow.run();

  final foo = chapter6Person("AAA", "lastName");
  print(foo.fullName);
  final stm = await something(2); // because the delay in something we need to wit, the await indicates that the chapter7 function should be async
  print(stm);
  /*await for (final value in getNameStream()){
    print(value);
  }
  print('Stream finished working');*/
  for (final value in getTwoThree()){
    print(value);
  }
}


class LivingThing {
  void breath(){
    print("huh");
  }

  void move(){
    print("GO!!!");
  }
}

class Cat extends LivingThing{
  final String name;

  Cat(this.name);

  void meow(){
    print("meow");
  }

  @override
  bool operator ==  (covariant Cat other) => other.name == name;

  @override
  int get hashCode => name.hashCode;
}

class chapter6Class {
  final String name;
  chapter6Class(this.name);
  void printName(){
    print(name);
  }

}

void chapter6(){
  print("66666666666666666666666666");

  final foo = chapter6Class('Foo Bar 6');
  print(foo.name);
  //enum PersonProperties {firstName, lastName, age};
  //print(PersonProperties.firstName )

  final fluffer = Cat("macska1");
  final fluffer2 = Cat("macska2");
  fluffer.move();
  fluffer.meow();

  if(fluffer == fluffer2) {
    print("Cat 1 = cat2");
  } else {
    print("not eq!!!");
  }
}

void chapter5(){
  print("5555555555555555555555555555");
  // ? mean that can be null too
  int? age = 20;
  age = null;
  if(age == 20) print('20');

  List<String?>? myList = ["Foo", "Bar", null]; // a list what can be null and its elements also can be null

  const String? firstName = null;
  const String? middleName = "bar";
  const String? lastName = "nulla";

  const firstNonNullValue = firstName ?? middleName ?? lastName;
  print(firstNonNullValue);

  String? realLastName = lastName;
  realLastName ??= middleName; //Called also null-aware assignment. This operator assigns value to the variable on its left, only if that variable is currently null
  print(realLastName);

  print("***************");


}

void chapter4(){
  var myMap = {
    'age': 20,
    'name': 'Foo',
  };

  print(myMap);
  myMap.clear();
  print(myMap);

  print("*******************");

  final names  = ['a', 'b', 'c', 'd', 'e'];
  final listLength = names.length;
  print(listLength);
  names.add('Bela');
  print(names.length);

  print("************");

  var mySet = {'foo', 'bar'};
  print(mySet);
  mySet.add('foo');
  print(mySet);

  final name = 'Foo';
  if( name == 'Foo'){
    print('Yes');
  } else {
    print("no");
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    chapter4();
    chapter5();
    chapter6();
    chapter7();

    print(getFullName('Foo','Bar'));

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
