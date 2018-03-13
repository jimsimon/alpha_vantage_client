import 'dart:async';
import 'dart:convert';
import 'package:http_client/http_client.dart';
import 'package:alpha_vantage_client/src/data_transfer_objects.dart';

abstract class AlphaVantageClient {

  final String baseUrl = 'https://www.alphavantage.co';
  final String apiKey = 'F0WYKLCVDDV2JOX0';
  Client get client;

  Future<TimeSeries> getIntradayTimeSeries(String symbol, String interval) async {
    var json = await _getJsonForQueryRequest('TIME_SERIES_INTRADAY', {
      'symbol': symbol,
      'interval': interval
    });

    json['Time Series'] = json['Time Series ($interval)'];
    _fixMetaDataEntries(json, {
      '1. Information': 'Information',
      '2. Symbol': 'Symbol',
      '3. Last Refreshed': 'Last Refreshed',
      '4. Interval': 'Interval',
      '5. Output Size': 'Output Size',
      '6. Time Zone': 'Time Zone'
    });

    return new TimeSeries.fromJson(json);
  }

  Future<TimeSeries> getDailyTimeSeries(String symbol) async {
    var json = await _getJsonForQueryRequest('TIME_SERIES_DAILY', {
      'symbol': symbol
    });

    json['Time Series'] = json['Time Series (Daily)'];
    _fixMetaDataEntries(json, {
      '1. Information': 'Information',
      '2. Symbol': 'Symbol',
      '3. Last Refreshed': 'Last Refreshed',
      '4. Output Size': 'Output Size',
      '5. Time Zone': 'Time Zone'
    });

    return new TimeSeries.fromJson(json);
  }

  Future<DailyAdjustedTimeSeries> getAdjustedDailyTimeSeries(String symbol) async {
    var json = await _getJsonForQueryRequest('TIME_SERIES_DAILY_ADJUSTED', {
      'symbol': symbol
    });

    json['Time Series'] = json['Time Series (Daily)'];
    _fixMetaDataEntries(json, {
      '1. Information': 'Information',
      '2. Symbol': 'Symbol',
      '3. Last Refreshed': 'Last Refreshed',
      '4. Output Size': 'Output Size',
      '5. Time Zone': 'Time Zone'
    });

    return new DailyAdjustedTimeSeries.fromJson(json);
  }

  Future<TimeSeries> getWeeklyTimeSeries(String symbol) async {
    var json = await _getJsonForQueryRequest('TIME_SERIES_WEEKLY', {
      'symbol': symbol
    });

    json['Time Series'] = json['Weekly Time Series'];
    _fixMetaDataEntries(json, {
      '1. Information': 'Information',
      '2. Symbol': 'Symbol',
      '3. Last Refreshed': 'Last Refreshed',
      '4. Time Zone': 'Time Zone'
    });

    return new TimeSeries.fromJson(json);
  }

  Future<AdjustedTimeSeries> getAdjustedWeeklyTimeSeries(String symbol) async {
    var json = await _getJsonForQueryRequest('TIME_SERIES_WEEKLY_ADJUSTED', {
      'symbol': symbol
    });

    json['Time Series'] = json['Weekly Adjusted Time Series'];
    _fixMetaDataEntries(json, {
      '1. Information': 'Information',
      '2. Symbol': 'Symbol',
      '3. Last Refreshed': 'Last Refreshed',
      '4. Time Zone': 'Time Zone'
    });

    return new AdjustedTimeSeries.fromJson(json);
  }

  Future<BatchStockQuotes> getBatchStockQuotes (List<String> symbols) async {
    var json = await _getJsonForQueryRequest('BATCH_STOCK_QUOTES', {
      'symbols': symbols
    });
    _fixMetaDataEntries(json, {
      '1. Information': 'Information',
      '2. Notes': 'Notes',
      '3. Time Zone': 'Time Zone'
    });

    return new BatchStockQuotes.fromJson(json);
  }

  _getJsonForQueryRequest(String function, [Map<String, dynamic> params = const {}]) async {
    var uriParams = new Map<String, dynamic>.from({
      'function': function,
      'apikey': apiKey,
    });
    uriParams.addAll(params);

    String query = '';
    uriParams.forEach((String name, dynamic valueOrValues) {
      if (valueOrValues is String) {
        query = '$query&$name=$valueOrValues';
      } else {
        query = '$query&$name=${valueOrValues.join(',')}';
      }
    });
    String url = '${baseUrl}/query?${query.substring(1)}';

    final response = await client.send(new Request('GET', url));
    await client.close();

    if (response.statusCode < 200 || response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.reasonPhrase);
    }

    // TODO: throw exception for 200 responses that are errors
    var jsonString = await response.readAsString();
    return json.decode(jsonString);
  }

  _fixMetaDataEntries(json, Map<String, String> keyReplacementMap) {
    keyReplacementMap.forEach((String originalKey, String newKey) {
      json['Meta Data'][newKey] = json['Meta Data'][originalKey];
    });
  }
}

class ApiException {
  final int statusCode;
  final String reasonPhrase;

  ApiException(this.statusCode, this.reasonPhrase);

  @override
  String toString() {
    return 'Bad API Response: $statusCode - $reasonPhrase';
  }
}