extension ABC on List {
  toJsonList() {
    return map((item) {
      try {
        return item.toMap();
      } catch (e) {
      //  print('check to toJsonList \n it is returning null');
        return {};
      }
    }).toList();
  }
}