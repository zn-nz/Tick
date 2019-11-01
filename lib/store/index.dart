import 'package:provider/provider.dart';
import 'package:tick/store/AppTheme.dart';

final List<SingleChildCloneableWidget> appStore = [
  ChangeNotifierProvider(
    builder: (_) => AppTheme(),
  )
];
