class DuplicateValue {
  String name;
  int count;

  DuplicateValue(this.name, this.count);

  @override
  String toString() {
    return '{ ${this.name}, ${this.count} }';
  }
}