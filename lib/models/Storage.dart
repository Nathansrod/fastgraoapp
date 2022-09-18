class Storage{
  int id;
  String name;
  String cnpj;
  String phone;
  String grain_types;
  String startAt;
  String endAt;
  int average_processes;
  double max_capacity;
  double current_capacity;
  double reserved_capacity;
  bool isHidden = false;

  Storage(this.id, this.name, this.cnpj, this.phone, this.grain_types, this.startAt, this.endAt, this.average_processes, this.max_capacity, this.current_capacity, this.reserved_capacity);
}