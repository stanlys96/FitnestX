part of 'providers.dart';

class GettingStartedChangeNotifier with ChangeNotifier {
  int index = 0;
  List<String> listTitles = [
    "Track Your Goal",
    "Get Burn",
    "Eat Well",
    "Improve Sleep Quality"
  ];
  List<String> listDescriptions = [
    "Don't worry if you have trouble determining your goals, we can help you determine your goals and track your goals",
    "Let's keep burning. To achieve your goals, it hurts only temporarily. If you give up now you will be in pain forever",
    "Let's start a healthy lifestyle with us. We can determine your diet every day. Healthy eating is fun",
    "Improve the quality of your sleep with us. Good quality sleep can bring a good mood in the morning"
  ];
  List<String> listImageUrls = [
    "track_your_goal.png",
    "get_burn.png",
    "eat_well.png",
    "improve_sleep_quality.png",
  ];

  String _title = "Track Your Goal";
  String _description =
      "Don't worry if you have trouble determining your goals, we can help you determine your goals and track your goals";
  String _imageUrl = "track_your_goal.png";
  double _percentIndicator = 0.25;

  String get title => _title;
  String get description => _description;
  String get imageUrl => _imageUrl;
  double get percentIndicator => _percentIndicator;

  void moveToNextPage() async {
    if (index == listTitles.length - 1) {
      return;
    }
    index++;
    _imageUrl = await listImageUrls[index];
    _percentIndicator += 0.25;
    _title = listTitles[index];
    _description = listDescriptions[index];
    notifyListeners();
  }
}
