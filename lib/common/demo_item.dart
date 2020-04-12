import 'package:flutter/material.dart';

class DemoItem {
  const DemoItem({
    this.icon,
    this.title,
    this.subtitle,
    this.category,
    this.routeName,
    this.documentationUrl,
    this.buildRoute,
    this.codePath,
    this.keyword = '',
  });

  final String title;
  final IconData icon;
  final String subtitle;
  final DemoItemCategory category;
  final String routeName;
  final WidgetBuilder buildRoute;
  final String documentationUrl;
  final String codePath;
  final String keyword;

  @override
  String toString() {
    return '$runtimeType($title $routeName)';
  }
}

class DemoItemCategory {
  const DemoItemCategory({
    this.name,
    this.subName,
    this.icon,
    this.list,
  });

  final String name;
  final String subName;
  final String icon;
  final List<DemoItem> list;

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    final DemoItemCategory typedOther = other;
    return typedOther.name == name && typedOther.icon == icon;
  }

  @override
  int get hashCode => hashValues(name, icon);

  @override
  String toString() {
    return '$runtimeType($name)';
  }
}
