import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/doctors.dart';

class Doctor {
  const Doctor({
    @required this.id,
    this.name,
    this.image,
    this.types = const [],
    this.about,
    this.height,
    this.weight,
    this.category,
    this.hp,
    this.attack,
    this.defense,
    this.specialAttack,
    this.specialDefense,
    this.speed,
    this.total,
    this.malePercentage,
    this.femalePercentage,
    this.genderless,
    this.cycles,
    this.eggGroups,
    this.baseExp,
    this.evolvedFrom,
    this.reason,
    this.evolutions = const [],
  });

  Doctor.fromJson(dynamic json)
      : id = json["id"],
        name = json["name"],
        image = json["imageurl"],
        types = json["typeofpokemon"].cast<String>(),
        about = json["xdescription"],
        height = json["height"],
        weight = json["weight"],
        category = json["category"],
        hp = json['hp'],
        attack = json['attack'],
        defense = json['defense'],
        speed = json['speed'],
        specialDefense = json['special_defense'],
        specialAttack = json['special_attack'],
        total = json['total'],
        malePercentage = json['male_percentage'],
        femalePercentage = json['female_percentage'],
        genderless = json['genderless'] == 1,
        cycles = json['cycles'],
        eggGroups = json['egg_groups'],
        baseExp = json['base_exp'],
        evolvedFrom = json['evolvedfrom'],
        reason = json['reason'],
        evolutions =
            json['evolutions'].map((id) => Doctor(id: id as String)).cast<Doctor>().toList();

  final String about;
  final int attack;
  final String baseExp;
  final String category;
  final String cycles;
  final int defense;
  final String eggGroups;
  final String evolvedFrom;
  final String femalePercentage;
  final bool genderless;
  final String height;
  final int hp;
  final String id;
  final String image;
  final String malePercentage;
  final String name;
  final String reason;
  final int specialAttack;
  final int specialDefense;
  final int speed;
  final int total;
  final List<String> types;
  final String weight;
  final List<Doctor> evolutions;

  Color get color => getDoctorType(types[0]);
}

class DoctorModel extends ChangeNotifier {
  final List<Doctor> _doctors = [];
  int _selectedIndex = 0;

  UnmodifiableListView<Doctor> get doctors => UnmodifiableListView(_doctors);

  bool get hasData => _doctors.length > 0;

  Doctor get doctor => _doctors[_selectedIndex];

  int get index => _selectedIndex;

  static DoctorModel of(BuildContext context, {bool listen = false}) =>
      Provider.of<DoctorModel>(context, listen: listen);

  void setDoctors(List<Doctor> doctors) {
    _doctors.clear();
    _doctors.addAll(doctors);

    notifyListeners();
  }

  void setSelectedIndex(int index) {
    _selectedIndex = index;

    notifyListeners();
  }
}
