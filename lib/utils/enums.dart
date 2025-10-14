import 'package:beauty_near/utils/assets.dart';

enum ScreenSize { large, medium, small, none }

enum ServiceType {
  all('All Services', SvgAssets.allServices),
  shaving('Shaving', SvgAssets.shavingWithout),
  massage('Massage', SvgAssets.shavingWithout);

  final String label, asset;

  const ServiceType(this.label, this.asset);
}
