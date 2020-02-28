import 'dart:convert';

import 'package:coolapk_flutter/network/dio_setup.dart';
import 'package:coolapk_flutter/network/model/main_init.model.dart';

class MainApi {
  static Future<MainInitModel> getInitConfig() async {
    return MainInitModel.fromJson(
      (await Network.apiDio.get("/main/init")).data,
    );
  }

  // 获取产品信息
  // 返回的内容 主要字段
  /*
   * alias_title
   * allow_rating
   * config_num // 不同的手机规格
   * configRows
   *  -> cpu
   *  -> id
   *  -> fingerpoint_type=前置指纹识别
   *  -> phone_material=陶瓷机身+金属中框
   *  -> ram=6GB
   *  -> screen_material=
   *  -> price=2599 // 多少钱
   *  -> title=小米6（陶瓷尊享版） // 主要显示内容
   * coverArr
   *  -> ["图片地址@123x321.jpg"]
   * description
   * entityId
   * entityType
   * feed_answer_num
   * feed_article_num=89
   * feed_comment_num=49398
   * feed_review_num=0
   * feed_trade_num=915
   * feed_video_num=27
   * follow_num=24555
   * hot_num=578472
   * hot_num_txt=57.8w // 热度
   * is_recommend=1 // 是否推荐
   * link_tag=小米6
   * logo= // logo地址
   * price_currency=￥ // 单位类型
   * price_max=2409
   * price_min=2109
   * rating_average_score=9.3 // 这个是分数 平均分？
   * rating_average_score_1=9.3
   *  ...>
   * rating_average_score_10=xx
   * rating_total_num=1639 // 上面是分数分布 这个是总分数
   * recent_follow_list // 最近关注清单
   *  -> entityType=user
   *  -> uid=863840
   *  -> userAvatar=http://avatar.coolapk.com/data/000/86/38/40_avatar_middle.jpg?1577117704
   *  -> userInfo
   *    -> xxx
   * status=1 //
   * tabList // tab 划重点 获取评论啥啥啥的链接来自这里
   * tagArr // [玻璃机身] 啥的
   * title // 机子名称
   * userAction // 登录才有
   * star_[1-5]_count=123123 // 点评 各个分段的人数
   * star_total_count // 点评总人数
   * star_average_score=9.3
   */
  static Future<dynamic> getProductDetail(String id) async {
    final resp = await Network.apiDio.get("/product/detail", queryParameters: {
      "id": id,
    });
    return resp.data["data"];
  }

  // 获取设备某个规格的详细数据
  static Future<dynamic> getProductConfig() async {}
}
