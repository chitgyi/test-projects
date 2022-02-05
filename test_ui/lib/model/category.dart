import 'package:test_ui/utils/constants/icon_paths.dart';

class Category {
  final String name;
  final String image;

  Category({required this.name, required this.image});
}

final categories = [
  Category(name: 'F&B', image: IconPaths.fnb),
  Category(name: 'Iron', image: IconPaths.iron),
  Category(name: 'Kid Family', image: IconPaths.kidsFamily),
  Category(name: 'Pay', image: IconPaths.pay),
  Category(name: 'Theme', image: IconPaths.theme),
  Category(name: 'Wellness', image: IconPaths.wellness),
  Category(name: 'F&B', image: IconPaths.fnb),
  Category(name: 'Workout', image: IconPaths.workout),
];
