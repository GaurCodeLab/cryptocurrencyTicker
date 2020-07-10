import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class HomePage extends StatefulWidget {
  List listof;

  HomePage(this.listof);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _scrollController = ScrollController();

  _scrollToBottom() {
    _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      appBar: AppBar(
        title: Center(
          child: Text("Crypto Ticker"),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: AnimationLimiter(
        child: ListView(
          children: <Widget>[
            Center(
              child: Text(
                "Trending Cryptcurrencies",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.white70),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              margin: EdgeInsets.all(7.0),
              child: AnimationLimiter(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (BuildContext c, int index) {
                      return AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 375),
                        child: SlideAnimation(
                          horizontalOffset: 50.0,
                          child: FadeInAnimation(
                            child: Container(
                              width: 300.0,
                              child: Card(
                                color: Colors.blueGrey[600],
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0)),
                                elevation: 7.0,
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.only(top: 15.0),
                                      child: CircleAvatar(
                                        radius: 30.0,
                                        backgroundColor: Colors.greenAccent,
                                        child: double.parse(widget.listof[index]
                                                    ['rank']) <=
                                                10
                                            ? Text(
                                                widget.listof[index]['symbol'],
                                                style: TextStyle(
                                                    color: Colors.black),
                                              )
                                            : null,
                                      ),
                                    ),
                                    SizedBox(height: 8.0),
                                    Container(
                                      child: Text(
                                        "1 ${widget.listof[index]['symbol']} = \$${double.parse(widget.listof[index]['price']).toStringAsFixed(2)}",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    Center(
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            left: 50.0, top: 10.0),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                              child: Column(
                                                children: <Widget>[
                                                  Text(
                                                    "MarketCap",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  SizedBox(
                                                    height: 5.0,
                                                  ),
                                                  Container(
                                                    child: Row(
                                                      children: <Widget>[
                                                        double.parse(widget.listof[
                                                                            index]
                                                                        ['7d'][
                                                                    'market_cap_change_pct']) <
                                                                0
                                                            ? Icon(
                                                                Icons
                                                                    .trending_down,
                                                                color:
                                                                    Colors.red,
                                                              )
                                                            : Icon(
                                                                Icons
                                                                    .trending_up,
                                                                color: Colors
                                                                    .greenAccent,
                                                              ),
                                                        SizedBox(
                                                          width: 5.0,
                                                        ),
                                                        Text(
                                                          "${double.parse(widget.listof[index]['7d']['market_cap_change_pct']).toStringAsFixed(2)}%",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white70),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10.0,
                                            ),
                                            Container(
                                              width: 1.0,
                                              height: 35.0,
                                              color: Colors.tealAccent,
                                            ),
                                            SizedBox(
                                              width: 10.0,
                                            ),
                                            Container(
                                              child: Column(
                                                children: <Widget>[
                                                  Text(
                                                    "VolumeChange",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  SizedBox(
                                                    height: 5.0,
                                                  ),
                                                  Container(
                                                    child: Row(
                                                      children: <Widget>[
                                                        Text(
                                                          "${double.parse(widget.listof[index]['7d']['volume_change_pct']).toStringAsFixed(2)}%",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white70),
                                                        ),
                                                        SizedBox(
                                                          width: 5.0,
                                                        ),
                                                        double.parse(widget.listof[
                                                                            index]
                                                                        ['7d'][
                                                                    'volume_change_pct']) <
                                                                0
                                                            ? Icon(
                                                                Icons
                                                                    .trending_down,
                                                                color:
                                                                    Colors.red,
                                                              )
                                                            : Icon(
                                                                Icons
                                                                    .trending_up,
                                                                color: Colors
                                                                    .greenAccent,
                                                              ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.8,
              margin: EdgeInsets.all(7.0),
              child: AnimationLimiter(
                child: ListView.builder(
                    itemCount:
                        widget.listof.length == null ? 0 : widget.listof.length,
                    itemBuilder: (BuildContext c, int index) {
                      return AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 375),
                        child: SlideAnimation(
                          verticalOffset: 50.0,
                          child: FadeInAnimation(
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                              elevation: 10.0,
                              child: Container(
                                padding: EdgeInsets.all(15.0),
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          CircleAvatar(
                                            radius: 30.0,
                                            child: Text(
                                              widget.listof[index]["symbol"],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 7.0,
                                          ),
                                          Text(
                                            widget.listof[index]['name'],
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(10.0),
                                      child: Column(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "Current Price : \$${double.parse(widget.listof[index]['price']).toStringAsFixed(3)} ",
                                              textAlign: TextAlign.start,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: <Widget>[
                                                widget.listof[index]['7d'] ==
                                                        null
                                                    ? Text(" Wk Chng : NA")
                                                    : Text(
                                                        "Wk chng : ${double.parse(widget.listof[index]['7d']['price_change_pct']).toStringAsFixed(3)}%"
                                                            .toString()),
                                                widget.listof[index]['7d'] !=
                                                        null
                                                    ? double.parse(widget
                                                                        .listof[
                                                                    index]['7d']
                                                                [
                                                                'price_change_pct']) <
                                                            0
                                                        ? Icon(
                                                            Icons
                                                                .arrow_drop_down,
                                                            color: Colors.red,
                                                            size: 35,
                                                          )
                                                        : Icon(
                                                            Icons.arrow_drop_up,
                                                            color: Colors.green,
                                                            size: 35,
                                                          )
                                                    : Icon(
                                                        Icons.error_outline,
                                                        color: Colors.red,
                                                      )
                                              ],
                                            ),
                                          ),
                                          Row(
                                            children: <Widget>[
                                              widget.listof[index]['30d'] ==
                                                      null
                                                  ? Text("Mnth chng : NA")
                                                  : Text(
                                                      "Mnth chng : ${double.parse(widget.listof[index]['30d']['price_change_pct']).toStringAsFixed(3)}%"
                                                          .toString()),
                                              widget.listof[index]['30d'] !=
                                                      null
                                                  ? double.parse(widget.listof[
                                                                  index]['30d'][
                                                              'price_change_pct']) <
                                                          0
                                                      ? Icon(
                                                          Icons.arrow_drop_down,
                                                          color: Colors.red,
                                                          size: 35,
                                                        )
                                                      : Icon(
                                                          Icons.arrow_drop_up,
                                                          color: Colors.green,
                                                          size: 35,
                                                        )
                                                  : Icon(
                                                      Icons.error_outline,
                                                      color: Colors.red,
                                                    )
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
