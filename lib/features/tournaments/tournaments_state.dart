import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/tournaments_model.dart';

part 'tournaments_state.freezed.dart';

@freezed
class TournamentsState with _$TournamentsState {
  const factory TournamentsState.initial() = _Initial;
  const factory TournamentsState.loading() = _Loading;
  const factory TournamentsState.loaded(List<Tournament> tournaments) = _Loaded;
  const factory TournamentsState.error(String message) = _Error;
}
