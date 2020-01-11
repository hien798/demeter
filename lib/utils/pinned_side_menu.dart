import 'package:flutter/material.dart';

class PinnedSideMenu extends StatefulWidget {
  final TabController controller;
  final List<String> titles;
  final Color selectedColor;
  final Color unselectedColor;
  final TextStyle selectedStyle;
  final TextStyle unselectedStyle;
  final double borderRadius;
  final double leftSpace;
  final double itemHeight;

  PinnedSideMenu({
    Key key,
    this.controller,
    @required this.titles,
    this.selectedColor = const Color(0xffeeeeee),
    this.unselectedColor = const Color(0xffffffff),
    this.selectedStyle = const TextStyle(color: Color(0xff000000)),
    this.unselectedStyle = const TextStyle(color: Color(0xff333333)),
    this.borderRadius = 8.0,
    this.leftSpace = 16.0,
    this.itemHeight = 70.0,
  })  : assert(titles != null && titles.isNotEmpty),
        super(key: key);

  @override
  _PinnedSideMenuState createState() => _PinnedSideMenuState();
}

class _PinnedSideMenuState extends State<PinnedSideMenu> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    if (widget.controller != null) {
      _selectedIndex = widget.controller.index;
      widget.controller.addListener(() {
        if (_selectedIndex != widget.controller.index) {
          // TODO change index
          setState(() {
            _selectedIndex = widget.controller.index;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius:
          BorderRadius.horizontal(right: Radius.circular(widget.borderRadius)),
      child: Stack(
        children: <Widget>[
          Row(
            // background
            children: <Widget>[
              Container(width: widget.leftSpace, color: widget.selectedColor),
              Expanded(
                child: Container(color: widget.unselectedColor),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              SizedBox(width: widget.leftSpace),
              Expanded(
                child: ListView.builder(
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    bool isSelected = index == _selectedIndex;
                    BorderRadius borderRadius = BorderRadius.zero;
                    if (isSelected) {
                      borderRadius = BorderRadius.horizontal(
                          right: Radius.circular(widget.borderRadius));
                    } else {
                      if (index == _selectedIndex - 1) {
                        // border bottom left
                        borderRadius = BorderRadius.only(
                            bottomLeft: Radius.circular(widget.borderRadius));
                      }
                      if (index == _selectedIndex + 1) {
                        // border bottom left
                        borderRadius = BorderRadius.only(
                            topLeft: Radius.circular(widget.borderRadius));
                      }
                    }
                    return Container(
                      height: widget.itemHeight,
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: !isSelected
                            ? widget.selectedColor
                            : widget.unselectedColor,
                      ),
                      child: Container(
                        height: widget.itemHeight,
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          borderRadius: borderRadius,
                          color: isSelected
                              ? widget.selectedColor
                              : widget.unselectedColor,
                        ),
                        child: InkWell(
                          onTap: () {
                            if (widget.controller != null) {
                              widget.controller.animateTo(index);
                            } else {
                              setState(() {
                                _selectedIndex = index;
                              });
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              widget.titles[index],
                              style: isSelected
                                  ? widget.selectedStyle
                                  : widget.unselectedStyle,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: widget.titles.length,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
