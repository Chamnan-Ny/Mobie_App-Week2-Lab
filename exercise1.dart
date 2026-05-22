
enum Skill{ FLUTTER, DART, OTHER }

class Address{
  final String street;
  final String city;
  final String zipCode;

  const Address({
    required this.street,
    required this.city,
    required this.zipCode,
  });
}

class Employee {
  final String _name;
  final double _baseSalary;
  final List<Skill> _skills;
  final Address _address;
  final int _yearsOfExperience;

  const Employee({
    required String name,
    required double baseSalary,
    required List<Skill> skills,
    required Address address,
    required int yearsOfExperience,
  }) : _name = name,
       _baseSalary = baseSalary,
       _skills = skills,
       _address = address,
       _yearsOfExperience = yearsOfExperience;

  Employee.mobileDeveloper({
    required String name,
    required Address address,
    required int yearsOfExperience,
  }) : _name = name,
       _baseSalary = 40000,
       _skills = const [Skill.FLUTTER, Skill.DART],
       _address = address,
       _yearsOfExperience = yearsOfExperience;

  String get name => _name;
  double get baseSalary => _baseSalary;
  List<Skill> get skills => _skills;
  Address get address => _address;
  int get yearsOfExperience => _yearsOfExperience;

  double computeSalary() {
    double salary = _baseSalary;
    salary += _yearsOfExperience * 2000;

    for (Skill skill in _skills) {
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
}

void main() {
  final address = Address(
    street: 'TTP',
    city: 'Phnom Penh',
    zipCode: '12000',
  );

  final dev = Employee.mobileDeveloper(
    name: 'Eren',
    address: address,
    yearsOfExperience: 3,
  );

  print('Name: ${dev.name}');
  print('City: ${dev.address.city}');
  print('Skills: ${dev.skills}');
  print('Salary: \$${dev.computeSalary()}');
}
