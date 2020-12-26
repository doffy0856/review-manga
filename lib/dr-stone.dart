import 'package:flutter/material.dart';
import 'package:reviewmanga/menupage.dart';

class Stone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: MyHomePage(title: 'DR.STONE'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  Widget titleSection = Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: [
        Expanded(
          /*1*/
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*2*/
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  'Dr.Stone',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                'Riichiro Inagaki',
                style: TextStyle(
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
        ),
        /*3*/
        FavoriteWidget(),
      ],
    ),
  );

  Widget textSection = Container(
    padding: const EdgeInsets.all(32),
    child: Text(
      '   นักเรียนมัธยมโอกิ ไทจุบอกกับอิชิงามิ เซ็นคูเพื่อนผู้รักวิทยาศาสตร์ว่าตนจะไปสารภาพรักกับโองาวะ'
      'ยุสึริฮะเพื่อนร่วมชั้น ไทจุเตรียมการจะสารภาพรักกับยุสึริฮะที่ใต้ต้นการบูรในสนามโรงเรียน '
      'แต่ความพยายามของไทจุก็ถูกขัดจังหวะด้วยแสงประหลาดบนท้องฟ้า ไทจุผลักยุสึริฮะไปยังต้นไม้เพื่อปกป้องเธอ'
      'ในขณะที่แสงได้ทำให้พวกเขากลายเป็นหินไปพร้อมกับประชากรมนุษย์ทั้งหมด 3,700 ปีต่อมาหลังการกลายเป็นหิน '
      'เซ็นคูและไทจุได้กลับคืนสภาพเดิมจากการกลายเป็นหินมาอยู่ในโลกในยุคที่พวกเขาเรียกว่าโลกยุคหิน'
      'เซ็นคูค้นพบว่าการกลายเป็นหินสามารถรักษาได้ด้วยไนตอล และตั้งใจจะฟื้นฟูอารยธรรมขึ้นใหม่'
      'พร้อมด้วยความช่วยเหลือจากไทจุ พวกเขาตั้งใจจะคืนสภาพให้ยุสึริฮะเป็นคนแรก แต่เมื่อพวกเขาถูกโจมตีโดยฝูงสิงโต'
      'จึงจำเป็นต้องคืนสภาพให้กับชิชิโอะ สึคาสะที่เป็นนักศิลปะการต่อสู้ ก่อนจะคืนสภาพให้ยุสึริฮะได้สำเร็จในภายหลัง',
      softWrap: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    Widget backpage = Container(
      child:
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        Expanded(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 110.0, right: 110.0, top: 10.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MenuPage()));
              },
              child: new Container(
                  alignment: Alignment.center,
                  height: 60.0,
                  decoration: new BoxDecoration(
                      color: Color(0xFFDF513B),
                      borderRadius: new BorderRadius.circular(9.0)),
                  child: new Text("Back",
                      style:
                          new TextStyle(fontSize: 20.0, color: Colors.white))),
            ),
          ),
        ),
      ]),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          Image.asset(
            'images/stone.jpg',
            width: 600,
            height: 240,
            fit: BoxFit.cover,
          ),
          titleSection,
          textSection,
          backpage
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = false;
  int _favoriteCount = 0;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 5;
        _isFavorited = false;
      } else {
        _favoriteCount += 5;
        _isFavorited = true;
      }
    });
  }

  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            padding: EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (_isFavorited ? Icon(Icons.star) : Icon(Icons.star_border)),
            color: Colors.orange[500],
            onPressed: _toggleFavorite,
          ),
        ),
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            padding: EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (_isFavorited ? Icon(Icons.star) : Icon(Icons.star_border)),
            color: Colors.orange[500],
            onPressed: _toggleFavorite,
          ),
        ),
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            padding: EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (_isFavorited ? Icon(Icons.star) : Icon(Icons.star_border)),
            color: Colors.orange[500],
            onPressed: _toggleFavorite,
          ),
        ),
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            padding: EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (_isFavorited ? Icon(Icons.star) : Icon(Icons.star_border)),
            color: Colors.orange[500],
            onPressed: _toggleFavorite,
          ),
        ),
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            padding: EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (_isFavorited ? Icon(Icons.star) : Icon(Icons.star_border)),
            color: Colors.orange[500],
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 18,
          child: Container(
            child: Text('$_favoriteCount'),
          ),
        ),
      ],
    );
  }
  // ···
}
