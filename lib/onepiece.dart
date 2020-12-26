import 'package:flutter/material.dart';
import 'package:reviewmanga/menupage.dart';

class OnePiece extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'ONEPIECE'),
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
                  'Onepiece',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                'Oda Eiichirō',
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
      '   วันพีซ (ญี่ปุ่น: ワンピース โรมาจิ: Wan Piesu ทับศัพท์: ในชื่ออังกฤษ One Piece)  '
      'เป็นการ์ตูนญี่ปุ่นเขียนโดย เออิจิโระ โอดะ เรื่องราวของการตามหา "วันพีซ"'
      'ดยผู้ที่ได้มาครอบครองจะได้เป็นจ้าวแห่งโจรสลัด  เริ่มลงตีพิมพ์ในนิตยสาร โชเน็นจัมป์'
      'ของสำนักพิมพ์ ชูเอฉะ ตั้งแต่ปี พ.ศ. 2540 และเนื่องจากความโด่งดัง '
      'วันพีซ จึงได้รับการดัดแปลงเป็น อนิเมะ นวนิยาย  รวมไปถึง เกม อีกหลายภาคด้วยกัน '
      '   วันพีซเป็นการ์ตูนที่ได้รับการตีพิมพ์ที่สุดในโลก โดยตีพิมพ์ไปมากกว่า 320 ล้านเล่มทั่วโลก'
      'ระหว่างปี พ.ศ. 2540 ถึง 2557  จุดเด่นของเรื่องนี้อยู่ที่การที่ผู้วาดได้สร้างสรรค์ความฝัน'
      'ซึ่งต้องการลอยพร้อมกับเหล่ามิตรแท้ในวัยเด็กของหลายๆ คนได้อย่างมีเสน่ห์ โดยระหว่างลอยนั้น '
      'ลูฟี่และผองเพื่อนต้องเจออุปสรรคในการพิสูจน์เพื่อนแท้มากมาย รวมทั้งได้เรียนรู้เรื่องราว'
      'และตำนานของบุคคลต่างๆ ที่ผ่านเข้ามาในเนื้อเรื่อง',
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
                const EdgeInsets.only(left: 110.0, right: 110.0, top: 25.0),
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
            'images/one-wano.jpg',
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
