import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todos/todos_app_core/todos_app_core.dart';
import 'package:flutter_todos/models/models.dart';

class TabSelector extends StatelessWidget {
  final AppTab activeTab;
  final Function(AppTab) onTabSelected;

  TabSelector({
    Key key,
    @required this.activeTab,
    @required this.onTabSelected,
  }) : super(key: key);

  IconData getIconData(AppTab tab) {
    if (tab == AppTab.todos) {
      return Icons.list;
    } else if (tab == AppTab.stats) {
      return Icons.show_chart;
    } else {
      return Icons.person;
    }
  }

  Key getKey(AppTab tab) {
    if (tab == AppTab.todos) {
      return ArchSampleKeys.todoTab;
    } else if (tab == AppTab.stats) {
      return ArchSampleKeys.statsTab;
    } else {
      return ArchSampleKeys.profileTab;
    }
  }

  String getString(AppTab tab, BuildContext context) {
    if (tab == AppTab.todos) {
      return ArchSampleLocalizations.of(context).todos;
    } else if (tab == AppTab.stats) {
      return ArchSampleLocalizations.of(context).stats;
    } else {
      return ArchSampleLocalizations.of(context).profile;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      key: ArchSampleKeys.tabs,
      currentIndex: AppTab.values.indexOf(activeTab),
      onTap: (index) => onTabSelected(AppTab.values[index]),
      items: AppTab.values.map((tab) {
        return BottomNavigationBarItem(
          icon: Icon(getIconData(tab), key: getKey(tab)),
          title: Text(getString(tab, context)),
        );
      }).toList(),
    );
  }
}
