import 'package:flutter/material.dart';

class MyDraggableImage extends StatefulWidget {
  const MyDraggableImage({Key? key}) : super(key: key);

  @override
  _MyDraggableImageState createState() => _MyDraggableImageState();
}

class _MyDraggableImageState extends State<MyDraggableImage> {
  bool _dragging = false;
  late Offset _position;

  @override
  void initState() {
    super.initState();
    _position = Offset.zero;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueAccent),
          ),
          child: DragTarget(
            onWillAccept: (data) => true,
            onAccept: (data) {
              setState(() {
                _dragging = false;
                _position = data as Offset;
              });
            },
            builder: (context, candidateData, rejectedData) {
              return Center(
                child: Text('Drop here'),
              );
            },
          ),
        ),
        SizedBox(height: 20),
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueAccent),
          ),
          child: _dragging
              ? Image.asset('assets/images/myPic.jpg', height: 200)
              : Draggable(
                  feedback: Image.asset('assets/images/myPic.jpg', height: 200),
                  onDragStarted: () {
                    setState(() {
                      _dragging = true;
                    });
                  },
                  onDragEnd: (details) {
                    setState(() {
                      _dragging = false;
                      _position = details.offset;
                    });
                  },
                  child: Image.asset('assets/images/myPic.jpg', height: 200),
                ),
        ),
      ],
    );
  }
}
