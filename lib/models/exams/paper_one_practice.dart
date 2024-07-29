import 'package:dzidzai_mobile/models/writing/free_compositions_practice.dart';
import 'package:dzidzai_mobile/models/writing/guided_compositions_practice.dart';

class PaperOnePracticeModel {
  final FreeCompositionsPracticeModel freeComposition;
  final GuidedCompositionsPracticeModel guidedComposition;

  PaperOnePracticeModel({
    required this.freeComposition,
    required this.guidedComposition,
  });
}
