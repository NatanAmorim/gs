import 'package:flutter/material.dart';

class TabBarTemplate extends StatefulWidget {
  const TabBarTemplate({
    Key? key,
    required this.controller,
    required this.tabs,
  }) : super(key: key);

  final TabController controller;
  final List<Tab> tabs;

  @override
  State<TabBarTemplate> createState() => _TabBarTemplateState();
}

class _TabBarTemplateState extends State<TabBarTemplate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFf0cac0).withOpacity(0.7),
      child: TabBar(
        controller: widget.controller,
        overlayColor:
            MaterialStateProperty.all(Colors.pinkAccent.withOpacity(0.2)),
        indicatorColor: Theme.of(context).colorScheme.primary,
        labelColor: Colors.black,
        unselectedLabelColor: Colors.black54,
        tabs: widget.tabs,
      ),
    );
  }
}
