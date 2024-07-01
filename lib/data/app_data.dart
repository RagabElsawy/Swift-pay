import 'dart:ui';

import 'package:recharge_ticket_booking_and_bill_app/res/constant/app_strings.dart';
import 'package:recharge_ticket_booking_and_bill_app/view/home/model/categoires_model.dart';
import 'package:recharge_ticket_booking_and_bill_app/view/home/model/offer_model.dart';

import '../res/constant/app_routes_path.dart';
import '../view/electricity/model/electricity_model.dart';
import '../view/flight_ticket_booking/model/flight_ticket_model.dart';
import '../view/flight_ticket_booking/model/search_flight_model.dart';
import '../view/home/model/popular_model.dart';
import '../view/home/model/transactions_model.dart';
import '../view/movie_ticket_booking/model/latest_movie_model.dart';
import '../view/movie_ticket_booking/model/payment_model.dart';
import '../view/movie_ticket_booking/model/trending_model.dart';
import '../view/notification/model/notification_model.dart';
import '../view/onBoarding/model/onboarding_model.dart';
import '../view/package_detail/model/package_category_model.dart';
import '../view/package_detail/model/plan_detail_model.dart';
import '../view/popular_transaction/model/trans_detail_model.dart';
import '../view/profile/model/help_model.dart';
import '../view/profile/others/add_card/my_cards/model/card_model.dart';
import '../view/recharge/model/recent_recharge_model.dart';
import '../view/recharge/model/select_contact_model.dart';

List<OnBoardModel> onBoardingData = [
  OnBoardModel(
    image: AppImages.obOne,
    onboardTag: AppText.obOneTag,
  ),
  OnBoardModel(
    image: AppImages.obTwo,
    onboardTag: AppText.obTwoTag,
  ),
  OnBoardModel(
    image: AppImages.obThree,
    onboardTag: AppText.obThreeTag,
  ),
];

List<OfferModel> offerDataList = [
  OfferModel(
    image: AppImages.firstBanner,
    title: AppText.offerOne,
  ),
  OfferModel(
    image: AppImages.secondBanner,
    title: AppText.offerTwo,
  ),
  OfferModel(
    image: AppImages.firstBanner,
    title: AppText.offerOne,
  ),
];

List<CategoriesModel> categoriesDataList = [
  CategoriesModel(
    image: AppImages.phone,
    title: AppText.rechargePhone,
    routeKey: RoutesPath.rechargePage,
  ),
  CategoriesModel(
    image: AppImages.airplane,
    title: AppText.flight,
    routeKey: RoutesPath.flightTicketPage,
  ),
  CategoriesModel(
    image: AppImages.idea,
    title: AppText.electricity,
    routeKey: RoutesPath.electricityBillPage,
  ),
  CategoriesModel(
    image: AppImages.tickets,
    title: AppText.movieTicket,
    routeKey: RoutesPath.movieTicketBookingPage,
  ),
];

List<TransactionModel> transactionDataList = [
  TransactionModel(
    image: AppImages.ticketOne,
    title: AppText.raj,
    price: AppText.ticketPrice,
    des: AppText.movie,
    color: const Color(0xFFCF57D1),
  ),
  TransactionModel(
    image: AppImages.ticketTwo,
    title: AppText.cine,
    price: AppText.cinePrice,
    des: AppText.movie,
    color: const Color(0xFF8877F1),
  ),
  TransactionModel(
    image: AppImages.ticketThree,
    title: AppText.miraj,
    price: AppText.mirajPrice,
    des: AppText.movie,
    color: const Color(0xFF3455EA),
  ),
];

List<PopularTransModel> popularTransDataList = [
  PopularTransModel(
    image: AppImages.transOne,
    title: AppText.leslie,
    status: AppText.recharge,
    price: AppText.price,
  ),
  PopularTransModel(
    image: AppImages.transTwo,
    title: AppText.cameron,
    status: AppText.recharge,
    price: AppText.price,
  ),
];

List<CategoriesModel> rechargeDataList = [
  CategoriesModel(
    image: AppImages.phone,
    title: AppText.phonePrepaid,
    routeKey: RoutesPath.packageDetailPage,
  ),
  CategoriesModel(
    image: AppImages.wifi,
    title: AppText.broadband,
  ),
  CategoriesModel(
    image: AppImages.saleLight,
    title: AppText.dTH,
  ),
  CategoriesModel(
    image: AppImages.recharge,
    title: AppText.fastag,
  ),
];

List<CategoriesModel> billsDataList = [
  CategoriesModel(
    image: AppImages.phone,
    title: AppText.postpaid,
  ),
  CategoriesModel(
    image: AppImages.idea,
    title: AppText.electricity,
    routeKey: RoutesPath.electricityBillPage,
  ),
  CategoriesModel(
    image: AppImages.landline,
    title: AppText.landLine,
  ),
  CategoriesModel(
    image: AppImages.pipedGas,
    title: AppText.pipedGas,
  ),
];

List<CategoriesModel> bookingDataList = [
  CategoriesModel(
    image: AppImages.tickets,
    title: AppText.movieTicket,
    routeKey: RoutesPath.movieTicketBookingPage,
  ),
  CategoriesModel(
    image: AppImages.airplane,
    title: AppText.flight,
    routeKey: RoutesPath.flightTicketPage,
  ),
  CategoriesModel(
    image: AppImages.bus,
    title: AppText.busTicket,
  ),
  CategoriesModel(
    image: AppImages.train,
    title: AppText.trainTicket,
  ),
];

List<PopularTransModel> allPopularTransDataList = [
  PopularTransModel(
    image: AppImages.transOne,
    title: AppText.leslie,
    status: AppText.recharge,
    price: AppText.price,
  ),
  PopularTransModel(
    image: AppImages.transTwo,
    title: AppText.cameron,
    status: AppText.recharge,
    price: AppText.priceTwo,
  ),
  PopularTransModel(
    image: AppImages.transThree,
    title: AppText.rajImp,
    status: AppText.movieBooking,
    price: AppText.priceThree,
  ),
  PopularTransModel(
    image: AppImages.transFour,
    title: AppText.mirajCine,
    status: AppText.movieBooking,
    price: AppText.priceFour,
  ),
  PopularTransModel(
    image: AppImages.transFive,
    title: AppText.marvin,
    status: AppText.recharge,
    price: AppText.priceFive,
  ),
  PopularTransModel(
    image: AppImages.transSix,
    title: AppText.jerome,
    status: AppText.recharge,
    price: AppText.priceSix,
  ),
  PopularTransModel(
    image: AppImages.transSeven,
    title: AppText.cinezza,
    status: AppText.movieBooking,
    price: AppText.priceSeven,
  ),
  PopularTransModel(
    image: AppImages.transEight,
    title: AppText.time,
    status: AppText.movieBooking,
    price: AppText.priceEight,
  ),
  PopularTransModel(
    image: AppImages.transOne,
    title: AppText.leslie,
    status: AppText.recharge,
    price: AppText.price,
  ),
  PopularTransModel(
    image: AppImages.transTwo,
    title: AppText.cameron,
    status: AppText.recharge,
    price: AppText.price,
  ),
];

List<TransDetailModel> transactionDetailList = [
  TransDetailModel(
    type: AppText.customerName,
    detail: AppText.cameronWilliamson,
  ),
  TransDetailModel(
    type: AppText.email,
    detail: AppText.emailId,
  ),
  TransDetailModel(
    type: AppText.date,
    detail: AppText.dateOfTrans,
  ),
  TransDetailModel(
    type: AppText.amount,
    detail: AppText.amountOfTrans,
  ),
  TransDetailModel(
    type: AppText.transId,
    detail: AppText.transIdCode,
  ),
];

List<TransDetailModel> billingDataList = [
  TransDetailModel(
    type: AppText.subtotal,
    detail: AppText.amountOfTrans,
  ),
  TransDetailModel(
    type: AppText.fees,
    detail: AppText.priceThree,
  ),
  TransDetailModel(
    type: AppText.totalAmount,
    detail: AppText.totalAmnt,
  ),
];

List<TransactionModel> recentTransDataList = [
  TransactionModel(
    image: AppImages.ticketOne,
    title: AppText.raj,
    price: AppText.ticketPrice,
    des: AppText.movie,
    color: const Color(0xFFCF57D1),
  ),
  TransactionModel(
    image: AppImages.mobilePhone,
    title: AppText.jeromeBell,
    price: AppText.priceTwo,
    des: AppText.recharge,
    color: const Color(0xFF8877F1),
  ),
  TransactionModel(
    image: AppImages.saleLight,
    title: AppText.sunDirect,
    price: AppText.priceSun,
    des: AppText.dthOpe,
    color: const Color(0xFF3455EA),
  ),
  TransactionModel(
    image: AppImages.wifi,
    title: AppText.bsnl,
    price: AppText.priceBsnl,
    des: AppText.dthOpe,
    color: const Color(0xFF61D7E7),
  ),
  TransactionModel(
    image: AppImages.mobilePhone,
    title: AppText.jenny,
    price: AppText.priceJenny,
    des: AppText.recharge,
    color: const Color(0xFFEA5DA1),
  ),
  TransactionModel(
    image: AppImages.recharge,
    title: AppText.fastagRecharge,
    price: AppText.priceTwo,
    des: AppText.recharge,
    color: const Color(0xFF3455EA),
  ),
  TransactionModel(
    image: AppImages.saleLight,
    title: AppText.dishTv,
    price: AppText.totalAmnt,
    des: AppText.dthOpe,
    color: const Color(0xFFCF57D1),
  ),
  TransactionModel(
    image: AppImages.ticketTwo,
    title: AppText.cine,
    price: AppText.cinePrice,
    des: AppText.movie,
    color: const Color(0xFF8877F1),
  ),
  TransactionModel(
    image: AppImages.ticketThree,
    title: AppText.miraj,
    price: AppText.mirajPrice,
    des: AppText.movie,
    color: const Color(0xFF3455EA),
  ),
];

List<NotificationModel> notificationDataList = [
  NotificationModel(
    title: AppText.notifyOne,
    time: AppText.twoMinAgo,
  ),
  NotificationModel(
    title: AppText.notifyTwo,
    time: AppText.fifteenMinAgo,
  ),
  NotificationModel(
    title: AppText.notifyThree,
    time: AppText.twentyMinAgo,
  ),
  NotificationModel(
    title: AppText.notifyFour,
    time: AppText.oneDayAgo,
  ),
  NotificationModel(
    title: AppText.notifyFive,
    time: AppText.tenDayAgo,
  ),
  NotificationModel(
    title: AppText.notifyOne,
    time: AppText.fifteenMinAgo,
  ),
  NotificationModel(
    title: AppText.notifyOne,
    time: AppText.twentyMinAgo,
  ),
];

List<CardModel> cardDataList = [
  CardModel(
    image: AppImages.paypal,
    card: AppText.paypal,
  ),
  CardModel(
    image: AppImages.visa,
    card: AppText.visa,
  ),
  CardModel(
    image: AppImages.apple,
    card: AppText.applePay,
  ),
  CardModel(
    image: AppImages.google,
    card: AppText.googlePay,
  ),
];

List<PackageCategoryModel> packageCategoryDataList = [
  PackageCategoryModel(
    text: AppText.madeForYou,
  ),
  PackageCategoryModel(
    text: AppText.hero,
  ),
  PackageCategoryModel(
    text: AppText.yearly,
  ),
  PackageCategoryModel(
    text: AppText.roaming,
  ),
];

List<PlanDetailsModel> planDetailDataList = [
  PlanDetailsModel(
    price: AppText.priceJenny,
    validity: AppText.validityOne,
    des: AppText.firstPlan,
  ),
  PlanDetailsModel(
    price: AppText.totalAmnt,
    validity: AppText.validityOne,
    des: AppText.secondPLan,
  ),
  PlanDetailsModel(
    price: AppText.thirdPrice,
    validity: AppText.validityTwo,
    des: AppText.thirdPlan,
  ),
  PlanDetailsModel(
    price: AppText.fourthPrice,
    validity: AppText.validityTwo,
    des: AppText.fourthPlan,
  ),
  PlanDetailsModel(
    price: AppText.fifthPrice,
    validity: AppText.validityTwo,
    des: AppText.firstPlan,
  ),
];

List<ElectricityModel> electricityDataList = [
  ElectricityModel(
    // routeKey: RoutesPath.maharashtraElectricityPage,
    image: AppImages.maha,
    title: AppText.maharashtraElectricity,
  ),
  ElectricityModel(
    // routeKey: RoutesPath.maharashtraElectricityPage,
    image: AppImages.torrent,
    title: AppText.torrent,
  ),
  ElectricityModel(
    // routeKey: RoutesPath.maharashtraElectricityPage,
    image: AppImages.tata,
    title: AppText.tata,
  ),
  ElectricityModel(
    image: AppImages.delta,
    title: AppText.data,
  ),
  ElectricityModel(
    image: AppImages.green,
    title: AppText.green,
  ),
  ElectricityModel(
    image: AppImages.fuji,
    title: AppText.fuji,
  ),
  ElectricityModel(
    image: AppImages.petra,
    title: AppText.pertra,
  ),
  ElectricityModel(
    image: AppImages.ecoinstrumnet,
    title: AppText.ecoinstruments,
  ),
  ElectricityModel(
    image: AppImages.distbn,
    title: AppText.distbn,
  ),
];

List<LatestMovieModel> latestMovieDataList = [
  LatestMovieModel(
    title: AppText.fast,
    image: AppImages.fast,
    rate: AppText.fastRate,
  ),
  LatestMovieModel(
    title: AppText.mission,
    image: AppImages.mission,
    rate: AppText.missionRate,
  ),
];

List<TrendingMovieModel> trendingMovieDataList = [
  TrendingMovieModel(
    title: AppText.mission,
    image: AppImages.mission,
  ),
  TrendingMovieModel(
    title: AppText.fast,
    image: AppImages.fastSix,
  ),
  TrendingMovieModel(
    title: AppText.adipurush,
    image: AppImages.mission,
  ),
  TrendingMovieModel(
    title: AppText.mission,
    image: AppImages.mission,
  ),
];

List<PaymentModel> paymentDetailDataList = [
  PaymentModel(
    image: AppImages.visa,
    name: AppText.visa,
  ),
  PaymentModel(
    image: AppImages.paypal,
    name: AppText.paypal,
  ),
  PaymentModel(
    image: AppImages.apple,
    name: AppText.applePay,
  ),
  PaymentModel(
    image: AppImages.google,
    name: AppText.googlePay,
  ),
];

List<HelpModel> helpDataList = [
  HelpModel(
    que: AppText.firstQue,
  ),
  HelpModel(
    que: AppText.secondQue,
  ),
  HelpModel(
    que: AppText.thirdQue,
  ),
  HelpModel(
    que: AppText.fourthQue,
  ),
  HelpModel(
    que: AppText.fifthQue,
  ),
  HelpModel(
    que: AppText.sixthQue,
  ),
  HelpModel(
    que: AppText.seventhQue,
  ),
];

List<SearchFlightModel> searchFlightDataList = [
  SearchFlightModel(
    image: AppImages.garuda,
    status: AppText.available,
    statusColor: const Color(0xFF04B155),
  ),
  SearchFlightModel(
    image: AppImages.lionAir,
    status: AppText.fiveLeft,
    statusColor: const Color(0xFFD93636),
  ),
  SearchFlightModel(
    image: AppImages.cityLink,
    status: AppText.available,
    statusColor: const Color(0xFF04B155),
  ),
  SearchFlightModel(
    image: AppImages.airAsia,
    status: AppText.fiveLeft,
    statusColor: const Color(0xFFD93636),
  ),
];

List<FlightTicketModel> flightTicketDataList = [
  FlightTicketModel(
    name: AppText.oneWay,
  ),
  FlightTicketModel(
    name: AppText.roundWay,
  ),
];

List<RecentRechargeModel> recentRechargeDataList = [
  RecentRechargeModel(
    name: "R",
    title: AppText.ronaldName,
    color: const Color(0xFFE7F2FF),
    textColor: const Color(0xFF057CFF),
  ),
  RecentRechargeModel(
    name: "T",
    title: AppText.theresa,
    color: const Color(0xFFD6F2F6),
    textColor: const Color(0xFF00A9C7),
  ),
  RecentRechargeModel(
    name: "H",
    title: AppText.hawkins,
    color: const Color(0xFFFFE7D9),
    textColor: const Color(0xFFFB792A),
  ),
  RecentRechargeModel(
    name: "E",
    title: AppText.edwards,
    color: const Color(0xFFEAEAFA),
    textColor: const Color(0xFF46479E),
  ),
  RecentRechargeModel(
    name: "R",
    title: AppText.richards,
    color: const Color(0xFFDEF3ED),
    textColor: const Color(0xFF2F836C),
  ),
];

List<SelectContactModel> selectContactDataList = [
  SelectContactModel(
    title: "R",
    name: AppText.ronaldName,
    number: AppText.one,
    color: const Color(0xFFE7F2FF),
    textColor: const Color(0xFF057CFF),
  ),
  SelectContactModel(
    title: "C",
    name: AppText.cameronWilliamson,
    number: AppText.two,
    color: const Color(0xFFFFE7D9),
    textColor: const Color(0xFFFB792A),
    // color: const Color(0xFFD6F2F6),
    // textColor: const Color(0xFF00A9C7),
  ),
  SelectContactModel(
    title: "E",
    name: AppText.esther,
    number: AppText.three,
    color: const Color(0xFFDEF3ED),
    textColor: const Color(0xFF2F836C),
  ),
  SelectContactModel(
    title: "D",
    name: AppText.dianne,
    number: AppText.four,
    color: const Color(0xFFEAEAFA),
    textColor: const Color(0xFF46479E),
  ),
  SelectContactModel(
    title: "J",
    name: AppText.jennyWilson,
    number: AppText.five,
    color: const Color(0xFFD6F2F6),
    textColor: const Color(0xFF00A9C7),
  ),
  SelectContactModel(
    title: "L",
    name: AppText.leslieAlexander,
    number: AppText.six,
    color: const Color(0xFFE7F2FF),
    textColor: const Color(0xFF057CFF),
  ),
  SelectContactModel(
    title: "B",
    name: AppText.brooklyn,
    number: AppText.seven,
    color: const Color(0xFFE7F2FF),
    textColor: const Color(0xFF057CFF),
  ),
];
