import 'package:alpha_vantage_client/src/client.dart';
import 'package:http_client/http_client.dart';
import 'package:http_client/console.dart';

export 'package:alpha_vantage_client/src/data_transfer_objects.dart';

class AlphaVantageServerClient extends AlphaVantageClient {

  @override
  Client get client => new ConsoleClient();

}