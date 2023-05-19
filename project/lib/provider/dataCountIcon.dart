class DataCount {
  int? data;
  Function(int?)? onDataReturned;

  DataCount({this.data, this.onDataReturned});

  void SetData(int newdata){
    data = newdata;
    onDataReturned?.call(data);
  }
}