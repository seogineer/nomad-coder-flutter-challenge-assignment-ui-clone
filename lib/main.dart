import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  String getDay() {
    return DateTime.now().day.toString();
  }

  String getWeekDay() {
    const List<String> WEEKS = [
      'SUNDAY',
      'MONDAY',
      'TUESDAY',
      'WEDNESDAY',
      'THURSDAY',
      'FRIDAY',
      'SATURDAY',
    ];
    return WEEKS[DateTime.now().weekday];
  }

  List<Widget> getDays() {
    var now = DateTime.now();
    var lastDay = DateTime(now.year, now.month + 1, 0).day;
    List<Widget> days = [];
    for (int i = now.day + 1; i <= lastDay; i++) {
      days.add(Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Text(
          i.toString(),
          style: const TextStyle(
            fontSize: 40,
            color: Colors.white38,
          ),
        ),
      ));
    }
    return days;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white12,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.account_circle_rounded,
                      size: 70,
                      color: Colors.white60,
                    ),
                    Icon(
                      Icons.add,
                      size: 50,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Text(
                      '${getWeekDay()} ${getDay()}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      const Text(
                        'TODAY',
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        '  ●  ',
                        style: TextStyle(color: Colors.purple),
                      ),
                      Row(
                        children: getDays(),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Column(
                children: [
                  Button(
                    title: 'DESIGN MEETING',
                    coworkers: ['ALEX', 'HELENA', 'NANA'],
                    startMonth: '11',
                    startDay: '30',
                    endMonth: '12',
                    endDay: '20',
                    bgColor: Colors.lime,
                  ),
                  Button(
                    title: 'DAILY PROJECT',
                    coworkers: [
                      'ME',
                      'RECHARD',
                      'CIRY',
                      'LYNN',
                      'NICO',
                      'DOBI',
                      'DECO'
                    ],
                    startMonth: '12',
                    startDay: '35',
                    endMonth: '14',
                    endDay: '10',
                    bgColor: Color.fromRGBO(149, 117, 205, 1),
                  ),
                  Button(
                      title: 'WEEKLY PLANNING',
                      coworkers: ['DEN', 'NANA', 'MARK'],
                      startMonth: '15',
                      startDay: '00',
                      endMonth: '16',
                      endDay: '30',
                      bgColor: Colors.lightGreen),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  final String title;
  final List<String> coworkers;
  final String startMonth;
  final String startDay;
  final String endMonth;
  final String endDay;
  final Color bgColor;

  const Button({
    super.key,
    required this.title,
    required this.coworkers,
    required this.startMonth,
    required this.startDay,
    required this.endMonth,
    required this.endDay,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 7),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(35),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Text(
                        startMonth,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        startDay,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 6, bottom: 2),
                    child: Row(
                      children: [
                        Text(
                          '⏐',
                          style: TextStyle(fontSize: 25),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        endMonth,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        endDay,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 300,
                        height: 150,
                        child: Text(
                          title,
                          style: const TextStyle(
                              fontSize: 53, fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: coworkerBuilder(coworkers),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> coworkerBuilder(List<String> coworkers) {
    List<Widget> list = [];
    for (int i = 0; i < 3; i++) {
      if (this.coworkers[i] == 'ME') {
        list.add(Padding(
          padding: const EdgeInsets.only(right: 30),
          child: Text(
            this.coworkers[i],
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
        continue;
      }
      list.add(Padding(
        padding: const EdgeInsets.only(right: 30),
        child: Text(
          this.coworkers[i],
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black54,
          ),
        ),
      ));
    }
    if (this.coworkers.length > 3) {
      list.add(Padding(
        padding: const EdgeInsets.only(right: 30),
        child: Text(
          '+${this.coworkers.length - 3}',
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black54,
          ),
        ),
      ));
    }
    return list;
  }
}
