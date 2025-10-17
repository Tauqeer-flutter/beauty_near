// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appName => 'BeautyNear';

  @override
  String get aboutUs => 'Acerca de nosotros';

  @override
  String get accountSettings => 'Configuración de la cuenta';

  @override
  String get general => 'General';

  @override
  String get personalInfo => 'Información personal';

  @override
  String get support => 'Soporte';

  @override
  String get language => 'Idioma';

  @override
  String get helpAndSupport => 'Ayuda y soporte';

  @override
  String get privacyPolicy => 'Política de privacidad';

  @override
  String get termsAndCondition => 'Términos y condiciones';

  @override
  String get logout => 'Cerrar sesión';

  @override
  String distance(Object distance) {
    return '$distance km';
  }

  @override
  String ratingAndReviews(Object rating, Object reviews) {
    return '$rating ($reviews Reseñas)';
  }

  @override
  String get aboutBarber => 'Acerca del barbero';

  @override
  String get availableToday => 'Disponible hoy';

  @override
  String get bookNow => 'Reserva ahora';

  @override
  String get services => 'Servicios';

  @override
  String get reviews => 'Reseñas';

  @override
  String onlyReviews(Object reviews) {
    return '$reviews reseñas';
  }

  @override
  String get total => 'Total';

  @override
  String get noServicesSelected => 'No hay servicios seleccionados';

  @override
  String get createBooking => 'Crear reserva';

  @override
  String get barbersNearYou => 'Barberos cerca de ti';

  @override
  String get chat => 'Chat';

  @override
  String get today => 'Hoy';

  @override
  String get typeMessage => 'Escribe un mensaje';

  @override
  String get congratulations => '¡Felicidades!';

  @override
  String get accountCreatedSuccessfully =>
      'Tu cuenta se ha creado exitosamente';

  @override
  String get proceedToApp => 'Continuar a la aplicación';

  @override
  String get fillThisForm => 'Completa este formulario';

  @override
  String get pleaseFillThisForm =>
      'Por favor completa este formulario para continuar';

  @override
  String get noOfAdults => 'Número de adultos';

  @override
  String get noOfKids => 'Número de niños';

  @override
  String get selectDate => 'Seleccionar fecha';

  @override
  String get selectTime => 'Seleccionar hora';

  @override
  String get apply => 'Aplicar';

  @override
  String get booking => 'Reserva';

  @override
  String get selectServiceType => '¡Selecciona tu tipo de servicio!';

  @override
  String get mensService => 'Servicios para hombres';

  @override
  String get womensService => 'Servicios para mujeres';

  @override
  String get commaHello => 'Hola,';

  @override
  String get topRatedBarbers => 'Barberos mejor valorados';

  @override
  String get seeAll => 'Ver todo';

  @override
  String get barberYouNeed => 'El barbero que necesitas';

  @override
  String get selectLanguage => 'Seleccionar idioma';

  @override
  String get allLanguages => 'Todos los idiomas';

  @override
  String get selectLocation => 'Seleccionar ubicación';

  @override
  String get selectYourLocationToFindBarber =>
      'Selecciona tu ubicación para encontrar barberos cercanos';

  @override
  String get enterLocation => 'Ingresar ubicación';

  @override
  String get yourLocation => 'Tu ubicación';

  @override
  String get loginToYourAccount => 'Inicia sesión en tu cuenta';

  @override
  String get emailAddress => 'Dirección de correo electrónico';

  @override
  String get yourEmail => 'Tu correo electrónico';

  @override
  String get password => 'Contraseña';

  @override
  String get forgotPassword => '¿Olvidaste tu contraseña?';

  @override
  String get login => 'Iniciar sesión';

  @override
  String get dontHavAccount => '¿No tienes una cuenta?';

  @override
  String get signUp => 'Registrarse';

  @override
  String get bookingDetails => 'Detalles de la reserva';

  @override
  String get bookingBooked => 'Tu reserva se ha realizado exitosamente.';

  @override
  String get bookingId => 'ID de reserva:';

  @override
  String get bookedOn => 'Reservado el:';

  @override
  String get service => 'Servicio';

  @override
  String get haircut => 'Corte de cabello';

  @override
  String get shaving => 'Afeitado';

  @override
  String get headMassage => 'Masaje de cabeza';

  @override
  String get persons => 'Personas';

  @override
  String get adult => '1 Adulto';

  @override
  String adults(Object noOfAdults) {
    return '$noOfAdults Adultos';
  }

  @override
  String get kid => '1 Niño';

  @override
  String kids(Object noOfKids) {
    return '$noOfKids Niños';
  }

  @override
  String get timing => 'Horario';

  @override
  String get paymentSummary => 'Resumen del pago';

  @override
  String get totalAmount => 'Monto total:';

  @override
  String get totalDuration => 'Duración total';

  @override
  String minutes(Object min) {
    return '$min Minutos';
  }

  @override
  String get cancel => 'Cancelar';

  @override
  String get accept => 'Aceptar';

  @override
  String get reject => 'Rechazar';

  @override
  String get myBookings => 'Mis reservas';

  @override
  String get upcoming => 'Próximas';

  @override
  String get past => 'Pasadas';

  @override
  String get alerts => 'Alertas';

  @override
  String get markAllAsRead => 'Marcar todo como leído';

  @override
  String get orderSummary => 'Resumen del pedido';

  @override
  String get platformFees => 'Tarifas de plataforma';

  @override
  String get taxes => 'Impuestos';

  @override
  String get cancelPaymentAcknowledgement =>
      'Si cancelas la reserva con menos de 1 hora antes del horario del servicio, tu pago no será reembolsado.';

  @override
  String get bookingPlacedSuccessfully =>
      '¡Tu reserva se ha realizado exitosamente!';

  @override
  String get payNow => 'Pagar ahora';

  @override
  String get payInCash => 'Pagar en efectivo';

  @override
  String get addCardDetails => 'Agregar detalles de la tarjeta';

  @override
  String get cardHolderName => 'Nombre del titular de la tarjeta';

  @override
  String get cardNumber => 'Número de tarjeta';

  @override
  String get expiryDate => 'Fecha de vencimiento';

  @override
  String get cvv => 'CVV';

  @override
  String get zipCode => 'Código postal';

  @override
  String get countryRegion => 'País / Región';

  @override
  String get selectCountry => 'Seleccionar país';

  @override
  String get payOnline => 'Pagar en línea';

  @override
  String get addCardProceed => 'Agregar tarjeta y continuar';

  @override
  String get paymentMethod => 'Método de pago';

  @override
  String get selectPaymentMethod => 'Selecciona tu método de pago';

  @override
  String get payOnlineStripe => 'Pagar en línea (Stripe)';

  @override
  String get upfrontDepositDescription =>
      'Para confirmar la reserva debes pagar el 25% de la tarifa del servicio como depósito inicial.';

  @override
  String get enterName => 'Ingresar nombre';

  @override
  String get name => 'Nombre';

  @override
  String get phoneNumber => 'Número de teléfono';

  @override
  String get changePassword => 'Cambiar contraseña';

  @override
  String get editProfile => 'Editar perfil';

  @override
  String get selectServices => 'Seleccionar servicios';

  @override
  String get createAnAccount => 'Crear una cuenta';

  @override
  String get fullName => 'Nombre completo';

  @override
  String get yourName => 'Tu nombre';

  @override
  String get confirmPassword => 'Confirmar contraseña';

  @override
  String get next => 'Siguiente';

  @override
  String get continueWithGoogle => 'Continuar con Google';

  @override
  String get continueWithFacebook => 'Continuar con Facebook';

  @override
  String get alreadyHaveAccount => '¿Ya tienes una cuenta?';

  @override
  String get search => 'Buscar';

  @override
  String get pleaseGiveReview => 'Por favor danos una reseña';

  @override
  String get typeHere => 'Escribe aquí';

  @override
  String get submit => 'Enviar';

  @override
  String get selectDuration => 'Seleccionar duración';

  @override
  String get hours => 'Horas';

  @override
  String get minutesHeading => 'Minutos';

  @override
  String get done => 'Hecho';

  @override
  String get home => 'Inicio';

  @override
  String get bookings => 'Reservas';

  @override
  String get settings => 'Configuración';

  @override
  String get availableNow => 'Disponible ahora';

  @override
  String get minimumServicePrice => 'Precio mínimo del servicio: ';

  @override
  String get viewProfile => 'Ver perfil';

  @override
  String get viewDetails => 'Ver detalles';

  @override
  String get markAsComplete => 'Marcar como completado';

  @override
  String get completed => 'Completado';

  @override
  String smallMinutes(Object min) {
    return '$min min';
  }

  @override
  String minsAgo(Object min) {
    return 'Hace $min min';
  }

  @override
  String minsSession(Object mins) {
    return 'Sesión de $mins min';
  }

  @override
  String get languages => 'Idiomas';

  @override
  String get allServices => 'Todos los servicios';
}
