
import 'package:de_marketplace/core/providers/tab_provider/tab_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> appProviders = [
  ChangeNotifierProvider<TabProvider>(create: (_) => TabProvider()),
];
