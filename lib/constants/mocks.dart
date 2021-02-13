import 'package:swissdent/screens/cart_screen/widget/product_card/product_card.dart';
import 'package:swissdent/screens/personal_cabinet/widget/expand_treatment/schedule_treatment/widget/stage_orthopedic_card/widget/surgical_template/surgical_template.dart';
import 'package:swissdent/util/money_formatter.dart';

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

final cartItemsMockList = [
  ProductCard(
    productCost: 1200,
    productDescription: 'Зубная щетка (АБСТРАКЦИОНИСТ) 0,15 SOFT',
    productAmount: '2',
    photoPath: 'https://cdn1.ozone.ru/s3/multimedia-5/6027797585.jpg',
  ),
  ProductCard(
    productCost: 1200,
    productDescription: 'Зубная щетка (АБСТРАКЦИОНИСТ) 0,15 SOFT',
    productAmount: '2',
    photoPath: 'https://cdn1.ozone.ru/s3/multimedia-5/6027797585.jpg',
  ),
  ProductCard(
    productCost: 1200,
    productDescription: 'Зубная щетка (АБСТРАКЦИОНИСТ) 0,15 SOFT',
    productAmount: '2',
    photoPath: 'https://cdn1.ozone.ru/s3/multimedia-5/6027797585.jpg',
  ),
  ProductCard(
    productCost: 1200,
    productDescription: 'Зубная щетка (АБСТРАКЦИОНИСТ) 0,15 SOFT',
    productAmount: '2',
    photoPath: 'https://cdn1.ozone.ru/s3/multimedia-5/6027797585.jpg',
  ),
  ProductCard(
    productCost: 1200,
    productDescription: 'Зубная щетка (АБСТРАКЦИОНИСТ) 0,15 SOFT',
    productAmount: '2',
    photoPath: 'https://cdn1.ozone.ru/s3/multimedia-5/6027797585.jpg',
  ),
  ProductCard(
    productCost: 1200,
    productDescription: 'Зубная щетка (АБСТРАКЦИОНИСТ) 0,15 SOFT',
    productAmount: '2',
    photoPath: 'https://cdn1.ozone.ru/s3/multimedia-5/6027797585.jpg',
  ),
];
