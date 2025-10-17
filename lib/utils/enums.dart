import 'package:beauty_near/utils/assets.dart';

enum ScreenSize { large, medium, small, none }

enum ServiceType {
  all(SvgAssets.allServices),
  haircut(SvgAssets.allServices),
  shaving(SvgAssets.shavingWithout),
  massage(SvgAssets.shavingWithout);

  final String asset;

  const ServiceType(this.asset);
}
