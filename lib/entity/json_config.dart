
import 'design_pattern_type.dart';

class JsonConfig {
  final List<DesignPatternType> patternTypes;

  JsonConfig({required this.patternTypes});

  factory JsonConfig.fromJson(Map<String, dynamic> json) {
    return JsonConfig(
      patternTypes: (json['pattern_types'] as List<dynamic>).map((patternType) {
        return DesignPatternType.fromJson(patternType as Map<String, dynamic>);
      }).toList(),
    );
  }
}