import 'package:get/get.dart';

import 'package:getapidummy/module/module.dart';

part 'link.dart';

class AppRouter {
  static final List<GetPage> pages = [
    //login
    GetPage(
      name: AppLinks.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
      transition: Transition.fade,
      transitionDuration: const Duration(seconds: 1),
    ),
    //register
    GetPage(
      name: AppLinks.register,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
      transition: Transition.fade,
      transitionDuration: const Duration(seconds: 1),
    ),
    //list
    GetPage(
      name: AppLinks.list,
      page: () => const ListsView(),
      binding: ListBinding(),
      transition: Transition.fade,
      transitionDuration: const Duration(seconds: 1),
    ),
    //detail
    GetPage(
      name: AppLinks.detail,
      page: () =>  const DetailView(),
      binding: DetailBinding(),
      transition: Transition.fade,
      transitionDuration: const Duration(seconds: 1),
    ),
  ];
}