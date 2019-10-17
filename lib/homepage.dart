import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'data.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<charts.Series<Pollution, String>> _seriesData;
  List<charts.Series<Task, String>> _seriesPieData;
  List<charts.Series<Sales, int>> _seriesLineData;

  @override
  void initState() {
    super.initState();
    _seriesData = List<charts.Series<Pollution, String>>();
    _seriesPieData = List<charts.Series<Task, String>>();
    _seriesLineData = List<charts.Series<Sales, int>>();
    _generateData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff1976d2),
            title: Text('Charts'),
            bottom: TabBar(
              indicatorColor: Color(0xff9962D0),
              tabs: [
                Tab(
                  icon: Icon(FontAwesomeIcons.solidChartBar),
                ),
                Tab(icon: Icon(FontAwesomeIcons.chartPie)),
                Tab(icon: Icon(FontAwesomeIcons.chartLine)),
              ],
            ),
          ),
          body: TabBarView(children: [
            Container(),
            Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Time spent on daily tasks',
                        style: TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Expanded(
                        child: charts.PieChart(
                          _seriesPieData,
                          animate: true,
                          animationDuration: Duration(seconds: 1),
                          behaviors: [
                            charts.DatumLegend(
                                outsideJustification:
                                    charts.OutsideJustification.end,
                                horizontalFirst: false,
                                desiredMaxRows: 2,
                                cellPadding:
                                    EdgeInsets.only(right: 20, bottom: 4),
                                entryTextStyle: charts.TextStyleSpec(
                                  color: charts
                                      .MaterialPalette.indigo.shadeDefault,
                                  fontFamily: 'Georgia',
                                  fontSize: 11,
                                ))
                          ],
                          defaultRenderer: charts.ArcRendererConfig(
                              arcWidth: 100,
                              arcRendererDecorators: [
                                charts.ArcLabelDecorator(
                                    labelPosition:
                                        charts.ArcLabelPosition.inside)
                              ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(),
          ]),
        ),
      ),
    );
  }

  void _generateData() {
    _seriesPieData.add(
      charts.Series(
          data: piedata,
          domainFn: (task, i) => task.task,
          measureFn: (task, i) => task.taskvalue,
          colorFn: (task, i) => charts.ColorUtil.fromDartColor(task.colorval),
          id: 'Daily Task',
          labelAccessorFn: (Task row, i) => '${row.taskvalue}'),
    );
  }
}
