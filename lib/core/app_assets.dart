/// Centralized asset path constants for the Gas Distribution App.
/// This file contains all asset paths to avoid hardcoding throughout the codebase.
class AppAssets {
  // Private constructor to prevent instantiation
  AppAssets._();

  // Base asset directories
  static const String _iconsPath = 'icons/';

  // Icon assets
  static const String nfcIcon = '${_iconsPath}nfc.svg';
  static const String bottleIcon = '${_iconsPath}bottle.png';
  static const String clientsIcon = '${_iconsPath}clients.svg';
  static const String homeIcon = '${_iconsPath}home.svg';
  static const String historyIcon = '${_iconsPath}history.svg';
  static const String settingsIcon = '${_iconsPath}settings.svg';
  static const String addClientIcon = '${_iconsPath}add_client.png';
  static const String arrowIcon = '${_iconsPath}arrow.png';
  static const String leftArrowIcon = '${_iconsPath}left_arrow.png';
  static const String syncIcon = '${_iconsPath}sync.png';
}