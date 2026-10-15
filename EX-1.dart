enum Skill { FLUTTER, DART, OTHER }

void main() {
  var emp1 = Employee(
    'Sokea',
    40000,
    [Skill.DART, Skill.OTHER],
    Address('St 51', 'Battambang', '012000'),
    5,
  );
  emp1.printDetails();

  var emp2 = Employee.mobileDeveloper(
    'Ronan',
    Address('St 110', 'Phnom Penh', '12000'),
    3,
  );
  emp2.printDetails();
}

class Employee {
  final String _name;
  final double _baseSalary;
  final List<Skill> _skills;
  final Address _address;
  final int _yearsOfExperience;

  Employee(
    this._name,
    this._baseSalary,
    this._skills,
    this._address,
    this._yearsOfExperience,
  );

  Employee.mobileDeveloper(String name, Address address, int yearsOfExperience)
    : this(
        name,
        45000,
        [Skill.FLUTTER, Skill.DART],
        address,
        yearsOfExperience,
      );

  String get name => _name;
  double get baseSalary => _baseSalary;
  List<Skill> get skills => _skills;
  Address get address => _address;
  int get yearsOfExperience => _yearsOfExperience;

  double computeSalary() {
    double bonus = _yearsOfExperience * 2000;
    double salary = _baseSalary * bonus;

    for (var skill in _skills) {
      switch (skill) {
        case Skill.FLUTTER:
          salary += 5000;
          break;
        case Skill.DART:
          salary += 3000;
          break;
        case Skill.OTHER:
          salary += 1000;
          break;
      }
    }

    return salary;
  }

  void printDetails() {
    print('Employee: $_name');
    print('Base Salary: $_baseSalary');
    print('Address: $_address');
    print('Experience: $_yearsOfExperience year(s)');
    print('Skills: $_skills');
  }
}

class Address {
  final String _street;
  final String _city;
  final String _zipCode;

  Address(this._street, this._city, this._zipCode);

  String get street => _street;
  String get city => _city;
  String get zipCode => _zipCode;

  @override
  String toString() => '$_street, $_city $_zipCode';
}
