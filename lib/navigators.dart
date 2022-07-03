import 'package:auto_route/auto_route.dart';
import 'package:myapp/user_detail.dart';
import 'package:myapp/user_list.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page, Route',
  routes: <AutoRoute>[
    AutoRoute(page:UserList, initial: true),
    AutoRoute(page:UserDetail)
  ],
)
class $AppRouter {}