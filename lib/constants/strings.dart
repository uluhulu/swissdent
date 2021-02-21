import 'package:swissdent/util/money_formatter.dart';

final splashText = 'ШВЕЙЦАРСКАЯ СТОМАТОЛОГИЯ';
final smsConfirmationHintText = 'Введите смс-код';
final registrationTitle = 'Регистрация';
final registrationDescription =
    'Введите номер мобильного телефона. Для регистрации заполните код, присланный в SMS';
final logInDescription = 'Для входа введите номер мобильного телефона и пароль';
final getCodeText = 'Получить код';
final goNextText = 'Далее';
final useOfTermText1 = 'Запросив код, пользователь принимает ';
final useOfTermText2 = 'пользовательское соглашение ';
final useOfTermText3 = 'и соглашается на push-уведомления.';
final timerCountdownText1 = 'Получить код повторно можно через ';
final timerCountdownText2 = ' секунд';
final nameHint = 'Имя';
final surnameHint = 'Фамилия';
final emailHint = 'Email';
final registrationWithAccountsHint =
    'Или зарегестрируйтесь с помощью аккаунта в соц.сети';
final logInWithAccountsHint =
    'Или войдите с помощью аккаунта в соц.сети';
final registrationText = 'Зарегистрироваться';
final createPasswordText = 'Придумайте пароль';
final mainMenu = 'Главное меню';
final passwordText = 'Пароль';
final repeatPasswordText = 'Повторите пароль';
final successfulRegistration = 'Вы успешно зарегестрировались!';
final cartInfoTitle = 'В вашей корзине';
final cartInfoProducts = ' товаров';
final personalCabinet = 'Личный кабинет';
final services = 'Услуги';
final products = 'Товары';
final team = 'Команда';
final cart = 'Корзина';
final help = 'Помощь';
final emergencyCallButton = 'Экстренный звонок в клинику';
final completeTreatmentCardName = 'Пройденное лечение';
final scheduleTreatmentCardName = 'График лечения';
final teethColumnName = 'Зубы';
final teethCountColumnName = 'Кол-во единиц';
final totalCostColumnName = 'Итого стоимость';
final orhopedicStageCardTitle = 'Этап ортопедический';
final preventiveStageCardTitle = 'Этап профилактический';
final preventiveStageCardSubtitle = 'врач ';
final stageTitle = 'Этап ';
final rubPrefix = 'руб';
final treatmentCostTitle = 'Стоимость лечения';
final treatmentDiscountTitle = 'С учетом скидки';
final documentsTitle = 'Документы для налоговой';
final personalCabinetTitle = 'Личный кабинет';
final price = 'Стоимость';
final discount = 'Скидка';
final total = 'Итог';
final paymentInfoText =
    'Оплата и получение товара производится в офисе стоматологии';
final snapshotsScreenTitle = 'Снимки';
final servicesScreenTitle = 'Услуги';
final searchBarHint = 'Поиск';
final userProfileTitle = "Ваш профиль";
final commonData = "Общие данные";
final passwordChange = "Сброс пароля";
final newPassword = "Новый пароль";
final repeatNewPassword = "Повторите новый пароль";
final save = "Сохранить";
final buyButton = "Купить";
final productIsAdded = "Товар успешно добавлен в корзину";
final navigate= "Перейти";
final teamAppBar = 'Команда';
final healpAppBar = 'Помощь';
final doctorIvanovSubtitle ="Ортопед";
final specialization ="Специализация";
final experience ="Стаж в стоматологии";
final toothpasteQuestion = 'Какую пасту лучше выбрать после лечения?';
final userQuestion = 'Ваш вопрос...';
final send = 'Отправить';
final questionInfoText = 'Ваш вопрос отправлен.\nМы скоро Вам ответим';
final logInTitle = 'Вход';
final navigateToRegistrationText = 'Еще не зарегистрированы?\n';
final logInButtonText = "Войти";
final forgetPasswordTitle = 'Забыли пароль?';



final chatTitle = 'Чат';
final userMessageTitle = 'Вы';
final chatBarHint = 'Введите сообщение';


String serviceCost(double amount) {
  return 'от ${formatMoney(amount)} $rubPrefix';
}
