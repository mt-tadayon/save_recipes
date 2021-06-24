enum CategoryName { noodel, chicken, rice, beef }

extension CategoryNameExtension on CategoryName {
  String getCategoryString() {
    switch (this) {
      case CategoryName.noodel:
        return 'Noodle';
      case CategoryName.chicken:
        return 'Chicken';
      case CategoryName.rice:
        return 'Rice';
      case CategoryName.beef:
        return 'Beef';
      default:
        return '';
    }
  }
}
