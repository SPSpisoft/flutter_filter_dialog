class FilterModel {
  FilterModel(
      this.index,
      this.id,
      this.title,
      this.options
      );

  int index;
  int id;
  String title;
  List<FilterOptionModel> options;
}

class FilterOptionModel {
  FilterOptionModel(
      this.index,
      this.id,
      this.title
      );

  int index;
  int id;
  String title;

}