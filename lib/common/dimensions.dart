class Dimensions {
  static double screenHeight = 1000;
  static double screenWidth = 0;

  static get screenHeight1 => screenHeight;

  static double get aspectRatio => screenHeight1 / 80.0;

  static double get widthAspectRatio => screenWidth / 39.0;

  //dynamic height
  static double height10 = screenHeight1 / 84.4;
  static double height15 = screenHeight1 / 56.27;
  static double height20 = screenHeight1 / 42.2;
  static double height30 = screenHeight1 / 28.13;
  static double height40 = screenHeight1 / 21.1;
  static double height45 = screenHeight1 / 18.76;

  //dynamic width margin and padding
  static double width10 = screenHeight1 / 84.4;
  static double width15 = screenHeight1 / 56.27;
  static double width20 = screenHeight1 / 42.2;
  static double width30 = screenHeight1 / 28.13;

  //Slider Don Size
  static double slideDotHeight = screenHeight1 / 98.2;

  static double font12 = screenHeight1 / 70.33;
  static double font14 = screenHeight1 / 63.14;
  static double font16 = screenHeight1 / 52.75;
  static double font20 = screenHeight1 / 42.2;
  static double font22 = screenHeight1 / 38.36;
  static double font26 = screenHeight1 / 32.46;

  //Border Radius
  static double radius15 = screenHeight1 / 56.27;
  static double radius20 = screenHeight1 / 42.2;
  static double radius30 = screenHeight1 / 28.13;

  //Icon Size
  static double iconSize24 = screenHeight1 / 35.17;
  static double iconSize16 = screenHeight1 / 52.75;

  /*static setScreenSize(double height) {
    screenHeight1 = height;
  }*/

  static double getHeight(height) {
    if (screenHeight1 > 720 && screenHeight1 <= 950) {
      return aspectRatio * height;
    } else if (screenHeight1 > 950) {
      return height * 9.5;
    } else {
      return  height * 7.2;
    }
  }

  static double getWidth(height) {
    if (screenHeight1 > 720 && screenHeight1 <= 950) {
      return aspectRatio / height;
    } else if (screenHeight1 > 950) {
      return height / 9.5;
    } else {
      return  height / 7.2;
    }
  }

  static double getFontSize(size) {
    if (screenHeight1 > 720 && screenHeight1 <= 950) {
      return aspectRatio * size;
    } else if (screenHeight1 > 950) {
      return size * 9.5;
    } else {
      return  size * 7.2;
    }
  }

  static double getIconSize(size) {
    if (screenHeight1 > 720 && screenHeight1 <= 950) {
      return aspectRatio * size;
    } else if (screenHeight1 > 950) {
      return size * 9.5;
    } else {
      return  size * 7.2;
    }
  }

  static double getBorderRadius(size) {
    if (screenHeight1 > 720 && screenHeight1 <= 950) {
      return aspectRatio * size;
    } else if (screenHeight1 > 950) {
      return size * 9.5;
    } else {
      return  size * 7.2;
    }
  }
}
