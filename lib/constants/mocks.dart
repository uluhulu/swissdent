import 'package:swissdent/constants/paths.dart';
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
    productAmount: 2,
    photoPath: 'https://cdn1.ozone.ru/s3/multimedia-5/6027797585.jpg',
  ),
  ProductCard(
    productCost: 1200,
    productDescription: 'Зубная щетка (АБСТРАКЦИОНИСТ) 0,15 SOFT',
    productAmount: 10,
    photoPath: 'https://cdn1.ozone.ru/s3/multimedia-5/6027797585.jpg',
  ),
  ProductCard(
    productCost: 1200,
    productDescription: 'Зубная щетка (АБСТРАКЦИОНИСТ) 0,15 SOFT',
    productAmount: 100,
    photoPath: 'https://cdn1.ozone.ru/s3/multimedia-5/6027797585.jpg',
  ),
  ProductCard(
    productCost: 1200,
    productDescription: 'Зубная щетка (АБСТРАКЦИОНИСТ) 0,15 SOFT',
    productAmount: 1000,
    photoPath: 'https://cdn1.ozone.ru/s3/multimedia-5/6027797585.jpg',
  ),
  ProductCard(
    productCost: 1200,
    productDescription: 'Зубная щетка (АБСТРАКЦИОНИСТ) 0,15 SOFT',
    productAmount: 2,
    photoPath: 'https://cdn1.ozone.ru/s3/multimedia-5/6027797585.jpg',
  ),
  ProductCard(
    productCost: 1200,
    productDescription: 'Зубная щетка (АБСТРАКЦИОНИСТ) 0,15 SOFT',
    productAmount: 2,
    photoPath: 'https://cdn1.ozone.ru/s3/multimedia-5/6027797585.jpg',
  ),
];
final productDescription =
    'Зубная щетка для настоящих ценителей искусства MontCarotte Мондриан является частью коллекции зубных кистей ABSTRACTION BRUSH COLLECTION, посвященной художникам абстракционистам. Вслед коллекции, вдохновленной французским импрессионизмом, появляется новая упрощенная форма, очень напоминающая кисть художника, облегченная в ассоциативные цвета и геометрию известных художников: Пикассо, Итен, Кандинский, Малевич, Мондриан.';

class DoctorInfo {
  final String photoPath;
  final String doctorName;
  final String doctorSubtitle;
  final String doctorSpecialization;
  final String doctorExperience;
  final String doctorDescription;

  DoctorInfo(this.photoPath, this.doctorName, this.doctorSubtitle,
      this.doctorSpecialization, this.doctorExperience, this.doctorDescription);
}

final doctorsInfo = [
  DoctorInfo(
    doctorKulikov,
    "Вячеслав Куликов",
    'Главный врач и основатель «Швейцарской стоматологии»',
    "Устранение рецессий, Синус-лифтинг, Костная пластика, Восстановление зубов, Имплантация, Зубосохраняющие операции, Удаление зубов, Диагностика",
    "23 года",
    "Член швейцарского научного сообщества Connection Science. Опинион-лидер компании Thommen Medical в России.",
  ),
  DoctorInfo(
    doctorIvanov,
    "Николай Иванов",
    'Ортопед',
    "Вкладки, Виниры, Протезирование, Диагностика",
    "15 лет",
    "Закончил Уральскую Государственную Медицинскую Академию в 2005 году по специальности стоматология.",
  ),
  DoctorInfo(
    doctorStarikov,
    "Артём Стариков",
    'Терапевт, ортопед',
    "Вкладки, Виниры, Эстетическая реставрация, Восстановление зубов, Протезирование, Профессиональная гигиена, Отбеливание зубов Zoom4, Лечение пульпита, Лечение периодонтита, Диагностика, Лечение кариеса",
    "15 лет",
    "Закончил Уральскую Государственную Медицинскую Академию в 2005 году по специальности стоматология. Прошел профессиональную переподготовку на стоматолога-ортопеда, имеет соответствующий диплом и сертификат.",
  ),
  DoctorInfo(
    doctorParfeneva,
    "Елизавета Парфенова",
    'Стоматолог - парадонтолог',
    "Лечение парадонтита, Профессиональная гигиена, Отбеливание зубов Zoom4",
    "5 лет",
    "Заокнчила ЮУГМУ, прошла интернатуру и ординатуру по специальности «Стоматология хирургическая».",
  ),
];
