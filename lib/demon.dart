import 'package:flutter/material.dart';
import 'package:reviewmanga/menupage.dart';

class Demon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(title: 'DEMON SLAYER'),
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
                  'Demon slayer',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                'Koyo Haru Gotoke',
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
      '   คิเมะสึ โนะ ไยบะ (ญี่ปุ่น: 鬼滅の刃 โรมาจิ: Kimetsu no Yaiba) หรือ '
      'ในชื่อฉบับลิขสิทธิ์ภาษาไทย "ดาบพิฆาตอสูร" เป็นซีรีส์หนังสือการ์ตูนของประเทศญี่ปุ่น'
      'เขียนเรื่องโดย โคโยฮารุ โกโตเกะ เนื้อหากล่าวถึงคามาโดะ ทันจิโร่ เด็กหนุ่มผู้กลายเป็น'
      'นักล่าอสูรหลังหลังจากครอบครัวของตนถูกอสูรฆ่าตายทั้งหมด ยกเว้นเพียงน้องสาวที่ชื่อเนะซึโกะ'
      'ที่ได้กลายเป็นอสูรไป เขาจึงตั้งปณิธานว่าจะหาทางทำให้น้องสาวกลับมาเป็นมนุษย์ดังเดิมให้ได้ '
      'การ์ตูนชุดนี้เริ่มตีพิมพ์เป็นรายตอนในนิตยสารโชเน็งจัมป์รายสัปดาห์ มาตั้งแต่วันที่ 15 กุมภาพันธ์ พ.ศ. 2559 '
      'และสำนักพิมพ์ชูเอฉะได้จัดพิมพ์ในรูปแบบหนังสือการ์ตูนรวมเล่ม (ทังโคบง) แล้ว จำนวน 19 เล่ม '
      'ณ เดือนกุมภาพันธ์ พ.ศ. 2563 และจัดจำหน่ายในประเทศไทย โดยสำนักพิมพ์สยามอินเตอร์คอมิกส์',
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
                const EdgeInsets.only(left: 110.0, right: 110.0, top: 30.0),
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
            'images/demon-slayer.jpg',
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
