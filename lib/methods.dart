










import 'core/utils/constant.dart';
import 'core/utils/hive_service.dart';

void showAuthScreen() {
  if (notShowAuthScreenKey =="true")
  {
    myBox!.put("notShowAuthScreen", "true");
  }else
  {
    myBox!.put("notShowAuthScreen", "false");
  }
  print(notShowAuthScreenKey);
}