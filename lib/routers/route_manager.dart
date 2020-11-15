import 'package:fluro/fluro.dart';
import '../routers/router_handler.dart';

class RouterManager {
  static Router router;
  static void configureRoutes(Router router) {
    router.define("/home", handler: homeHandler);
    router.define("/dailyCodingContainer",
        handler: dailyCodingContainerHandler);
    router.define("/dailyCodingDetail", handler: dailyCodingDetailHandler);
    router.define("/twoLangContainer", handler: twoLangContainerHandler);
    router.define("/twoLangDetail", handler: twoLangDetailHandler);
    router.define("/reactContainer", handler: reactContainerHandler);
    router.define("/reactCategoryContainer",
        handler: reactCategoryContainerHandler);
    router.define("/demoDetail/:title", handler: demoDetailHandler);
    router.define("/scaContainer", handler: scaContainerHandler);
    router.define("/flutterContainer", handler: flutterContainerHandler);
    router.define("/clangContainer", handler: clangContainerHandler);
    router.define("/clangCategoryContainer",
        handler: clangCategoryContainerHandler);
    router.define("/search", handler: searchHandler);
    router.define("/collect", handler: collectHandler);
    router.define("/profile", handler: profileHandler);
    router.define("/settings", handler: settingsHandler);
  }

  static init() {
    router = Router();
    configureRoutes(router);
  }
}
