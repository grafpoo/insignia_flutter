/*
 * Copyright 2018 Eric Windmill. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:flutter/material.dart';
import 'package:insignia_flutter/shared_lib.dart';

class PageContainer extends PageContainerBase {
  final PageType pageType;

  PageContainer({Key key, @required this.pageType}) : super(key: key);
  @override
  Widget get menuDrawer => AppMenu();

  @override
  String get pageTitle {
    switch (pageType) {
      case PageType.Study:
        return "Study Time";
      case PageType.Settings:
        return "My Settings";
        break;
      case PageType.Quiz:
        return "Test Your Knowledge";
      case PageType.Browse:
      default:
        return "Browse and Filter";
    }
  }

  @override
  Widget get body {
    var page;
    switch (pageType) {
      case PageType.Study:
        page = StudyPage(0, "All");
        break;
      case PageType.Settings:
        page = UserSettingsPage();
        break;
      case PageType.Browse:
        page = BrowsePage();
        break;
      case PageType.Quiz:
      default:
        page = QuizPage();
    }
    return Padding(
      padding: EdgeInsets.all(Spacing.matGridUnit()),
      child: page,
    );
  }

  @override
  Widget get background => Container();

  @override
  Color get backgroundColor => AppColors.background;
}

/**
class ProductDetailPageContainer extends PageContainerBase {
  final Product product;

  ProductDetailPageContainer({@required this.product});

  @override
  Widget get body => ProductDetailPage(product: product);

  @override
  String get pageTitle => "";

  @override
  Widget get menuDrawer => null;

  @override
  Widget get background => BackgroundImage(
        key: PageStorageKey(product),
        imageTitle: _getImageForCategory,
      );

  ImageTitle get _getImageForCategory =>
      categoriesToImageMap[product.category.name];

  @override
  Color get backgroundColor => Colors.transparent;
}
**/