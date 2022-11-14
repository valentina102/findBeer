// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:find_beer/app/app.dart';
import 'package:find_beer/bootstrap.dart';
import 'package:find_beer/injection_container.dart' as di;
import 'package:flutter/widgets.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  await bootstrap(() => const App());
}
