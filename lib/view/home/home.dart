import 'package:demeter/bloc/base/bloc_providers.dart';
import 'package:demeter/bloc/home/home_bloc.dart';
import 'package:demeter/utils/navigator.dart';
import 'package:demeter/view/home/project_info.dart';
import 'package:flutter/material.dart';
import 'package:demeter/utils/widget_utils.dart';
import 'package:demeter/view/home/my_devices.dart';
import 'package:demeter/view/home/my_project.dart';

class HomePage extends StatefulWidget {
  static Widget instance() {
    return BlocProvider<HomeBloc>(
      child: HomePage(),
      bloc: HomeBloc(),
    );
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  TabController _tabController;
  HomeBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<HomeBloc>(context);
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return StreamBuilder<LayoutType>(
        stream: _bloc.layoutStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final type = snapshot.data;
            return Scaffold(
              backgroundColor: Colors.transparent,
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(scaleWidth(context, 95)),
                child: AppBar(
                  backgroundColor: Colors.transparent,
                  actions: <Widget>[
                    type != LayoutType.detail
                        ? _buildAddButton()
                        : _buildEditButton(),
                  ],
                  leading: type != LayoutType.detail
                      ? Container()
                      : Container(
                          width: scaleWidth(context, 32),
                          height: scaleWidth(context, 32),
                          margin: EdgeInsets.symmetric(
                            horizontal: scaleWidth(context, 12),
                            vertical: scaleWidth(context, 11),
                          ),
                          child: RaisedButton(
                            padding: EdgeInsets.zero,
                            child:
                                Icon(Icons.chevron_left, color: Colors.white),
                            color: Colors.grey.shade700,
                            shape: CircleBorder(),
                            onPressed: () {
                              _bloc.changeLayout(LayoutType.project);
                            },
                          ),
                        ),
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(scaleWidth(context, 41)),
                    child: Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(
                          horizontal: scaleWidth(context, 12)),
                      child: Text(
                        type != LayoutType.detail ? 'Home' : 'Tomato',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: scaleWidth(context, 35),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              body: type != LayoutType.detail ? _buildHome() : _buildDetail(),
            );
          }
          return Container();
        });
  }

  Widget _buildAddButton() {
    return Container(
      width: scaleWidth(context, 32),
      height: scaleWidth(context, 32),
      padding: EdgeInsets.zero,
      margin: EdgeInsets.symmetric(
        horizontal: scaleWidth(context, 12),
        vertical: scaleWidth(context, 11),
      ),
      child: RaisedButton(
        padding: EdgeInsets.zero,
        child: Icon(Icons.add, color: Colors.white),
        color: Colors.grey.shade700,
        shape: CircleBorder(),
        onPressed: () {
          _tabController.index == 0
              ? push(context, Router.add_device)
              : push(context, Router.add_project);
        },
      ),
    );
  }

  Widget _buildEditButton() {
    return Container(
      width: scaleWidth(context, 51),
      height: scaleWidth(context, 32),
      padding: EdgeInsets.zero,
      margin: EdgeInsets.symmetric(
        horizontal: scaleWidth(context, 12),
        vertical: scaleWidth(context, 11),
      ),
      child: RaisedButton(
        padding: EdgeInsets.zero,
        child: Text(
          'Edit',
          style: TextStyle(
            color: Colors.white,
            fontSize: scaleWidth(context, 16),
          ),
        ),
        color: Colors.grey.shade700,
        shape: StadiumBorder(),
        onPressed: () {
          push(context, Router.edit_project);
        },
      ),
    );
  }

  Widget _buildHome() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: scaleHeight(context, 36),
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: TabBar(
            controller: _tabController,
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.label,
            labelPadding: EdgeInsets.symmetric(horizontal: 6),
            tabs: <Widget>[
              Tab(
                child: Text(
                  'My Devices',
                  style: TextStyle(fontSize: scaleWidth(context, 16)),
                ),
              ),
              Tab(
                child: Text(
                  'My Projects',
                  style: TextStyle(fontSize: scaleWidth(context, 16)),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              MyDevice(),
              MyProject(parentBloc: _bloc),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDetail() {
    return Container(
      padding: EdgeInsets.all(scaleWidth(context, 12)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ProjectInfo(parentBloc: _bloc),
        ],
      ),
    );
  }
}
