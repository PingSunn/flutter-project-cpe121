import 'package:flutter/material.dart';

class PictureList extends StatefulWidget {
  final Image image;
  const PictureList({Key? key,required this.image}) : super(key: key);

  @override
  State<PictureList> createState() => _PictureListState();
}

class _PictureListState extends State<PictureList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Table(children: [
                TableRow(
                  children: [
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Center(child: Text("")),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Center(
                            child: widget.image),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Center(
                            child: widget.image),
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          ],
        ));
  }
}
