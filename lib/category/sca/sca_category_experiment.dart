import 'package:daily_coding/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:daily_coding/model/article_item.dart';

List<ArticleItem> buildExperimentArticleItems(
    BuildContext context, String codePath) {
  return [
    ArticleItem(
      icon: Icons.accessibility,
      title: 'Readme',
      subtitle: 'Readme',
      keyword: 'Readme',
      onTap: () {
        onArticleTap(context, "/demoDetail/Readme", codePath + 'readme.md',
            codePath: codePath + 'readme.py');
      },
    ),
    ArticleItem(
      icon: Icons.accessibility,
      title: '差分攻击DPA与汉明重量简介',
      subtitle: '差分攻击DPA与汉明重量简介',
      keyword: 'dpa_and_hamming_weight',
      onTap: () {
        onArticleTap(context, "/demoDetail/差分攻击DPA与汉明重量简介",
            codePath + 'dpa_and_hamming_weight.md',
            codePath: codePath + 'dpa_and_hamming_weight.py');
      },
    ),
    ArticleItem(
      icon: Icons.accessibility,
      title: 'DPA攻击理论基础:信噪比',
      subtitle: 'DPA攻击理论基础:信噪比',
      keyword: 'snr',
      onTap: () {
        onArticleTap(context, "/demoDetail/DPA攻击理论基础:信噪比", codePath + 'snr.md',
            codePath: codePath + 'snr.py');
      },
    ),
    ArticleItem(
      icon: Icons.accessibility,
      title: '简单能量攻击',
      subtitle: '简单能量攻击',
      keyword: 'spa',
      onTap: () {
        onArticleTap(context, "/demoDetail/简单能量攻击", codePath + 'spa.md',
            codePath: codePath + 'spa.py');
      },
    ),
    ArticleItem(
      icon: Icons.accessibility,
      title: 'AES破解',
      subtitle: 'AES破解',
      keyword: 'aes_crack',
      onTap: () {
        onArticleTap(context, "/demoDetail/AES破解", codePath + 'aes_crack.md',
            codePath: codePath + 'aes_crack.py');
      },
    ),
    ArticleItem(
      icon: Icons.accessibility,
      title: '时钟Glitch攻击',
      subtitle: '时钟Glitch攻击',
      keyword: 'glitch',
      onTap: () {
        onArticleTap(context, "/demoDetail/时钟Glitch攻击", codePath + 'glitch.md',
            codePath: codePath + 'glitch.py');
      },
    ),
    ArticleItem(
      icon: Icons.accessibility,
      title: '手动CPA攻击',
      subtitle: '手动CPA攻击',
      keyword: 'cpa',
      onTap: () {
        onArticleTap(context, "/demoDetail/手动CPA攻击", codePath + 'manual_cpa.md',
            codePath: codePath + 'manual_cpa.py');
      },
    ),
  ];
}
