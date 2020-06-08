import 'package:drawerbehavior/drawerbehavior.dart';
import 'package:drawerbehavior_example/menus/main.dart';
import 'package:flutter/material.dart';

class DrawerScaleIcon extends StatefulWidget {
  @override
  _DrawerScaleIconState createState() => _DrawerScaleIconState();
}

class _DrawerScaleIconState extends State<DrawerScaleIcon> {
  int selectedMenuItemId;

  @override
  void initState() {
    selectedMenuItemId = menuWithIcon.items[0].id;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DrawerScaffold(
      percentage: 0.6,
      appBar: AppBar(
          title: Text("Drawer - Scale with Icon"),
          actions: [IconButton(icon: Icon(Icons.add), onPressed: () {})]),
      drawers: [
        SideDrawer(
          menu: menuWithIcon,
          animation: true,
          color: Theme.of(context).primaryColor,
          selectedItemId: selectedMenuItemId,
          onMenuItemSelected: (itemId) {
            setState(() {
              selectedMenuItemId = itemId;
            });
          },
        )
      ],
      builder: (context, id) => IndexedStack(
        index: id,
        children: menu.items
            .map((e) => Center(
                  child: Text("Page~${e.title}"),
                ))
            .toList(),
      ),
    );
  }
}
