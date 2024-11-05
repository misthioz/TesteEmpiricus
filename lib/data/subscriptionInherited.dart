import 'package:flutter/material.dart';
import 'package:empiricus_teste/components/feature.dart';


class SubscriptionInherited extends InheritedWidget {
  final String id;
  final String name;
  final String shortDescription;
  final String imageSmall;
  final String imageLarge;
  final String description;
  final List<String> authorNames;
  final List<Feature> features;

  const SubscriptionInherited({
    Key? key,
    required this.id,
    required this.name,
    required this.shortDescription,
    required this.imageSmall,
    required this.imageLarge,
    required this.description,
    required this.authorNames,
    required this.features,
    required Widget child,
  }) : super(key: key, child: child);

  static SubscriptionInherited of(BuildContext context) {
    final SubscriptionInherited? inherited =
    context.dependOnInheritedWidgetOfExactType<SubscriptionInherited>();
    if (inherited == null) {
      throw Exception('No subscriptionInherited found');
    }
    return inherited;
  }

  @override
  bool updateShouldNotify(SubscriptionInherited oldWidget) {
    return id != oldWidget.id ||
        name != oldWidget.name ||
        shortDescription != oldWidget.shortDescription ||
        imageSmall != oldWidget.imageSmall ||
        imageLarge != oldWidget.imageLarge ||
        description != oldWidget.description ||
        authorNames != oldWidget.authorNames ||
        features != oldWidget.features;
  }
}