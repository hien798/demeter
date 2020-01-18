import 'package:demeter/bloc/base/base_bloc.dart';
import 'package:flutter/material.dart';

class BlocProvider<T extends BaseBloc> extends StatefulWidget {
  final Widget child;
  final T bloc;
  final BlocBuilder builder;

  BlocProvider({Key key, @required this.child, this.bloc, this.builder})
      : super(key: key);

  @override
  BlocProviderState<T> createState() => BlocProviderState<T>();

  static T of<T extends BaseBloc>(BuildContext context) {
    BlocProvider<T> provider =
        context.findAncestorWidgetOfExactType<BlocProvider<T>>();
    if (provider?.bloc != null) {
      return provider?.bloc;
    } else if (provider?.builder != null) {
      final state = context.findAncestorStateOfType<BlocProviderState<T>>();
      if (state is BlocProviderState) {
        if (state.cacheBloc == null) {
          state.cacheBloc = provider?.builder();
        }
        return state.cacheBloc;
      }
    }
    return null;
  }
}

class BlocProviderState<T extends BaseBloc> extends State<BlocProvider<T>> {
  BaseBloc cacheBloc;

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void dispose() {
    widget.bloc?.dispose();
    cacheBloc?.dispose();
    super.dispose();
  }
}

typedef BlocBuilder = BaseBloc Function();
