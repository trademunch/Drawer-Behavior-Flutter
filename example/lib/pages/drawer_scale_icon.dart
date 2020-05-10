import 'package:drawerbehavior/drawerbehavior.dart';
import 'package:flutter/material.dart';

class DrawerScaleIcon extends StatefulWidget {
  @override
  _DrawerScaleIconState createState() => _DrawerScaleIconState();
}

class _DrawerScaleIconState extends State<DrawerScaleIcon> {
  final menu = new Menu(
    items: [
      new MenuItem(
        id: 'restaurant',
        title: 'THE PADDOCK',
        icon: Icons.fastfood,
      ),
      new MenuItem(
        id: 'other1',
        title: 'THE HERO',
        icon: Icons.person,
      ),
      new MenuItem(
        id: 'other2',
        title: 'HELP US GROW',
        icon: Icons.terrain,
      ),
      new MenuItem(
        id: 'other3',
        title: 'SETTINGS',
        icon: Icons.settings,
      ),
    ],
  );

  var selectedMenuItemId = 'restaurant';
  var _widget = Text("1");

  @override
  Widget build(BuildContext context) {
    return new DrawerScaffold(
        extendedBody: true,
        percentage: 0.6,
        floatingActionButton: FloatingActionButton(),
//        bottomNavigationBar: BottomNavigationBar(items: null),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBarProps(
            title: Text("Drawer - Scale with Icon"),
            actions: [IconButton(icon: Icon(Icons.add), onPressed: () {})]),
        menuView: new MenuView(
          menu: menu,
          animation: true,
          color: Theme.of(context).primaryColor,
          selectedItemId: selectedMenuItemId,
          onMenuItemSelected: (String itemId) {
            selectedMenuItemId = itemId;
            if (itemId == 'restaurant') {
              setState(() => _widget = Text("1"));
            } else {
              setState(() => _widget = Text("default"));
            }
          },
        ),
        contentView: Screen(
          contentBuilder: (context) => LayoutBuilder(
            builder: (context, constraint) => GestureDetector(
              child: Container(
                color: Colors.white,
                width: constraint.maxWidth,
                height: constraint.maxHeight,
                child: Center(child: _widget),
              ),
              onTap: () {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text("Clicked"),
                  duration: Duration(seconds: 3),
                ));
              },
            ),
          ),
          color: Colors.white,
        ));
  }
}
