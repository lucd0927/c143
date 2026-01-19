import 'package:c143/tw_base/tw_gj/logC143.dart';
import 'package:c143/tw_base/tw_http/http_dioC143.dart';
import 'package:c143/tw_hive/twhiveC143.dart';

class TwMaiDiannnn {
  static event_launch_first() {
    TwHttpDio().buryPoint(moistValue: "event_launch_first");
  }

  //ad_impression (是否展示开屏广告：0 = 否，1 = 是)
  static event_launch_non_first(String value) {
    TwHttpDio().buryPoint(
      moistValue: "event_launch_non_first",
      veinKey: "ad_impression",
      veinKeyValue: value,
    );
  }

  static natural_user(String value) {
    TwHttpDio().buryPoint(
      moistValue: "natural_user",
      veinKey: "network",
      veinKeyValue: value,
    );
  }

  static session() {
    Future.delayed(Duration(milliseconds: 0), () async {
      TwHttpDio().buryPoint(moistValue: "session");
    });
  }

  static install() {
    String key = "xxadfc143";
    var box = TwHive.box;
    var data = box.get(key);

    twLooog("====install=has request:$data");
    if (data == null) {
      Future.delayed(Duration(milliseconds: 0), () async {
        // SSHttpDio().buryPoint(moistValue: "install");
        var tmpData = await TwHttpDio().buryPoint(moistValue: "install");
        if (tmpData != null) {
          TwMaiDiannnn.event_launch_first();
          box.put(key, true);
        }
      });
    }
  }

  static launch_page() {
    TwHttpDio().buryPoint(moistValue: "launch_page");
  }

  static cloak_req() {
    TwHttpDio().buryPoint(moistValue: "cloak_req");
  }

  //cloak_user：【0】【1】，对应【黑名单用户】【自然量用户】
  static cloak_suc(String value) {
    TwHttpDio().buryPoint(
      moistValue: "cloak_suc",
      veinKey: "cloak_user",
      veinKeyValue: value,
    );
  }

  static af_req() {
    TwHttpDio().buryPoint(moistValue: "af_req");
  }

  //adj_user:[0] [1]   【0】为A包用户、【1】为B包用户
  static af_suc(String value) {
    TwHttpDio().buryPoint(
      moistValue: "af_suc",
      veinKey: "adj_user",
      veinKeyValue: value,
    );
  }

  // page_index（页面序号1-7）
  static guide_page_view(String value) {
    TwHttpDio().buryPoint(
      moistValue: "guide_page_view",
      veinKey: "page_index",
      veinKeyValue: value,
    );
  } // page_index（页面序号1-7）

  static guide_click_claim(String value) {
    TwHttpDio().buryPoint(
      moistValue: "guide_click_claim",
      veinKey: "page_index",
      veinKeyValue: value,
    );
  }

  static guide_water_tap() {
    TwHttpDio().buryPoint(moistValue: "guide_water_tap");
  }

  static guide_fertilizer_tap() {
    TwHttpDio().buryPoint(moistValue: "guide_fertilizer_tap");
  }

  static guide_quiz_start() {
    TwHttpDio().buryPoint(moistValue: "guide_quiz_start");
  }

  //tree_level（当前树木等级）
  static home_view(String value) {
    TwHttpDio().buryPoint(
      moistValue: "home_view",
      veinKey: "tree_level",
      veinKeyValue: value,
    );
  }

  static water_click() {
    TwHttpDio().buryPoint(moistValue: "water_click");
  }

  // source（免费/广告）
  static fertilizer_click(String value) {
    TwHttpDio().buryPoint(
      moistValue: "fertilizer_click",
      veinKey: "source",
      veinKeyValue: value,
    );
  }

  // bubble_type（cash/sun/flower）
  static bubble_click(String value) {
    TwHttpDio().buryPoint(
      moistValue: "bubble_click",
      veinKey: "bubble_type",
      veinKeyValue: value,
    );
  }

  static leaderboard_view() {
    TwHttpDio().buryPoint(moistValue: "leaderboard_view");
  }

  static cash_rain_start() {
    TwHttpDio().buryPoint(moistValue: "cash_rain_start");
  }

  static quiz_start() {
    TwHttpDio().buryPoint(moistValue: "quiz_start");
  }

  // is_correct（是否正确）
  static quiz_answer(String value) {
    TwHttpDio().buryPoint(
      moistValue: "quiz_answer",
      veinKey: "is_correct",
      veinKeyValue: value,
    );
  }

  //reward_amount（奖励金额）
  static quiz_reward(String value) {
    TwHttpDio().buryPoint(
      moistValue: "quiz_reward",
      veinKey: "reward_amount",
      veinKeyValue: value,
    );
  }

  static spin_view() {
    TwHttpDio().buryPoint(moistValue: "spin_view");
  }

  static spin_click() {
    TwHttpDio().buryPoint(moistValue: "spin_click");
  }

  // reward_type（奖励类型）
  static spin_result(String value) {
    TwHttpDio().buryPoint(
      moistValue: "spin_result",
      veinKey: "reward_type",
      veinKeyValue: value,
    );
  }

  static spin_ad_boost() {
    TwHttpDio().buryPoint(moistValue: "spin_ad_boost");
  }

  static spin_daily_task_claim(String value) {
    TwHttpDio().buryPoint(
      moistValue: "spin_daily_task_claim",
      veinKey: "reward_type",
      veinKeyValue: value,
    );
  }

  // balance（当前余额）
  static cash_page_view(String value) {
    TwHttpDio().buryPoint(
      moistValue: "cash_page_view",
      veinKey: "balance",
      veinKeyValue: value,
    );
  }

  static cash_withdraw_click() {
    TwHttpDio().buryPoint(moistValue: "cash_withdraw_click");
  }

  static withdraw_v() {
    TwHttpDio().buryPoint(moistValue: "withdraw_v");
  }

  static withdraw_c() {
    TwHttpDio().buryPoint(moistValue: "withdraw_c");
  }

  static zero_fee_v() {
    TwHttpDio().buryPoint(moistValue: "zero_fee_v");
  }

  static zero_fee_c() {
    TwHttpDio().buryPoint(moistValue: "zero_fee_c");
  }

  static unlock_high() {
    TwHttpDio().buryPoint(moistValue: "unlock_high");
  }

  static notification_pro_show_f() {
    TwHttpDio().buryPoint(moistValue: "notification_pro_show_f");
  }

  static notification_granted_f() {
    TwHttpDio().buryPoint(moistValue: "notification_granted_f");
  }

  static notification_denied_f() {
    TwHttpDio().buryPoint(moistValue: "notification_denied_f");
  }

  // prompt_type（新用户/老用户）
  static notification_prompt_show(String value) {
    TwHttpDio().buryPoint(
      moistValue: "notification_prompt_show",
      veinKey: "prompt_type",
      veinKeyValue: value,
    );
  }

  static notification_granted() {
    TwHttpDio().buryPoint(moistValue: "notification_granted");
  }

  static notification_denied() {
    TwHttpDio().buryPoint(moistValue: "notification_denied");
  }

  static push() {
    TwHttpDio().buryPoint(moistValue: "push");
  }

  static inform_c(String value) {
    TwHttpDio().buryPoint(
      moistValue: "inform_c",
      veinKey: "type",
      veinKeyValue: value,
    );
  }

  static push_status() {
    TwHttpDio().buryPoint(moistValue: "push_status");
  }

  //ad_code_id/ad_format/ad_platform
  static ad_request({
    required String ad_code_id,
    required String ad_format,
    required String ad_platform,
  }) {
    TwHttpDio().buryPoint(
      moistValue: "ad_request",
      veinKey: "ad_code_id",
      veinKeyValue: ad_code_id,
      veinKey2: "ad_format",
      veinKeyValue2: ad_format,
      veinKey3: "ad_platform",
      veinKeyValue3: ad_platform,
    );
  }

  static cuvxv_ad_return({
    required String ad_code_id,
    required String ad_format,
    required String ad_platform,
  }) {
    TwHttpDio().buryPoint(
      moistValue: "cuvxv_ad_return",
      veinKey: "ad_code_id",
      veinKeyValue: ad_code_id,
      veinKey2: "ad_format",
      veinKeyValue2: ad_format,
      veinKey3: "ad_platform",
      veinKeyValue3: ad_platform,
    );
  }

  static cuvxv_ad_return_fail({
    required String ad_code_id,
    required String ad_format,
    required String ad_platform,
    required String reason,
  }) {
    TwHttpDio().buryPoint(
      moistValue: "cuvxv_ad_return_fail",
      veinKey: "ad_code_id",
      veinKeyValue: ad_code_id,
      veinKey2: "ad_format",
      veinKeyValue2: ad_format,
      veinKey3: "ad_platform",
      veinKeyValue3: ad_platform,
      veinKey4: "reason",
      veinKeyValue4: reason,
    );
  }

  static cuvxv_ad_chance({required String veinKeyValue}) {
    TwHttpDio().buryPoint(
      moistValue: "cuvxv_ad_chance",
      veinKey: "ad_pos_id",
      veinKeyValue: veinKeyValue,
    );
  }

  // ad_pos_id、reason、ad_platform
  // "ad_pos_id：广告位名称
  // reason：
  // -ad_nocache：表示无广告缓存
  // -nonetwork：无网络
  // -impfail：展示失败（可能突然死机、卡顿、崩溃或其他问题导致展示失败）
  // -uninitialized：未初始化广告SDK
  // -notPrepared：广告未准备好"
  static cuvxv_ad_impression_fail({
    required String ad_pos_id,
    required String reason,
    required String ad_platform,
  }) {
    TwHttpDio().buryPoint(
      moistValue: "cuvxv_ad_impression_fail",
      veinKey: "ad_pos_id",
      veinKeyValue: ad_pos_id,
      veinKey2: "reason",
      veinKeyValue2: reason,
      // veinKey3: "ad_platform",
      // veinKeyValue3: ad_platform,
    );
  }

  static cuvxv_ad_imp_close({
    required String ad_code_id,
    required String ad_pos_id,
    required String ad_format,
  }) {
    TwHttpDio().buryPoint(
      moistValue: "cuvxv_ad_imp_close",
      veinKey: "ad_code_id",
      veinKeyValue: ad_code_id,
      veinKey2: "ad_format",
      veinKeyValue2: ad_format,
      veinKey3: "ad_pos_id",
      veinKeyValue3: ad_pos_id,
    );
  }

  // ad_platform、ad_init_time
  static cuvxv_ad_initsuc({
    required String ad_init_time,
    required String ad_platform,
  }) {
    TwHttpDio().buryPoint(
      moistValue: "cuvxv_ad_initsuc",
      veinKey: "ad_init_time",
      veinKeyValue: ad_init_time,
      veinKey2: "ad_platform",
      veinKeyValue2: ad_platform,
    );
  }
}
