import 'package:flutter/material.dart';
///product icon
///https://www.figma.com/file/esZIIKJ4Hb7I4at0WqUKx1/%D0%A1%D1%82%D0%BE%D0%BC%D0%B0%D1%82%D0%BE%D0%BB%D0%BE%D0%B3%D0%B8%D1%8F?node-id=3%3A5893
class ProductIcon extends StatelessWidget {
  final String productPath;

  const ProductIcon({Key key, this.productPath}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0, left: 16, bottom: 39),
      child: Container(
        width: 53,
        height: 53,
        decoration: new BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(14)),
        ),
        child: Container(
          // margin: EdgeInsets.all(8),
          width: 53,
          height: 53,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(14)),
            image: DecorationImage(
              image: NetworkImage(productPath),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
