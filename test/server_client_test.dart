import 'package:alpha_vantage_client/server_client.dart';
import 'package:test/test.dart';

void main() {
  group('Time Series', () {
    AlphaVantageServerClient client;

    setUp(() {
      client = new AlphaVantageServerClient();
    });

    test('Intraday', () async {
      TimeSeries timeSeries = await client.getIntradayTimeSeries('INST', '1min');

      expect(timeSeries, isNotNull);
      verifyMetaData(timeSeries, checkInterval: true);
      verifyTimeSeriesEntries(timeSeries);
    });

    test('Daily', () async {
      TimeSeries timeSeries = await client.getDailyTimeSeries('INST');

      expect(timeSeries, isNotNull);
      verifyMetaData(timeSeries);
      verifyTimeSeriesEntries(timeSeries);
    });

    test('Adjusted Daily', () async {
      DailyAdjustedTimeSeries timeSeries = await client.getAdjustedDailyTimeSeries('INST');

      expect(timeSeries, isNotNull);
      verifyMetaData(timeSeries);
      verifyDailyAdjustedTimeSeriesEntries(timeSeries);
    });

    test('Weekly', () async {
      TimeSeries timeSeries = await client.getWeeklyTimeSeries('INST');

      expect(timeSeries, isNotNull);
      verifyMetaData(timeSeries, checkOutputSize: false);
      verifyTimeSeriesEntries(timeSeries);
    });

    test('Adjusted Weekly', () async {
      AdjustedTimeSeries timeSeries = await client.getAdjustedWeeklyTimeSeries('INST');

      expect(timeSeries, isNotNull);
      verifyMetaData(timeSeries, checkOutputSize: false);
      verifyAdjustedTimeSeriesEntries(timeSeries);
    });

    test('Batch', () async {
      var symbols = ['INST', 'MSFT'];
      BatchStockQuotes batchStockQuotes = await client.getBatchStockQuotes(symbols);

      expect(batchStockQuotes, isNotNull);

      MetaData metaData = batchStockQuotes.metaData;
      expect(metaData, isNotNull);
      expect(metaData.information, isNotNull);
      expect(metaData.notes, isNotNull);
      expect(metaData.timezone, isNotNull);

      List<StockQuote> stockQuotes = batchStockQuotes.stockQuotes;
      expect(stockQuotes.length, equals(2));

      for (var i = 0; i<stockQuotes.length; i++) {
        StockQuote stockQuote = stockQuotes[i];
        expect(stockQuote.symbol, equals(symbols[i]));
        expect(stockQuote.volume, isNotNull);
        expect(stockQuote.price, isNotNull);
        expect(stockQuote.timestamp, isNotNull);
      }
    });
  });
}

void verifyTimeSeriesEntries(TimeSeries timeSeries) {
  Map<String, TimeSeriesEntry> timeSeriesEntries = timeSeries.data;
  expect(timeSeriesEntries.length, greaterThan(0));
  timeSeriesEntries.forEach((String dateString, TimeSeriesEntry timeSeriesEntry) {
    expect(DateTime.parse(dateString), new isInstanceOf<DateTime>());
    expect(timeSeriesEntry.open, isNotNull);
    expect(timeSeriesEntry.close, isNotNull);
    expect(timeSeriesEntry.high, isNotNull);
    expect(timeSeriesEntry.low, isNotNull);
    expect(timeSeriesEntry.volume, isNotNull);
  });
}

void verifyAdjustedTimeSeriesEntries(AdjustedTimeSeries timeSeries) {
  Map<String, AdjustedTimeSeriesEntry> timeSeriesEntries = timeSeries.data;
  expect(timeSeriesEntries.length, greaterThan(0));
  timeSeriesEntries.forEach((String dateString, AdjustedTimeSeriesEntry timeSeriesEntry) {
    expect(DateTime.parse(dateString), new isInstanceOf<DateTime>());
    expect(timeSeriesEntry.open, isNotNull);
    expect(timeSeriesEntry.close, isNotNull);
    expect(timeSeriesEntry.high, isNotNull);
    expect(timeSeriesEntry.low, isNotNull);
    expect(timeSeriesEntry.volume, isNotNull);
    expect(timeSeriesEntry.adjustedClose, isNotNull);
    expect(timeSeriesEntry.dividendAmount, isNotNull);
  });
}

void verifyDailyAdjustedTimeSeriesEntries(DailyAdjustedTimeSeries timeSeries) {
  Map<String, DailyAdjustedTimeSeriesEntry> timeSeriesEntries = timeSeries.data;
  expect(timeSeriesEntries.length, greaterThan(0));
  timeSeriesEntries.forEach((String dateString, DailyAdjustedTimeSeriesEntry timeSeriesEntry) {
    expect(DateTime.parse(dateString), new isInstanceOf<DateTime>());
    expect(timeSeriesEntry.open, isNotNull);
    expect(timeSeriesEntry.close, isNotNull);
    expect(timeSeriesEntry.high, isNotNull);
    expect(timeSeriesEntry.low, isNotNull);
    expect(timeSeriesEntry.volume, isNotNull);
    expect(timeSeriesEntry.adjustedClose, isNotNull);
    expect(timeSeriesEntry.splitCoefficient, isNotNull);
    expect(timeSeriesEntry.dividendAmount, isNotNull);
  });
}

void verifyMetaData(BaseJsonResponse timeSeries, {bool checkInterval = false, bool checkOutputSize = true}) {
  MetaData metaData = timeSeries.metaData;
  expect(metaData, isNotNull);
  expect(metaData.information, isNotNull);
  expect(metaData.interval, checkInterval ? isNotNull : isNull);
  expect(metaData.lastRefreshed, isNotNull);
  expect(metaData.outputSize, checkOutputSize ? isNotNull : isNull);
  expect(metaData.symbol, isNotNull);
  expect(metaData.timezone, isNotNull);
}
