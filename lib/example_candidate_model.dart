import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExampleCandidateModel {
  final String name;
  final String job;
  final String city;
  final List<Color> color;

  ExampleCandidateModel({
    required this.name,
    required this.job,
    required this.city,
    required this.color,
  });
}

final List<ExampleCandidateModel> candidates = [
  ExampleCandidateModel(
    name: 'Prezzo Italian',
    job: 'Italian',
    city: 'Ellesmere Port, CH65 9HD',
    color: const [Color(0xFFFF3868), Color(0xFFFFB49A)],
  ),
  ExampleCandidateModel(
    name: 'Golden Chef',
    job: 'Chinese',
    city: 'Ellesmere Port, CH65 7AN',
    color: const [Color(0xFF736EFE), Color(0xFF62E4EC)],
  ),
  ExampleCandidateModel(
    name: 'Hungry Horse',
    job: 'British, American',
    city: 'Ellesmere Port, CH65 9HD',
    color: const [Color(0xFF2F80ED), Color(0xFF56CCF2)],
  ),
  ExampleCandidateModel(
    name: 'Haute Dolci',
    job: 'British',
    city: 'Ellesmere Port, CH65 9HD',
    color: const [Color(0xFF0BA4E0), Color(0xFFA9E4BD)],
  ),
];