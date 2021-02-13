import 'package:swissdent/screens/personal_cabinet/widget/expand_treatment/schedule_treatment/widget/stage_orthopedic_card/widget/surgical_template/surgical_template.dart';

final surgicalTemplateMockList = [
  SurgicalTemplate(
    operationDate: DateTime.now(),
    operationName: "Хирургический шаблон",
    teethsList: [
      'в.ч,',
      ' н.ч.',
    ],
    totalCost: 6500,
    isDateRed: true,
  ),
  SurgicalTemplate(
    operationDate: DateTime.now(),
    operationName: "Изготовление временных коронок на своих зубах",
    teethsList: [
      '14консоль',
      '13',
      '12 пр',
      '11',
      '21',
      '22 пр',
      '23 пр',
      '24',
    ],
    totalCost: 100000,
  ),
];
