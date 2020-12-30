# Welcome

This simple package exposes the state of Flutter Expansion tile and makes it controllable with ExpansionTileController.

## Example 

Collapsing and expanding the tile with FAB.

![](https://github.com/MilosKarakas/controllable_expansion_tile/blob/master/expansion.gif)


### Code used in gif example

```dart
import 'package:flutter/material.dart';
import 'package:controllable_expansion_tile/controllable_expansion_tile.dart';
import 'package:controllable_expansion_tile/expansion_tile_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ControllableExpansionTile Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'ControllableExpansionTile Demo'),
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

  ExpansionTileController _controller = ExpansionTileController();
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ControllableExpansionTile(
              expansionTileController: _controller,
              title: Text('Example Tile'),
              onExpansionChanged: (expanded) {
                setState(() {
                  _isExpanded = expanded;
                });
              } ,
              children: [
                ListTile(
                  title: Text("Child One"),  
                ),

                ListTile(
                  title: Text("Child Two")
                )
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_isExpanded) {
            _controller.collapse();
          } else {
            _controller.expand();
          }
        },
        tooltip: _isExpanded ? "Collapse" : "Expand",
        child: Icon(Icons.add),
      ),
    );
  }
}
```