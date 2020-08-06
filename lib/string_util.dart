extension CalitalizedString on String {
  String get capitalized =>
      this[0].toUpperCase() + this.substring(1).toLowerCase();
}
