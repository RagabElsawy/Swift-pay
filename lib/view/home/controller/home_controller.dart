import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:recharge_ticket_booking_and_bill_app/data/app_data.dart';
import 'package:recharge_ticket_booking_and_bill_app/view/home/model/categoires_model.dart';
import 'package:recharge_ticket_booking_and_bill_app/view/home/model/popular_model.dart';
import 'package:recharge_ticket_booking_and_bill_app/view/home/model/transactions_model.dart';

import '../model/offer_model.dart';

class HomeController extends GetxController{
  CarouselController? carouselController = CarouselController();
  PageController pageController = PageController();
  RxInt i = 0.obs;

  List<OfferModel> list = offerDataList;
  List<CategoriesModel> categoriesList = categoriesDataList;
  List<TransactionModel> transactionList = transactionDataList;
  List<PopularTransModel> popularList = popularTransDataList;
}