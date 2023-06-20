import '../main.dart';
import 'NavigationService.dart';

class PageViewModel {
  void navigateNextPage(String path) {
    final NavigationService _navigationService = locator<NavigationService>();
    _navigationService.navigateTo(path);
  }

}