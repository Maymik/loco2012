import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/coaches_model.dart';


part 'coaches_state.freezed.dart';

@freezed
class CoachesState with _$CoachesState {
  const factory CoachesState.initial() = _Initial;
  const factory CoachesState.loading() = _Loading;
  const factory CoachesState.loaded(List<Coach> coaches) = _Loaded;
  const factory CoachesState.error(String message) = _Error;
}
