

import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {

  static String tmdbKey = dotenv.env['THE_MOVIEDB_KEY'] ?? '02ac6815d2b29aa88fd00ea2dcd19d59';

}