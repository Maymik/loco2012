import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../data/team_composition_model.dart';

part 'team_composition_state.freezed.dart';

@freezed
class TeamCompositionState with _$TeamCompositionState {
  const factory TeamCompositionState.initial() = _Initial;
  const factory TeamCompositionState.loading() = _Loading;
  const factory TeamCompositionState.loaded(List<TeamPlayer> teamPlayers) = _Loaded;
  const factory TeamCompositionState.error(String message) = _Error;
}
