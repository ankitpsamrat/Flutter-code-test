import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AnimatedFloatingButton extends StatefulWidget {
  const AnimatedFloatingButton({super.key});

  @override
  State<AnimatedFloatingButton> createState() => _AnimatedFloatingButtonState();
}

class _AnimatedFloatingButtonState extends State<AnimatedFloatingButton> {
  final ScrollController _scrollController = ScrollController();
  bool _isScrolling = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (!_isScrolling) {
        setState(() {
          _isScrolling = true;
        });
      }
    } else if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      if (_isScrolling) {
        setState(() {
          _isScrolling = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Floating Button'),
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: 50,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Item $index'),
          );
        },
      ),
      floatingActionButton: Stack(
        alignment: Alignment.bottomRight,
        children: [
          AnimatedContainer(
            width: _isScrolling ? 230 : 0, // Shrink or expand width
            height: 45,
            duration: const Duration(milliseconds: 300),
            // alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(bottom: 5, right: 25),
            // padding: const EdgeInsets.only(left: 20),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.cyan,
              borderRadius: BorderRadius.circular(24),
            ),
            child: const Text(
              'Upload image to search',
              style: TextStyle(color: Colors.white),
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              // Your onPressed logic
            },
            child: const Icon(
              Icons.file_upload_outlined,
            ),
          ),
        ],
      ),
    );
  }
}
