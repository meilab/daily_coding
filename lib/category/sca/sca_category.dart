import 'package:daily_coding/utils/utils.dart';
import 'package:daily_coding/model/article_item.dart';
import 'package:flutter/material.dart';

import 'sca_category_experiment.dart';
import 'sca_category_firmware.dart';
import 'sca_category_ml.dart';
import 'sca_category_theory.dart';

List<ArticleCategoryInfo> scaCategoryList = [
  ArticleCategoryInfo(
    name: "Firmware",
    subName: '目标板固件',
    icon: 'assets/images/stack.png',
    articleFolder: 'lib/category/sca/firmware/',
    buildFunc: buildFirmwareArticleItems,
  ),
  ArticleCategoryInfo(
    name: '侧信道攻击理论',
    subName: '差分攻击，基于深度学习的侧信道攻击',
    icon: 'assets/images/opacity.png',
    articleFolder: 'lib/category/sca/theory/',
    buildFunc: buildTheoryArticleItems,
  ),
  ArticleCategoryInfo(
    name: '基于深度学习的侧信道攻击',
    subName: '全联接网络，卷积网络等基于深度学习的侧信道攻击',
    icon: 'assets/images/opacity.png',
    articleFolder: 'lib/category/sca/ml/',
    buildFunc: buildMlArticleItems,
  ),
  ArticleCategoryInfo(
    name: '侧信道攻击实验',
    subName: '侧信道攻击的基础操作与实验',
    icon: 'assets/images/opacity.png',
    articleFolder: 'lib/category/sca/experiment/',
    buildFunc: buildExperimentArticleItems,
  ),
];

List<ArticleItemCategory> buildScaCategoryList(BuildContext context) =>
    scaCategoryList.map((item) {
      return buildCategoryCard(context, item, '');
    }).toList();
