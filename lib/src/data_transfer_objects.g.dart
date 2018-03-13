// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_transfer_objects.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

TimeSeries _$TimeSeriesFromJson(Map<String, dynamic> json) => new TimeSeries(
    json['Meta Data'] == null
        ? null
        : new MetaData.fromJson(json['Meta Data'] as Map<String, dynamic>),
    json['Time Series'] == null
        ? null
        : new Map<String, TimeSeriesEntry>.fromIterables(
            (json['Time Series'] as Map<String, dynamic>).keys,
            (json['Time Series'] as Map).values.map((e) => e == null
                ? null
                : new TimeSeriesEntry.fromJson(e as Map<String, dynamic>))));

abstract class _$TimeSeriesSerializerMixin {
  MetaData get metaData;
  Map<String, TimeSeriesEntry> get data;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'Meta Data': metaData, 'Time Series': data};
}

AdjustedTimeSeries _$AdjustedTimeSeriesFromJson(Map<String, dynamic> json) =>
    new AdjustedTimeSeries(
        json['Meta Data'] == null
            ? null
            : new MetaData.fromJson(json['Meta Data'] as Map<String, dynamic>),
        json['Time Series'] == null
            ? null
            : new Map<String, AdjustedTimeSeriesEntry>.fromIterables(
                (json['Time Series'] as Map<String, dynamic>).keys,
                (json['Time Series'] as Map).values.map((e) => e == null
                    ? null
                    : new AdjustedTimeSeriesEntry.fromJson(
                        e as Map<String, dynamic>))));

abstract class _$AdjustedTimeSeriesSerializerMixin {
  MetaData get metaData;
  Map<String, AdjustedTimeSeriesEntry> get data;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'Meta Data': metaData, 'Time Series': data};
}

DailyAdjustedTimeSeries _$DailyAdjustedTimeSeriesFromJson(
        Map<String, dynamic> json) =>
    new DailyAdjustedTimeSeries(
        json['Meta Data'] == null
            ? null
            : new MetaData.fromJson(json['Meta Data'] as Map<String, dynamic>),
        json['Time Series'] == null
            ? null
            : new Map<String, DailyAdjustedTimeSeriesEntry>.fromIterables(
                (json['Time Series'] as Map<String, dynamic>).keys,
                (json['Time Series'] as Map).values.map((e) => e == null
                    ? null
                    : new DailyAdjustedTimeSeriesEntry.fromJson(
                        e as Map<String, dynamic>))));

abstract class _$DailyAdjustedTimeSeriesSerializerMixin {
  MetaData get metaData;
  Map<String, DailyAdjustedTimeSeriesEntry> get data;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'Meta Data': metaData, 'Time Series': data};
}

MetaData _$MetaDataFromJson(Map<String, dynamic> json) => new MetaData(
    json['Information'] as String,
    json['Symbol'] as String,
    json['Last Refreshed'] == null
        ? null
        : DateTime.parse(json['Last Refreshed'] as String),
    json['Interval'] as String,
    json['Output Size'] as String,
    json['Time Zone'] as String,
    json['Notes'] as String);

abstract class _$MetaDataSerializerMixin {
  String get information;
  String get symbol;
  DateTime get lastRefreshed;
  String get interval;
  String get outputSize;
  String get timezone;
  String get notes;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'Information': information,
        'Symbol': symbol,
        'Last Refreshed': lastRefreshed?.toIso8601String(),
        'Interval': interval,
        'Output Size': outputSize,
        'Time Zone': timezone,
        'Notes': notes
      };
}

TimeSeriesEntry _$TimeSeriesEntryFromJson(Map<String, dynamic> json) =>
    new TimeSeriesEntry(
        json['1. open'] as String,
        json['2. high'] as String,
        json['3. low'] as String,
        json['4. close'] as String,
        json['5. volume'] as String);

abstract class _$TimeSeriesEntrySerializerMixin {
  String get open;
  String get high;
  String get low;
  String get close;
  String get volume;
  Map<String, dynamic> toJson() => <String, dynamic>{
        '1. open': open,
        '2. high': high,
        '3. low': low,
        '4. close': close,
        '5. volume': volume
      };
}

AdjustedTimeSeriesEntry _$AdjustedTimeSeriesEntryFromJson(
        Map<String, dynamic> json) =>
    new AdjustedTimeSeriesEntry(
        json['1. open'],
        json['2. high'],
        json['3. low'],
        json['4. close'],
        json['6. volume'] as String,
        json['5. adjusted close'] as String,
        json['7. dividend amount'] as String);

abstract class _$AdjustedTimeSeriesEntrySerializerMixin {
  String get open;
  String get high;
  String get low;
  String get close;
  String get volume;
  String get adjustedClose;
  String get dividendAmount;
  Map<String, dynamic> toJson() => <String, dynamic>{
        '1. open': open,
        '2. high': high,
        '3. low': low,
        '4. close': close,
        '6. volume': volume,
        '5. adjusted close': adjustedClose,
        '7. dividend amount': dividendAmount
      };
}

DailyAdjustedTimeSeriesEntry _$DailyAdjustedTimeSeriesEntryFromJson(
        Map<String, dynamic> json) =>
    new DailyAdjustedTimeSeriesEntry(
        json['1. open'],
        json['2. high'],
        json['3. low'],
        json['4. close'],
        json['6. volume'],
        json['5. adjusted close'],
        json['7. dividend amount'],
        json['8. split coefficient'] as String);

abstract class _$DailyAdjustedTimeSeriesEntrySerializerMixin {
  String get open;
  String get high;
  String get low;
  String get close;
  String get adjustedClose;
  String get volume;
  String get dividendAmount;
  String get splitCoefficient;
  Map<String, dynamic> toJson() => <String, dynamic>{
        '1. open': open,
        '2. high': high,
        '3. low': low,
        '4. close': close,
        '5. adjusted close': adjustedClose,
        '6. volume': volume,
        '7. dividend amount': dividendAmount,
        '8. split coefficient': splitCoefficient
      };
}

BatchStockQuotes _$BatchStockQuotesFromJson(Map<String, dynamic> json) =>
    new BatchStockQuotes(
        json['Meta Data'] == null
            ? null
            : new MetaData.fromJson(json['Meta Data'] as Map<String, dynamic>),
        (json['Stock Quotes'] as List)
            ?.map((e) => e == null
                ? null
                : new StockQuote.fromJson(e as Map<String, dynamic>))
            ?.toList());

abstract class _$BatchStockQuotesSerializerMixin {
  MetaData get metaData;
  List<StockQuote> get stockQuotes;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'Meta Data': metaData, 'Stock Quotes': stockQuotes};
}

StockQuote _$StockQuoteFromJson(Map<String, dynamic> json) => new StockQuote(
    json['1. symbol'] as String,
    json['2. price'] as String,
    json['3. volume'] as String,
    json['4. timestamp'] == null
        ? null
        : DateTime.parse(json['4. timestamp'] as String));

abstract class _$StockQuoteSerializerMixin {
  String get symbol;
  String get price;
  String get volume;
  DateTime get timestamp;
  Map<String, dynamic> toJson() => <String, dynamic>{
        '1. symbol': symbol,
        '2. price': price,
        '3. volume': volume,
        '4. timestamp': timestamp?.toIso8601String()
      };
}
