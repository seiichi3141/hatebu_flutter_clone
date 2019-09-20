import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final _titles = [
    '新着',
    '総合',
    '世の中',
    '政治と経済',
    '暮らし',
    '学び',
    'テクノロジー',
    'エンタメ',
    'アニメとゲーム',
    'おもしろ',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      drawer: _buildDrawer(),
      body: _buildBody(context),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      elevation: 0,
      title: const Text('ホーム'),
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildDrawer() {
    final children = [
      _buildDrawerHeader(),
      _buildDrawerMenu(Icons.home, 'ホーム', color: Colors.lightBlue[300]),
      _buildDrawerMenu(Icons.favorite, 'For You', color: Colors.red),
      _buildDrawerMenu(Icons.person, 'お気に入り'),
      _buildDrawerMenu(Icons.format_quote, '関心ワード'),
      const Divider(),
      _buildDrawerMenu(Icons.public, '世の中', color: Colors.brown[200]),
      _buildDrawerMenu(Icons.trending_up, '政治と経済', color: Colors.brown[200]),
      _buildDrawerMenu(Icons.home, '暮らし', color: Colors.green[300]),
      _buildDrawerMenu(Icons.school, '学び', color: Colors.green[300]),
      _buildDrawerMenu(Icons.desktop_windows, 'テクノロジー',
          color: Colors.lightBlue),
      _buildDrawerMenu(Icons.straighten, 'エンタメ', color: Colors.orange),
      _buildDrawerMenu(Icons.videogame_asset, 'アニメとゲーム', color: Colors.orange),
      _buildDrawerMenu(Icons.sentiment_very_satisfied, 'おもしろ',
          color: Colors.orange),
      const Divider(),
      _buildDrawerMenu(Icons.notifications, '通知'),
      _buildDrawerMenu(Icons.lightbulb_outline, '基本のTips'),
      _buildDrawerMenu(Icons.settings, '設定'),
    ];

    return Drawer(
      child: Scrollbar(
        child: ListView(
          padding: EdgeInsets.zero,
          children: children,
        ),
      ),
    );
  }

  Widget _buildDrawerHeader() {
    const padding = EdgeInsets.all(8);

    final children = <Widget>[];
    for (var i = 0; i < 3; i++) {
      children.add(
        Expanded(
          child: Padding(
            padding: padding,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: AspectRatio(
                aspectRatio: 1,
                child: Container(
                  height: 50,
                  color: Colors.primaries[i % 3],
                ),
              ),
            ),
          ),
        ),
      );
    }

    return DrawerHeader(
      padding: padding,
      child: Row(
        children: children,
      ),
    );
  }

  Widget _buildDrawerMenu(IconData iconData, String text, {Color color}) {
    const padding = EdgeInsets.symmetric(horizontal: 8, vertical: 6);

    return InkWell(
      onTap: () {},
      child: Padding(
        padding: padding,
        child: Row(
          children: [
            Padding(
              padding: padding,
              child: Icon(iconData, color: color != null ? color : Colors.grey),
            ),
            const SizedBox(width: 16),
            Padding(
              padding: padding,
              child: Text(text),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return DefaultTabController(
      length: _titles.length,
      initialIndex: 1,
      child: Column(children: [
        _buildTabBar(context),
        Expanded(child: _buildContent()),
      ]),
    );
  }

  Widget _buildTabBar(BuildContext context) {
    final tabs = <Tab>[];
    for (final title in _titles) {
      tabs.add(Tab(child: Text(title)));
    }

    return SizedBox(
      height: 48,
      child: Material(
        elevation: 2,
        color: Colors.grey[100],
        child: TabBar(
          isScrollable: true,
          tabs: tabs,
          labelColor: Colors.black45,
          unselectedLabelColor: Colors.black45,
          indicatorColor: Theme.of(context).primaryColor,
        ),
      ),
    );
  }

  Widget _buildContent() {
    final children = <Widget>[];
    for (final title in _titles) {
      children.add(Center(child: Text(title)));
    }

    return TabBarView(
      children: children,
    );
  }
}
