enum CategoryName { noodel, chicken, rice }

extension CategoryNameExtension on CategoryName {
  String getCategoryString() {
    switch (this) {
      case CategoryName.noodel:
        return 'noodle';
      case CategoryName.chicken:
        return 'chicken';
      case CategoryName.rice:
        return 'rice';
      default:
        return '';
    }
  }
}
