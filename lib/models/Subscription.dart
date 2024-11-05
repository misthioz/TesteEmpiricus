import 'package:empiricus_teste/components/feature.dart';

class Subscription{
  final String id;
  final String name;
  final String shortDescription;
  final String imageSmall;
  final String description;
  final String imageLarge;
  final List<Feature> features;
  final List<String> authorNames;

  Subscription({
    required this.id,
    required this.name,
    required this.shortDescription,
    required this.imageSmall,
    required this.description,
    required this.imageLarge,
    required this.features,
    required this.authorNames
  });

  factory Subscription.fromJson(Map<String, dynamic> json){
    return Subscription(
        id: json['identifier']['slug'],
        name: json['name'],
        shortDescription: json['shortDescription'],
        imageSmall: json['imageSmall'],
        description: json['description'],
        imageLarge: json['imageLarge'],
        features: (json['features'] as List<dynamic>).map((featureJson) => Feature.fromJson(featureJson)).toList(),
        authorNames: (json['authors'] as List<dynamic>).map((authorJson) => authorJson['name'] as String).toList()
    );
  }
}