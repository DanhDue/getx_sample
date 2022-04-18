// ISO 639-1 standard language codes
final List<LanguageModel> languages = [
  LanguageModel("English", "en_US"),
  LanguageModel("Vietnamese", "vi_VI"),
];

class LanguageModel {
  LanguageModel(
    this.language,
    this.symbol,
  );

  String language;
  String symbol;
}
