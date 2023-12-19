import 'package:flutter/material.dart';

class AnimatedSearchBar extends StatefulWidget {
  const AnimatedSearchBar({Key? key}) : super(key: key);

  @override
  State<AnimatedSearchBar> createState() => _AnimatedSearchBarState();
}

class _AnimatedSearchBarState extends State<AnimatedSearchBar> {
  bool _toggle = true;

  void _doToggle() => setState(() => _toggle = !_toggle);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Stack(
          children: [
            GestureDetector(
              onTap: _doToggle,
              child: Icon(
                Icons.search,
                size: 24.0,
              ),
            ),
            AnimatedContainer(
              width: _toggle ? 0 : MediaQuery.of(context).size.width,
              transform: Matrix4.translationValues(
                _toggle ? MediaQuery.of(context).size.width : 0,
                0,
                0,
              ),
              duration: const Duration(milliseconds: 200),
              height: kToolbarHeight * 0.8,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(
                  width: 1,
                  color: Colors.grey[600]!,
                ),
              ),
              child: TextField(
                textInputAction: TextInputAction.search,
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: AnimatedOpacity(
                    duration: const Duration(seconds: 1),
                    opacity: _toggle ? 0 : 1,
                    child: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: _doToggle,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
