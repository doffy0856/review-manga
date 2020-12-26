import 'package:flutter/material.dart';
import 'package:reviewmanga/menupage.dart';

class Kintama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: MyHomePage(title: 'KINTAMA'),
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
                  'Kintama',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                'Sorachi Hideaki',
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
      '   กินทามะ (ญี่ปุ่น: 銀魂 โรมาจิ: Gintama ทับศัพท์: กินตะมะ, "จิตวิญญาณสีเงิน")'
      'เป็นการ์ตูนญี่ปุ่น เขียนโดย ฮิเดอากิ โซราจิ เริ่มลงตีพิมพ์ในนิตยสารโชเน็งจัมป์รายสัปดาห์'
      'ของสำนักพิมพ์ชูเอฉะ ตั้งแต่วันที่ 8 ธันวาคม พ.ศ. 2546 ได้รับการจัดพิมพ์รวมเล่ม'
      'เป็นหนังสือการ์ตูนมาแล้ว 77 เล่ม เป็นเรื่องราวเกี่ยวกับซากาตะ กินโทกิ อดีตซามูไร'
      'ที่ทำอาชีพรับจ้างอิสระพร้อมด้วยชิมูระ ชินปาจิและคางุระ เพื่อหาเงินมาเลี้ยงชีพ  '
      'ในยุคที่ซามูไรตกต่ำเนื่องจากการรุกรานของมนุษย์ต่างดาว  เนื้อเรื่องเป็นการผสมผสาน'
      'ระหว่างแนวย้อนยุค และแนววิทยาศาสตร์ ลักษณะแนวเรื่องเป็นแนวตลกและต่อสู้',
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
                const EdgeInsets.only(left: 110.0, right: 110.0, top: 50.0),
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
            'images/kintama.jpeg',
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
        _favoriteCount -= 3;
        _isFavorited = false;
      } else {
        _favoriteCount += 3;
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
