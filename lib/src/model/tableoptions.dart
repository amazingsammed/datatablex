class TableOptions {
  final bool selectible;

  final bool showSearch;

  final bool showOptions;

  final int headerHeight;

  final int rowHeight;
  final int rowPerPage;

  TableOptions(
      {this.selectible = false,
        this.showSearch = true,
        this.showOptions = false,
        this.headerHeight = 200,
        this.rowHeight = 40,
        this.rowPerPage = 10});
}