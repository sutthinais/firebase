// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:getx_home_service/app/themes/app_colors.dart';
import 'package:lottie/lottie.dart';

import 'values_manager.dart';

const String ICON_PATH = "assets/icons";
const String IMAGE_PATH = "assets/images";
const String JSON_PATH = "assets/json";
const String STYLE_PATH = "assets/style";

class IconAssets {
  static const String ICON_HOME_SERVICE_WHITE = "$ICON_PATH/home-service-white.png";
  static const String ICON_HOME_SERVICE_PRIMARY = "$ICON_PATH/home-service-primary.png";
  static const String ICON_HOME_SERVICE = "$ICON_PATH/home-service.png";
  static const String ICON_3USER = "$ICON_PATH/3 User.png";
  static const String ICON_ARROW_RIGHT = "$ICON_PATH/Arrow - Right.png";
  static const String ICON_CHART = "$ICON_PATH/Chart.png";
  static const String ICON_HIDE = "$ICON_PATH/Hide.png";
  static const String ICON_PAPERPLUS = "$ICON_PATH/Paper Plus.png";
  static const String ICON_TICKETSTAR = "$ICON_PATH/Ticket Star.png";
  static const String ICON_2USER = "$ICON_PATH/2 User.png";
  static const String ICON_ARROW_RIGHTSQUARE = "$ICON_PATH/Arrow - Right Square.png";
  static const String ICON_CATEGORY = "$ICON_PATH/Category.png";
  static const String ICON_HEART = "$ICON_PATH/Heart.png";
  static const String ICON_PAPERNEGATIVE = "$ICON_PATH/Paper Negative.png";
  static const String ICON_TICKSQUARE = "$ICON_PATH/Tick Square.png";
  static const String ICON_ACTIVITY = "$ICON_PATH/Activity.png";
  static const String ICON_ARROW_UP2 = "$ICON_PATH/Arrow - Up 2.png";
  static const String ICON_CHAT = "$ICON_PATH/Chat.png";
  static const String ICON_HOME = "$ICON_PATH/Home.png";
  static const String ICON_PAPERUPLOAD = "$ICON_PATH/Paper Upload.png";
  static const String ICON_TICKET = "$ICON_PATH/Ticket.png";
  static const String ICON_ADDUSER = "$ICON_PATH/Add User.png";
  static const String ICON_ARROW_UP3 = "$ICON_PATH/Arrow - Up 3.png";
  static const String ICON_CLOSESQUARE = "$ICON_PATH/Close Square.png";
  static const String ICON_IMAGE2 = "$ICON_PATH/Image 2.png";
  static const String ICON_PAPER = "$ICON_PATH/Paper.png";
  static const String ICON_TIMECIRCLE = "$ICON_PATH/Time Circle.png";
  static const String ICON_ARROW_DOWN2 = "$ICON_PATH/Arrow - Down 2.png";
  static const String ICON_ARROW_UPCIRCLE = "$ICON_PATH/Arrow - Up Circle.png";
  static const String ICON_DANGER = "$ICON_PATH/Danger.png";
  static const String ICON_IMAGE = "$ICON_PATH/Image.png";
  static const String ICON_PASSWORD = "$ICON_PATH/Password.png";
  static const String ICON_TIMESQUARE = "$ICON_PATH/Time Square.png";
  static const String ICON_ARROW_DOWN3 = "$ICON_PATH/Arrow - Down 3.png";
  static const String ICON_ARROW_UPSQUARE = "$ICON_PATH/Arrow - Up Square.png";
  static const String ICON_DELETE = "$ICON_PATH/Delete.png";
  static const String ICON_INFOCIRCLE = "$ICON_PATH/Info Circle.png";
  static const String ICON_PLAY = "$ICON_PATH/Play.png";
  static const String ICON_UNLOCK = "$ICON_PATH/Unlock.png";
  static const String ICON_ARROW_DOWNCIRCLE = "$ICON_PATH/Arrow - Down Circle.png";
  static const String ICON_ARROW_UP = "$ICON_PATH/Arrow - Up.png";
  static const String ICON_DISCOUNT = "$ICON_PATH/Discount.png";
  static const String ICON_INFOSQUARE = "$ICON_PATH/Info Square.png";
  static const String ICON_PLUS = "$ICON_PATH/Plus.png";
  static const String ICON_UPLOAD = "$ICON_PATH/Upload.png";
  static const String ICON_ARROW_DOWNSQUARE = "$ICON_PATH/Arrow - Down Square.png";
  static const String ICON_BAG2 = "$ICON_PATH/Bag 2.png";
  static const String ICON_DISCOVERY = "$ICON_PATH/Discovery.png";
  static const String ICON_LOCATION = "$ICON_PATH/Location.png";
  static const String ICON_PROFILE = "$ICON_PATH/Profile.png";
  static const String ICON_VIDEO = "$ICON_PATH/Video.png";
  static const String ICON_ARROW_DOWN = "$ICON_PATH/Arrow - Down.png";
  static const String ICON_BAG = "$ICON_PATH/Bag.png";
  static const String ICON_DOCUMENT = "$ICON_PATH/Document.png";
  static const String ICON_LOCK = "$ICON_PATH/Lock.png";
  static const String ICON_SCAN = "$ICON_PATH/Scan.png";
  static const String ICON_VOICE2 = "$ICON_PATH/Voice 2.png";
  static const String ICON_ARROW_LEFT2 = "$ICON_PATH/Arrow - Left 2.png";
  static const String ICON_BOOKMARK = "$ICON_PATH/Bookmark.png";
  static const String ICON_DOWNLOAD = "$ICON_PATH/Download.png";
  static const String ICON_LOGIN = "$ICON_PATH/Login.png";
  static const String ICON_SEARCH = "$ICON_PATH/Search.png";
  static const String ICON_VOICE = "$ICON_PATH/Voice.png";
  static const String ICON_ARROW_LEFT3 = "$ICON_PATH/Arrow - Left 3.png";
  static const String ICON_BUY = "$ICON_PATH/Buy.png";
  static const String ICON_EDITSQUARE = "$ICON_PATH/Edit Square.png";
  static const String ICON_LOGOUT = "$ICON_PATH/Logout.png";
  static const String ICON_SEND = "$ICON_PATH/Send.png";
  static const String ICON_VOLUMEDOWN = "$ICON_PATH/Volume Down.png";
  static const String ICON_ARROW_LEFTCIRCLE = "$ICON_PATH/Arrow - Left Circle.png";
  static const String ICON_CALENDAR = "$ICON_PATH/Calendar.png";
  static const String ICON_EDIT = "$ICON_PATH/Edit.png";
  static const String ICON_MESSAGE = "$ICON_PATH/Message.png";
  static const String ICON_SETTING = "$ICON_PATH/Setting.png";
  static const String ICON_VOLUMEOFF = "$ICON_PATH/Volume Off.png";
  static const String ICON_ARROW_LEFTSQUARE = "$ICON_PATH/Arrow - Left Square.png";
  static const String ICON_CALLMISSED = "$ICON_PATH/Call Missed.png";
  static const String ICON_FILTER2 = "$ICON_PATH/Filter 2.png";
  static const String ICON_MORECIRCLE = "$ICON_PATH/More Circle.png";
  static const String ICON_SHIELDDONE = "$ICON_PATH/Shield Done.png";
  static const String ICON_VOLUMEUP = "$ICON_PATH/Volume Up.png";
  static const String ICON_ARROW_LEFT = "$ICON_PATH/Arrow - Left.png";
  static const String ICON_CALLSILENT = "$ICON_PATH/Call Silent.png";
  static const String ICON_FILTER = "$ICON_PATH/Filter.png";
  static const String ICON_MORESQUARE = "$ICON_PATH/More Square.png";
  static const String ICON_SHIELDFAIL = "$ICON_PATH/Shield Fail.png";
  static const String ICON_WALLET = "$ICON_PATH/Wallet.png";
  static const String ICON_ARROW_RIGHT2 = "$ICON_PATH/Arrow - Right 2.png";
  static const String ICON_CALL = "$ICON_PATH/Call.png";
  static const String ICON_FOLDER = "$ICON_PATH/Folder.png";
  static const String ICON_NOTIFICATION = "$ICON_PATH/Notification.png";
  static const String ICON_SHOW = "$ICON_PATH/Show.png";
  static const String ICON_WORK = "$ICON_PATH/Work.png";
  static const String ICON_ARROW_RIGHT3 = "$ICON_PATH/Arrow - Right 3.png";
  static const String ICON_CALLING = "$ICON_PATH/Calling.png";
  static const String ICON_GAME = "$ICON_PATH/Game.png";
  static const String ICON_PAPERDOWNLOAD = "$ICON_PATH/Paper Download.png";
  static const String ICON_STAR = "$ICON_PATH/Star.png";
  static const String ICON_ARROW_RIGHTCIRCL = "$ICON_PATH/Arrow - Right Circle.png";
  static const String ICON_CAMERA = "$ICON_PATH/Camera.png";
  static const String ICON_GRAPH = "$ICON_PATH/Graph.png";
  static const String ICON_PAPERFAIL = "$ICON_PATH/Paper Fail.png";
  static const String ICON_SWAP = "$ICON_PATH/Swap.png";
  static const String ICON_TH = "$ICON_PATH/th.png";
  static const String ICON_EN = "$ICON_PATH/en.png";
}

class ImageAssets {
  // ignore: todo
  // TODO LOCATION
  static const String houseLocation = "$IMAGE_PATH/019-house.png";
  static const String busLocation = "$IMAGE_PATH/005-bus.png";
  static const String carIos = "$IMAGE_PATH/car_ios.png";
  static const String carAdroid = "$IMAGE_PATH/car_android.png";
}

class JsonAssets {
  static const String loading = "$JSON_PATH/LOADING.json";
  static const String error = "$JSON_PATH/ERROR.json";
  static const String empty = "$JSON_PATH/EMPTY.json";

  static const String package = "$JSON_PATH/package.json";
  static const String route = "$JSON_PATH/route.json";
  static const String packaging = "$JSON_PATH/packaging.json";
  static const String location = "$JSON_PATH/location-map.json";
  static const String navigator = "$JSON_PATH/navigation.json";
  static const String approve = "$JSON_PATH/approve.json";
  static const String savefile = "$JSON_PATH/savefile.json";
  static const String upload = "$JSON_PATH/upload-files.json";
  static const String carMoving = "$JSON_PATH/car-moving.json";
  static const String carDriving = "$JSON_PATH/car-driving.json";

  static const String briefcase = "$JSON_PATH/briefcase.json";
  static const String building = "$JSON_PATH/building.json";
  static const String cloud = "$JSON_PATH/cloud-network.json";
  static const String coffee = "$JSON_PATH/coffee-cup.json";
  static const String computer = "$JSON_PATH/computer.json";
  static const String document = "$JSON_PATH/document.json";
  static const String folders = "$JSON_PATH/folders.json";
  static const String goal = "$JSON_PATH/goal.json";
  static const String id = "$JSON_PATH/id.json";
  static const String idea = "$JSON_PATH/idea.json";
  static const String laptop = "$JSON_PATH/laptop.json";
  static const String like = "$JSON_PATH/like.json";
  static const String money = "$JSON_PATH/money-bag.json";
  static const String mouse = "$JSON_PATH/mouse.json";
  static const String note = "$JSON_PATH/note.json";
  static const String notebook = "$JSON_PATH/notebook.json";
  static const String phone = "$JSON_PATH/phone.json";
  static const String presentation = "$JSON_PATH/presentation.json";
  static const String rocket = "$JSON_PATH/rocket.json";
  static const String save = "$JSON_PATH/save-money.json";
  static const String share = "$JSON_PATH/share.json";
  static const String shopping = "$JSON_PATH/shopping-cart.json";
  static const String social = "$JSON_PATH/social-care.json";
  static const String socialMedia = "$JSON_PATH/social-media.json";
  static const String support = "$JSON_PATH/support.json";
  static const String target = "$JSON_PATH/target.json";
  static const String video = "$JSON_PATH/video.json";
  static const String workplace = "$JSON_PATH/workplace.json";
}

class JsonMapStyle {
  static const String style1 = "$STYLE_PATH/map.json";
}

Widget getAnimatedImage(String animationName, {double? width, double? height}) {
  return SizedBox(
    height: height ?? AppSize.s100 * 2,
    width: width ?? AppSize.s100 * 2,
    child: Lottie.asset(animationName),
  );
}

Widget getImage(String animationName, {double? width, double? height, Color? color, bool? showcolor}) {
  return SizedBox(
    height: height ?? AppSize.s100 * 2,
    width: width ?? AppSize.s100 * 2,
    child: Image.asset(
      animationName,
      color: showcolor == null ? null : color ?? AppColors.transparent,
    ),
  );
}
