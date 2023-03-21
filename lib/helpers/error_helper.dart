import 'package:flutter/material.dart';

enum ErrorsEnum {
  cameraInitialError,
  codeMismatchException,
  emptyFieldError,
  emptyPhoneNumberError,
  expiredCodeException,
  invalidError,
  invalidfieldsError,
  invalidInnLengthError,
  invalidPinError,
  invalidPhoneNumberError,
  invalidPhoneNumberLengthError,
  noInternetConnectionError,
  timeOutError,
  systemError,
  wrongPincCodeError,
  responceCancel,
  connectionTimeOut,
  notEnoughPoints,
  emailAllreadyExist,
}

String getErrors(
  BuildContext context,
  ErrorsEnum error,
) {
  switch (error) {
    case ErrorsEnum.invalidPhoneNumberError:
      return "InvalidPhoneNumberError";
    case ErrorsEnum.invalidPhoneNumberLengthError:
      return "InvalidPhoneNumberLengthError";
    case ErrorsEnum.cameraInitialError:
      return "Неправильный пин код";
    case ErrorsEnum.codeMismatchException:
    case ErrorsEnum.emptyFieldError:
      return "Empty Field error";
    case ErrorsEnum.emptyPhoneNumberError:
      return "EmptyPhoneNumberError";
    case ErrorsEnum.expiredCodeException:
      return "Неправильный пинкод";
    case ErrorsEnum.invalidError:
      return "Invalid Error";
    case ErrorsEnum.invalidfieldsError:
      return "invalidfieldsError Error";
    case ErrorsEnum.invalidInnLengthError:
      return "invalidfieldsError Error";
    case ErrorsEnum.invalidPinError:
      return "invalidPinError ";
    case ErrorsEnum.noInternetConnectionError:
      return "Нет интернета";
    case ErrorsEnum.timeOutError:
      return "Врнмя запроса истекло попробуйте позже";
    case ErrorsEnum.systemError:
      return "Системная ошибка";
    case ErrorsEnum.wrongPincCodeError:
      return "Неправильный пин код";
    case ErrorsEnum.responceCancel:
      return "Запрос отмене";
    case ErrorsEnum.connectionTimeOut:
      return "Время ожидание от сервера истекло проверьте интернет соедененние";
    case ErrorsEnum.notEnoughPoints:
      return "Недостаточно баллов";
    case ErrorsEnum.emailAllreadyExist:
      return "Такое значение поля email уже существует.";
  }
}
