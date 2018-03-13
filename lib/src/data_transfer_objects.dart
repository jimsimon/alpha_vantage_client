import 'package:json_annotation/json_annotation.dart';
part 'data_transfer_objects.g.dart';

class BaseJsonResponse {
  @JsonKey(name: 'Meta Data') final MetaData metaData;

  BaseJsonResponse(this.metaData);
}

@JsonSerializable()
class TimeSeries extends BaseJsonResponse with _$TimeSeriesSerializerMixin {
  @JsonKey(name: 'Time Series') final Map<String,TimeSeriesEntry> data;

  TimeSeries(MetaData metaData, this.data) : super(metaData);

  factory TimeSeries.fromJson(Map<String, dynamic> json) => _$TimeSeriesFromJson(json);
}

@JsonSerializable()
class AdjustedTimeSeries extends BaseJsonResponse with _$AdjustedTimeSeriesSerializerMixin {
  @JsonKey(name: 'Time Series') final Map<String,AdjustedTimeSeriesEntry> data;

  AdjustedTimeSeries(MetaData metaData, this.data) : super(metaData);

  factory AdjustedTimeSeries.fromJson(Map<String, dynamic> json) => _$AdjustedTimeSeriesFromJson(json);
}

@JsonSerializable()
class DailyAdjustedTimeSeries extends BaseJsonResponse with _$DailyAdjustedTimeSeriesSerializerMixin {
  @JsonKey(name: 'Time Series') final Map<String,DailyAdjustedTimeSeriesEntry> data;

  DailyAdjustedTimeSeries(MetaData metaData, this.data) : super(metaData);

  factory DailyAdjustedTimeSeries.fromJson(Map<String, dynamic> json) => _$DailyAdjustedTimeSeriesFromJson(json);
}

@JsonSerializable()
class MetaData extends Object with _$MetaDataSerializerMixin {
  @JsonKey(name: 'Information') final String information;
  @JsonKey(name: 'Symbol') final String symbol;
  @JsonKey(name: 'Last Refreshed') final DateTime lastRefreshed;
  @JsonKey(name: 'Interval') final String interval;
  @JsonKey(name: 'Output Size') final String outputSize;
  @JsonKey(name: 'Time Zone') final String timezone;
  @JsonKey(name: 'Notes') final String notes;

  MetaData(this.information, this.symbol, this.lastRefreshed, this.interval, this.outputSize, this.timezone, this.notes);

  factory MetaData.fromJson(Map<String, dynamic> json) => _$MetaDataFromJson(json);
}

@JsonSerializable()
class TimeSeriesEntry extends Object with _$TimeSeriesEntrySerializerMixin {
  @JsonKey(name: '1. open') final String open;
  @JsonKey(name: '2. high') final String high;
  @JsonKey(name: '3. low') final String low;
  @JsonKey(name: '4. close') final String close;
  @JsonKey(name: '5. volume') final String volume;

  TimeSeriesEntry(this.open, this.high, this.low, this.close, this.volume);

  factory TimeSeriesEntry.fromJson(Map<String, dynamic> json) => _$TimeSeriesEntryFromJson(json);
}

@JsonSerializable()
class AdjustedTimeSeriesEntry extends TimeSeriesEntry with _$AdjustedTimeSeriesEntrySerializerMixin {
  @JsonKey(name: '5. adjusted close') final String adjustedClose;
  @JsonKey(name: '6. volume') final String volume;
  @JsonKey(name: '7. dividend amount') final String dividendAmount;

  AdjustedTimeSeriesEntry(open, high, low, close, this.volume, this.adjustedClose, this.dividendAmount) : super(open, high, low, close, null);

  factory AdjustedTimeSeriesEntry.fromJson(Map<String, dynamic> json) => _$AdjustedTimeSeriesEntryFromJson(json);
}

@JsonSerializable()
class DailyAdjustedTimeSeriesEntry extends AdjustedTimeSeriesEntry with _$DailyAdjustedTimeSeriesEntrySerializerMixin {
  @JsonKey(name: '8. split coefficient') final String splitCoefficient;

  DailyAdjustedTimeSeriesEntry(open, high, low, close, volume, adjustedClose, dividendAmount, this.splitCoefficient) : super(open, high, low, close, volume, adjustedClose, dividendAmount);

  factory DailyAdjustedTimeSeriesEntry.fromJson(Map<String, dynamic> json) => _$DailyAdjustedTimeSeriesEntryFromJson(json);
}

@JsonSerializable()
class BatchStockQuotes extends BaseJsonResponse with _$BatchStockQuotesSerializerMixin {
  @JsonKey(name: 'Stock Quotes') final List<StockQuote> stockQuotes;

  BatchStockQuotes(MetaData metaData, this.stockQuotes) : super(metaData);

  factory BatchStockQuotes.fromJson(Map<String, dynamic> json) => _$BatchStockQuotesFromJson(json);
}

@JsonSerializable()
class StockQuote extends Object with _$StockQuoteSerializerMixin {
  @JsonKey(name: '1. symbol') final String symbol;
  @JsonKey(name: '2. price') final String price;
  @JsonKey(name: '3. volume') final String volume;
  @JsonKey(name: '4. timestamp') final DateTime timestamp;

  StockQuote(this.symbol, this.price, this.volume, this.timestamp);

  factory StockQuote.fromJson(Map<String, dynamic> json) => _$StockQuoteFromJson(json);
}