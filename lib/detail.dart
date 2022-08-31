import 'data.dart';
import 'rating_bar.dart';
import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  final Book book;

  Detail(this.book);

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      elevation: .5,
      title: Text('Design Books'),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.search,
          ),
          onPressed: () {
            print('hello');
          },
        ),
      ],
    );

    // book image and it's pages count widget

    final topLeft = Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16),
          child: Hero(
            tag: book.title,
            child: Material(
              elevation: 15,
              shadowColor: Colors.yellow.shade900,
              child: Image(
                image: AssetImage(book.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        text(
          '${book.pages} page',
          color: Colors.black38,
          size: 12,
        ),
      ],
    );

    // top right part

    final topRight = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        text(
          book.title,
          size: 16,
          isBold: true,
          padding: EdgeInsets.only(top: 16),
        ),
        text(
          'by ${book.writer}',
          color: Colors.black54,
          size: 12,
          padding: EdgeInsets.only(top: 8, bottom: 16),
        ),
        Row(
          children: <Widget>[
            text(
              '${book.price}',
              isBold: true,
              padding: EdgeInsets.only(right: 8),
            ),
            RatingBar(
              rating: book.rating,
            ),
          ],
        ),
        SizedBox(
          height: 32,
        ),
        MaterialButton(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          onPressed: () {},
          color: Colors.blue,
          minWidth: 160,
          child: Text(
            'BUY IT NOW',
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
            ),
          ),
        ),
      ],
    );

    // scrolling text description
    final bottomContent = Container(
      height: 220,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Text(
          '${book.description}',
          style: TextStyle(fontSize: 13, height: 1.5),
        ),
      ),
    );

    final topContent = Container(
      color: Theme.of(context).primaryColor,
      padding: EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(
            flex: 2,
            child: topLeft,
          ),
          Flexible(
            flex: 3,
            child: topRight,
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: Column(
        children: <Widget>[
          topContent,
          bottomContent,
        ],
      ),
    );
  }

  // create text widget

  text(
    String data, {
    Color color = Colors.black87,
    num size = 14,
    EdgeInsetsGeometry padding = EdgeInsets.zero,
    bool isBold = false,
  }) {
    return Padding(
      padding: padding,
      child: Text(
        data,
        style: TextStyle(
          color: color,
          fontSize: size.toDouble(),
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
