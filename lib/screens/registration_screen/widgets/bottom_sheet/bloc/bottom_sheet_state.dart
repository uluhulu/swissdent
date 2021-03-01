class BottomSheetState{}

class PaswordNotConfirmed extends BottomSheetState{
  final String errorMessage;

  PaswordNotConfirmed({this.errorMessage});
}
class NavigateNext extends BottomSheetState{}