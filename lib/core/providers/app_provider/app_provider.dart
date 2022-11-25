import 'package:de_marketplace/core/providers/auth_provider/auth_provider.dart';
import 'package:de_marketplace/core/providers/page_controller/page_controller.dart';
import 'package:de_marketplace/core/providers/tab_provider/tab_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> appProviders = [
  ChangeNotifierProvider<TabProvider>(create: (_) => TabProvider()),
  ChangeNotifierProvider<Auth>(create: (_) => Auth()),
  ChangeNotifierProvider<PageMixin>(create: (_) => PageMixin()),
];
