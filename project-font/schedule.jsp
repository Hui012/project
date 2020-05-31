<%@page import="com.customerize.model.CustVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 	String date = (String)session.getAttribute("date");
	CustVO custVO = (CustVO) request.getAttribute("custVO");

%>
<!doctype html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
    integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
  <!-- 載入 Font Awesome -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js"></script>
  <style>
    * {
      font-family: 微軟正黑體;
    }

    nav.navbar {
      position: fixed;
      top: 0;
      width: 100%;
      z-index: 10;
      opacity: 0.8;
      height: 70px;
    }

    div.container-fluid {
      margin-top: 90px;
    }

    div button.btn {
      width: 100%;
      margin-bottom: 20px;
    }

    /* -----------------行程內容----------------- */
    div.schedule_content {
      width: 100%;
      height: 750px;
      position: relative;
      border: 1px solid black;
      display: block;
      border-radius: 4px;
      box-shadow: 0 0 6px;
    }

    div.schedule_header {
      width: 100%;
      height: 65px;
      position: relative;
      background-color: #E6903B;
      display: block;
    }

    div.schedule_header p {
      font-size: 32px;
      font-weight: bold;
      color: #343434;
      margin-bottom: 0;
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
    }

    div.schedule_header span.plus {
      position: absolute;
      top: 50%;
      right: 1%;
      transform: translate(-50%, -50%);
    }

    div.schedule_body {
      display: block;
      height: calc(100% - 65px);
      position: relative;
      overflow-y: scroll;
    }

    div.schedule_body p.no_schedule {
      font-size: 32px;
      font-weight: bold;
      color: #E0DFDF;
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
    }

    ul {
      list-style: none;
      padding: 0;
    }

    div.detail_block {
      width: 450px;
      height: 150px;
      border: 1px solid black;
      margin-top: 20px;
      font-size: 0;
      box-shadow: 0 0 6px;
      border-radius: 4px;
    }

    div.detail_info {
      border-top: 1px solid black;
      display: block;
      width: 100%;
      height: 69px;
      font-size: 16px;
      word-break:break-all;
    }
    div.detail_info p{
      max-height: 100%;
      word-break:break-all;
      overflow: hidden;
    }

    div.detail_time {
      display: inline-block;
      width: calc(100% - 120px);
      height: 100%;
      font-size: 16px;
      text-align: center;
    }

    div.detail_img {
      display: inline-block;
      vertical-align: bottom;
      width: 120px;
      height: 100%;
    }

    div.detail_img img {
      width: 100%;
      height: 100%;
    }

    div.detail_top {
      width: 100%;
      height: 80px;
    }

    /* -----------------產品內容----------------- */
    div.product_content {
      width: 100%;
      height: 750px;
      position: relative;
      border: 1px solid black;
      border-radius: 4px;
      box-shadow: 0 0 6px;
    }

    div.product_header {
      width: 100%;
      height: 65px;
      position: relative;
      font-size: 32px;
      font-weight: bold;
      color: #343434;
      display: block;
      background-color: #E6903B;
    }

    div.product_header span.product_filter {
      position: absolute;
      top: 50%;
      left: 8%;
      transform: translate(-50%, -50%);
      font-size: 24px;
      font-weight: bold;
      color: #343434;
    }

    div.product_checkbox {
      width: 100%;
      height: 60px;
      position: relative;
      display: block;
      background-color: #E0DFDF;
      /* text-align: center; */
    }

    div.product_body {
      max-width: 100%;
      height: calc(100% - 60px - 65px);
    }

    div.product_body_content {
      overflow-y: scroll;
      width: 100%;
      height: 100%;
      max-width: 100%;
      max-height: 100%;
    }

    div.product_body_content div.card {
      margin-top: 20px;
      box-shadow: 0 0 6px;
    }

    div.btn_model button {
      width: 150px;
      float: right;
      margin: 20px 0 0 15px;
    }

    div.input_title {
      width: 100%;
      height: 75px;
      border-radius: 0 30px 30px 0;
      background-color: #556fff;
      font-size: 32px;
      font-weight: bold;
      color: white;
      text-align: center;
    }
    div.input_title div{
      display: inline-block;
    }

    div.input_title input {
      margin: auto;
      border: 0px solid;
      height: 30px;
      font-size: 24px;
    }

    div#first_row {
      height: 80px;
      margin-bottom: 10px;
    }

    span.love {
      float: right;
    }

    div.card{
      width: 300px;
      height: 370px;
      max-height: 100%;
      margin: auto;
    }

    /* ---------------------搜尋欄---------------------------*/
    div.product_header div.search_area {
      width: 300px;
      white-space: nowrap;
      position: absolute;
      top: 50%;
      right: 0;
      transform: translate(-10%, -50%);
    }

    div.search_area input#search {
      width: 100%;
      height: 40px;
      font-size: 10px;
      color: #63717f;
      padding-left: 10px;
      /* border: solid 1px; */
      /* -webkit-border-radius: 5px;
  -moz-border-radius: 5px; */
      border-radius: 20px;
      display: block;
      border: solid 1px;
      /* -webkit-transition: background .55s ease;
  -moz-transition: background .55s ease;
  -ms-transition: background .55s ease;
  -o-transition: background .55s ease; */
      transition: background .55s ease;
    }

    div.search_area .icon {
      max-width: auto;
      position: absolute;
      top: 50%;
      right: 0;
      transform: translate(-50%, -50%);
      z-index: 1;
      color: #4f5b66;
    }

    .search_area input#search::-webkit-input-placeholder {
      color: #65737e;
    }

    .search_area input#search:-moz-placeholder {
      /* Firefox 18- */
      color: #65737e;
    }

    .search_area input#search::-moz-placeholder {
      /* Firefox 19+ */
      color: #65737e;
    }

    .search_area input#search:-ms-input-placeholder {
      color: #65737e;
    }

    .search_area input#search:hover,
    .search_area input#search:focus,
    .search_area input#search:active {
      outline: none;
      background: #f0f0f0;
    }

    label.label_area {
      font-size: 20px;
      margin-right: 50px;
    }

    label.label_area input {
      display: inline-block;
      top: 3px;
      width: 21px;
      height: 21px;
    }

    label.label_area a {
      display: inline-block;
    }

    div.checkbox_area {
      width: 100%;
      text-align: center;
      /* position: absolute;
      top: 50%;
      right: 50%;
      transform: translate(-50%, -50%); */
    }

    /*---------------------操控none-------------------------*/
    .-none {
      display: none;
    }

    .-on {
      display: none;
    }

    .-bg {
      background-color: #E6903B;
    }
    .-onScroll{
      overflow-y: scroll;
      max-height: 680px;
    }

    /*-----------------------填寫資訊-----------------------*/
    div.overlay_add_schedule {
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100vh;
      background-color: hsla(0, 0%, 0%, .5);
      /* 預設：完全透明；設定 z-index: -1 會在整個頁面的後方，看不到，才不會擋到頁面元素。 */
      opacity: 0;
      z-index: -1;
      /* transition: opacity 1s; */
    }

    div.overlay_add_schedule.-on1 {
      /* 加上 -on1 之後，Modal 漸漸出現，因為有設定 transition */
      opacity: 1;
      z-index: 20;
    }

    div.overlay_add_schedule-opacity-zero {
      /*關閉 Modal 時，先讓 opacity設定0，就會慢慢變成完全透明，但這時會擋到後面的元素，所以要再移除 -on 及 -opacity-zero 這兩個 class */
      opacity: 0;
    }

    /* 元素 article 置中及基本樣式 */
    div.overlay_add_schedule>article {
      background-color: white;
      width: 685px;
      height: 550px;
      /* max-width: 800px; */
      border-radius: 4px;
      box-shadow: 0 6px 6px;
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
    }

    div.overlay_content {
      height: 100%;
    }

    div.overlay_header {
      border-radius: 4px 4px 0px 0px;
      background-color: #E0DFDF;
      height: 70px;
      font-size: 24px;
      font-weight: bold;
      position: relative;
    }

    div.overlay_header p {
      position: absolute;
      top: 50%;
      left: 10%;
      transform: translate(-50%, -50%);
    }

    div.overlay_body {
      position: relative;
      max-width: 100%;
      height: calc(100% - 70px - 70px);
    }

    div.body_content {
      /* border: 1px solid #343434; */
      width: 530px;
      height: 340px;
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      /* text-align: center; */
    }

    div.content_top {
      margin: 20px 34px 0 34px;
    }

    div.content_img {
      width: 150px;
      height: 120px;
      display: inline-block;
    }

    div.content_img img {
      width: 100%;
      height: 100%;
    }

    div.context_title {
      display: inline-block;
      width: calc(100% - 120px - 34px - 34px);
      text-align: center;
      vertical-align: bottom;
    }

    div.context_title p.text {
      font-size: 32px;
      font-weight: bold;
    }

    hr.content_hr {
      width: 460px;
      background-color: #343434;
    }

    p.schedule_info {
      margin: 0 0 5px 34px;
      font-size: 16px;
      font-weight: bold;
      color: #343434;
    }

    div.text_info {
      text-align: center;
    }

    textarea#content_area {
      max-height: 110px;
      min-height: 110px;
      border: 1px solid #556fff;
      width: 460px;
    }

    div.btn_block {
      width: 100%;
      height: 70px;
      position: absolute;
      bottom: 0;
      text-align: center;
    }

    button#btn_confirm {
      background-color: #E6903B;
      width: 150px;
      height: 48px;
      border-radius: 4px;
      color: white;
    }

    button#btn_cancel {
      background-color: #E5B280;
      width: 150px;
      height: 48px;
      margin-right: 10px;
      border-radius: 4px;
      color: white;
    }
    div.last_change span{
      font-size: 20px;
      font-weight: bold;
      color: #343434;
      /* text-decoration: underline; */
    }
    div.update_date{
      width: 300px;
      /* text-decoration: underline; */
      display: inline-block;
    }
    div.change_date{
      display: inline-block;
    }
    div.current_date{
      display: inline-block;
    }
    div.current_date span{
      font-size: 24px;
      font-weight: bold;
      color: #343434;
      cursor: pointer;
      text-decoration: underline;
    }
  </style>
  <!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css"> -->
  <link rel="stylesheet" type="text/css" href="https://npmcdn.com/flatpickr/dist/themes/material_orange.css">
</head>

<body>
  <nav class="navbar navbar-light bg-light">
    <a class="navbar-brand" href="#">
      <!-- <img src="/docs/4.5/assets/brand/bootstrap-solid.svg" width="30" height="30"
                class="d-inline-block align-top" alt="" loading="lazy"> -->
      Tourism
    </a>
  </nav>

  <div class="container-fluid">
    <div class="row" id="first_row">
      <div class="col col-md-3" style="padding: 0;">
        <div class="input_title" data-schedule-id="${custVO.cust_Schedule_ID}">
          <div class="text_title">
            <p class="text_title">請輸入標題 </p>
          </div>
          <div class="edit_title">
            <span class="edit_title"><i class="fas fa-pen" style="font-size: 20px; cursor: pointer;"></i></span>
          </div>
          <input type="text" class="update_title -none">
        </div>
      </div>          
      <div class="col col-md-4" style="padding: 0; text-align: center;">
        <div class="last_change" data-last-time="${custVO.cust_Schedule_Last_Timestamp}">
          <span>最後修改時間：${custVO.cust_Schedule_Last_Timestamp}</span>
          <div class="current_date">
            <span>選擇的日期為：${custVO.cust_Schedule_Start_Time} ～ ${custVO.cust_Schedule_End_Time}</span>
          </div>
          <div class="update_date">
            <input class="-none" type="text" name="date" style="width: 100%;">
          </div>
          <div class="change_date">
            <button class="-none" type="button">更改日期</button>
          </div>
          
        </div>
      </div>
      <div class="col col-md-5">
        <form action="CustController" method="POST">
          <div class="btn_model">
            <button id="btn_share" type="button" class="btn btn-primary btn-lg">分享行程</button>
            <button id="btn_Store" type="button" class="btn btn-primary btn-lg">儲存行程</button>
            <button id="btn_produce" type="submit" class="btn btn-primary btn-lg">產生行程</button>
            <button id="btn_map" type="button" class="btn btn-primary btn-lg">地圖模式</button>
            <input type="hidden" name="action" value="produce_schedule">
            <input id="produce_schedule" type="hidden" name="schedule_data">
          </div>
        </form>
      </div>
  </div>
    <div class="row">
      <div class="col col-md-1">
        <ul class="sum_day" data-start="${custVO.cust_Schedule_Start_Time}" data-end="${custVO.cust_Schedule_End_Time}"
                            data-days="${custVO.cust_Schedule_Total_Day}">
          <!--------------- 動態新增 --------------->
        </ul>
        <div class="add_day">
          <button type="button" class="btn btn-primary btn-lg add_day">新增一天</button>
        </div>
      </div>
      <div class="col col-md-4">
        <div class="schedule_content">

          <div class="schedule_header" data-date="${custVO.cust_Schedule_Start_Time}">
            <p>Day1</p>
            <span class="plus"><i class="fas fa-plus fa-2x"></i></span>
          </div>
          <div class="schedule_body">
            <p class="no_schedule">請加入行程</p>
            <div class="schedule_body_content">

              <ul class="schedule_list" id="schedule_list">
                <!--------------- 動態新增 --------------->

              </ul>

            </div>
          </div>
        </div>
      </div>
      <div class="col col-md-7">
        <div class="product_content">
          <div class="product_header">
            <span class="product_filter"><i class="fas fa-filter"></i>新增條件</span>
            <div class="search_area">
              <input type="search" id="search" placeholder="搜尋..." />
              <span class="icon"><i class="fa fa-search"></i></span>
            </div>
          </div>

          <div class="product_checkbox">
            <div class="checkbox_area">
              <div class="row" style="padding-left: 15px; padding-right: 15px;">
                <div class="col col-md-3">
                  <label class="label_area">
                    <input type="checkbox" name="product_group" value="all" class="checkbox_area">
                    <a>全部</a>
                  </label>
                </div>
                <div class="col col-md-3">
                  <label class="label_area">
                    <input type="checkbox" name="product_group" value="activities" class="checkbox_area">
                    <a>景點</a>
                  </label>
                </div>
                <div class="col col-md-3">
                  <label class="label_area">
                    <input type="checkbox" name="product_group" value="restaurant" class="checkbox_area">
                    <a>美食</a>
                  </label>
                </div>
                <div class="col col-md-3">
                  <label class="label_area">
                    <input type="checkbox" name="product_group" value="accommodation" class="checkbox_area">
                    <a>住宿</a>
                  </label>
                </div>
              </div>
            </div>
          </div>

          <div class="product_body">
            <div class="product_body_content" style="padding-left: 15px; padding-right: 15px;">
              <!--------------- 動態新增 --------------->
            </div>
          </div>
        </div>

      </div>
    </div>
  </div>
  </div>

  <!-- 新增行程的Modal -->
  <div class="overlay_add_schedule">
    <article>
      <div class="overlay_content">
        <div class="overlay_header">
          <p>填寫資訊</p>
        </div>
        <div class="overlay_body">
          <div class="body_content">
            <div class="content_top">
              <div class="content_img">
                <img src="">
              </div>
              <div class="context_title">
                <p class="text"></p>
                <p style="font-size: 16px;"><i class="far fa-clock fa-1x"></i> 建議遊玩時間：<span></span>小時</p>
              </div>
            </div>
            <hr class="content_hr">
            <div class="content_bottom">
              <p class="schedule_info">行程備註</p>
              <div class="text_info">
                <textarea id="content_area" name="content_area" placeholder="最多50個字"></textarea>
              </div>
            </div>
          </div>
        </div>
        <div class="btn_block">
          <button id="btn_cancel" type="button">取消</button>
          <button id="btn_confirm" type="button">確認</button>
        </div>
      </div>
    </article>
  </div>

  <!-- Optional JavaScript -->
  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
    integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous">
  </script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
    integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous">
  </script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
    integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous">
  </script>
  <script src="//ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
  <script>
    $(function () {
     
      init();
      init2();

      /*-----------------------------可按enter------------------------------*/
      $("div.overlay_content").find("textarea#content_area").keyup(function (e) {
        if (e.which == 13) {
          $("div.btn_block button#btn_confirm").click();
        }
      });

      /*-----------------------------筆icon按下去的動作------------------------------*/
      $("span.edit_title").on("click", function(){
        let title = $("p.text_title").text();                       //取得原有的標題
        $("p.text_title").addClass("-none");                        //display:none p標籤
        $("span.edit_title").addClass("-none");                     //display:none 筆icon
        $("input.update_title").removeClass("-none");               //將隱藏的input顯示出來
        $("input.update_title").focus();                            //input一顯示出來時，focus
        $("input.update_title").attr("placeholder", title);         //將原有的標題，加入到input的placeholder
      });

      /*-----------------------------標題input離開的動作------------------------------*/
      $("input.update_title").on("blur", function(){
        let title = $(this).val();                                   //取得輸入的文字 
        $("p.text_title").text(title);                               //將輸入的文字，加入到p標籤，更改文字
        $("p.text_title").removeClass("-none");                      //移除display:none p標籤
        $("span.edit_title").removeClass("-none");                   //移除display:none 筆icon
        $(this).addClass("-none");                                   //display:none input
        
      });
      // $("input.update_title").keyup(function(e){
      //   if (e.which == 13) {
      //     $("div.input_title").click();
      //   }
        
      // });
      /*-----------------------------選取卡片的動作------------------------------*/
      let sort = 0;
      $("div.product_body_content").on("click", "div.card", function () {
        $(this).closest("div.col-lg-4").toggle("-none"); //被選到的卡片display:none
        $("div.overlay_add_schedule").addClass("-on1"); //開啟被隱藏的頁面(填寫資訊頁面)
        $("div.overlay_add_schedule").fadeIn(); //動畫
        $("div.overlay_content").find("textarea#content_area").focus(); //填寫資訊頁面彈出時，focus在輸入框
        let product_ID = $(this).attr("id");
        let product_name = $(this).find("h5").html();
        let product_img = $(this).find("img").attr("src");
        let stay_time = $(this).find("p.stay_time").html();
        $("div.context_title p.text").html(product_name);
        $("div.overlay_add_schedule img").attr("src", product_img);
        $("div.overlay_add_schedule").attr("id", product_ID);
        $("div.context_title span").html(stay_time);
        $("textarea#content_area").val("");



        // let temp2 = $("ul.schedule_list").html()
        // if (temp !== temp2) {
        //   temp = $("ul.schedule_list").html();
        //   let insert = [{
        //     "cust_Schedule_ID": $("div.input_title p").attr("data-schedule-id"),
        //     "product_ID": $(this).attr("data-id"),
        //     "cust_Schedule_Detail_Seq": (sort + 1),
        //     "cust_Schedule_Detail_Date": "2020-04-20",
        //     "cust_Schedule_Detail_Info": "先測試"
        //   }];
        //   $.ajax({
        //     url: "http://localhost:8081/TDA101G1/project/JsonController",
        //     type: "GET",
        //     data: {
        //       "alwaysUpdate": "alwaysUpdate",
        //       "data": JSON.stringify(insert)
        //     },
        //     dataType: "json",
        //     success: function (data) {
        //       $.each(data, function (index, items) {
        //         $("ul.schedule_list").find("li").last().attr("data-detail-id", items
        //           .cust_Schedule_Detail_ID);
        //       });
        //     },
        //     error: function () {
        //       console.log("fail")
        //     },
        //   });
        // }
      });

      /*-----------------------------點選確認的動作------------------------------*/
      $("div.btn_block button#btn_confirm").on("click", function () {
        $("p.no_schedule").addClass("-none");
        $("div.overlay_add_schedule").fadeOut();
        let product_ID = $(this).closest("div.overlay_add_schedule").attr("id");
        let product_name = $(this).closest("div.overlay_add_schedule").find("div.context_title p.text").html();
        let product_img = $(this).closest("div.overlay_add_schedule").find("div.content_img img").attr("src");
        let stay_time = $(this).closest("div.overlay_add_schedule").find("div.context_title span").html();
        let schedule_info = $(this).closest("div.overlay_add_schedule").find("div.overlay_content textarea")
          .val();
        sort += 1;

        let schedule_id = [];
        $("ul.schedule_list").find("li").each(function (index, items) {
          schedule_id.push($(this).attr("id"));
        });

        if (check_Id(schedule_id, product_ID) == false) {         //若為false就是就新增行程到左邊列表中
          scheduleView(product_ID, sort, product_img, product_name, stay_time, schedule_info);
        } else {
          console.log()                                           //若為ture就是等於更新左側的行程備註
          $("div.detail_block").closest("li#" + product_ID).find("div.detail_info p").html(schedule_info);
        }

      });

      /*-----------------------------點選取消的動作------------------------------*/
      // 關閉 Modal
      $("div.btn_block button#btn_cancel").on("click", function () {
        let product_ID = $(this).closest("div.overlay_add_schedule").attr("id");
        $("div.overlay_add_schedule").fadeOut();

        let schedule_id = [];
        $("ul.schedule_list").find("li").each(function (index, items) {
          schedule_id.push($(this).attr("id"));
        });

        if(check_Id(schedule_id, product_ID) == false){         //若為false就是產品列表所點選的動作
          $("div.product_body_content").find("div#" + product_ID).closest("div.col-lg-4").toggle("-none");        
        }                                                       //點選取消時，原選取的卡片，會返回產品列表
      });

      /*-----------------------------新增天數的按鈕------------------------------*/
      $("div.add_day").on("click", function () {
        let last_day_num = parseInt($("ul.sum_day").find("li").last().attr("data-sort")) + 1;     //取最後一個li的天數，然後+1給下一天用
        let last_date = $("ul.sum_day").find("li").last().attr("data-date");                      //取最後一個li的日期
        let millisecond = new Date(last_date).getTime() + (60*60*24*1000);                        //+1天
        let add_date = flatpickr.formatDate(new Date(millisecond), 'Y-m-d');                      //格式化為Y-m-d
        let first_day = $("ul.sum_day").attr("data-start");
        let add_day =
          `<li class="Day` + last_day_num + `"data-sort="` + last_day_num + `"data-date="`+ add_date +`">
            <button type="button" class="btn btn-primary btn-lg">Day` + last_day_num + `</button>
          </li>`;
        if(last_day_num > 10){
          $("ul.sum_day").addClass("-onScroll");
        }else{
          $("ul.sum_day").removeClass("-onScroll");
        }
        $("ul.sum_day").append(add_day);
        $("ul.sum_day").attr("data-days", last_day_num);
        $("div.current_date span").html("選擇的日期為：" + first_day +" ～ "+ add_date);
      });

      /*-----------------------------切換天數的按鈕------------------------------*/
      $("ul.sum_day").on("click", "button", function () {
        let day_number = $("div.schedule_header p").html();                      //取得當前的天數
        let current_data = [];
        take_schedule_list(current_data);                                        //取得行程列表當前資料
        sessionStorage.setItem(day_number, JSON.stringify(current_data));        //存到sessionStorage

        let date = $(this).closest("li").attr("data-date");
        $("div.schedule_header p").text($(this).text());                         //將行程表的天數切換為選取的天數
        $("div.schedule_header").attr("data-date", date);
        $("ul.schedule_list").html("");                                          //先將行程列表清空

        let get_Data = JSON.parse(sessionStorage.getItem($(this).text()));       //取得要切換天數的sessionStorage，把資料印出
        $.each(get_Data, function (index, items) {
          scheduleView(items.product_ID, items.sort, items.product_img, items.product_name, items.stay_time, items.schedule_info);
        });

        //   temp = "";
        init();
        //   $.ajax({
        //     url: "http://localhost:8081/TDA101G1/project/JsonController",
        //     type: "GET",
        //     data: {
        //       "updateSchedule": "updateSchedule"
        //     },
        //     dataType: "json",
        //     success: function (data) {
        //       console.log(data);
        //     }

        



      });

      // $("ul#schedule_list").on("DOMNodeInserted",function(){
      // console.log("新增了")
      // })

      /*-----------------------------點選儲存的按鈕------------------------------*/
      $("button#btn_Store").on("click", function () {
        // let last_time = $("div.last_change").attr("data-last-time");
        // let time = new Date($("div.last_change").attr("data-last-time")).getTime();
        // let current_time = new Date();
        // console.log(time)
        // console.log(current_time)
        let last_data = [];
        let day_number = $("div.schedule_header p").html();                               //取得當前的天數
        take_schedule_list(last_data);                                                    //取得當前天數行程資料
        sessionStorage.setItem(day_number, JSON.stringify(last_data));                    //存入sessionStorage

        let insertData = [];
        let cid = $("div.input_title").attr("data-schedule-id");                          //取得總行程的ID
        $("ul.sum_day").find("li").each(function (index, items) {                         //將所有天數的sessionStorage取出
          let sessionDate = JSON.parse(sessionStorage.getItem("Day" + (index + 1)));
          insertData.push(sessionDate);
        });

        console.log(insertData)
        $.ajax({
          url: "http://localhost:8081/TDA101G1/project/JsonController",
          type: "GET",
          data: {
            "insertSchedule": "insertSchedule",
            "cid": cid,
            "insertData": JSON.stringify(insertData)
          },
          dataType: "json",
          success: function (data) {
            console.log(data);
            alert("儲存成功")
            $.each(data.result, function (index, items) {
              // console.log(index)
              // console.log(items)
            })
          },
          error: function () {
            console.log("fail")
          }
        });


      });

      /*-----------------------------產生行程的按鈕------------------------------*/
      $("button#btn_produce").on("click", function(){
        $("button#btn_Store").click();
        let schedule_id = $("div.input_title").attr("data-schedule-id");
        let title = $("p.text_title").text();
        let first_day = $("ul.sum_day").attr("data-start");
        let last_day = $("ul.sum_day").attr("data-end");
        let total_day = $("ul.sum_day").attr("data-days").toString();
        let schedule_data = JSON.stringify({
          "schedule_data":[{
                            "schedule_id":schedule_id, 
                            "title":title, 
                            "first_day":first_day, 
                            "last_day":last_day, 
                            "total_day":total_day
                            }]});
        $("input#produce_schedule").attr("value", schedule_data);
        console.log(schedule_data)                               

      });








      /*-----------------------------點選行程，修改行程備註------------------------------*/
      $("ul.schedule_list").on("click", "li div.detail_block", function () {
        $("div.overlay_add_schedule").addClass("-on1");
        $("div.overlay_add_schedule").fadeIn();
        $("div.overlay_content").find("textarea#content_area").focus();
        let day_number = $("div.schedule_header p").html();
        let product_ID = $(this).closest("li").attr("id");
        let product_name = $(this).find("div.detail_time p").html();
        let product_img = $(this).find("div.detail_img img").attr("src");
        let stay_time = $(this).find("div.detail_time span").html();
        let schedule_info = $(this).find("div.detail_info p").html();
        let sort = $(this).attr("data-sort");

        $("div.overlay_add_schedule").attr("id", product_ID);
        $("div.context_title p.text").html(product_name);
        $("div.overlay_add_schedule img").attr("src", product_img);
        $("div.context_title span").html(stay_time);
        $("textarea#content_area").val(schedule_info);

      });

      /*-----------------------------刪除行程，點選垃圾桶的icon------------------------------*/
      $("ul.schedule_list").on("click", "li span.trash", function () {
        let schedule_product_id = $(this).closest("li").attr("id");
        $(this).closest("li.schedule_block").remove();
        $("div#"+ schedule_product_id).closest("div.col-lg-4").toggle("-none");

        let current_data = [];
        take_schedule_list(current_data);

        $("ul.schedule_list").html("");
        for (i of current_data) {
          scheduleView(i.product_ID, i.sort, i.product_img, i.product_name, i.stay_time, i.schedule_info);
        }

        // $(this).closest("li.schedule_block").animate({
        //   opacity: 0,
        // },1000, function(){
        //     $(this).remove();

        //     //$(this).next().find("div.row.del").remove();
        //    });

        // $(this).closest("li.schedule_block").fadeOut()
      });

      /*-----------------------------載入日期樣式------------------------------*/ 
      var selectedDate = $("div.update_date input").flatpickr({
                altInput: true,
                altFormat: "Y-m-d",
                dateFormat: "Y/m/d",
                minDate: "today",
                mode: "range",
            });

      /*-----------------------------點選當前日期，可更改日期------------------------------*/
      $("div.current_date span").on("click", function(){
        $("div.current_date span").addClass("-none");
        // $("div.update_date input").removeClass("-none");
        // $("div.change_date button").removeClass("-none");
        $("div.update_date input").fadeIn();
        $("div.change_date button").fadeIn();
      });

      /*-----------------------------更改日期的按鈕------------------------------*/
      $("div.change_date").on("click", function(){
        let data = listDateResult(selectedDate.selectedDates);
        if(data.length == 0 || data == []){                               //若取得的資料為空陣列，則跳出提醒視窗
          // $("input.update_date").focus();
          alert("請輸入日期\u000d若只選一天，請在日期上點兩下")
        }else if(confirm("所有資料即將被刪除\u000d確定要重新選擇日期嗎?")){
          sessionStorage.clear();                                         //清除sessionStorge資料
          $("ul.sum_day").html("");                                       //清除天數
          $("ul.schedule_list").html("");                                 //清除行程列表
          let add_day = "";
          let first_day = "";
          let last_day = "";
          let total_day = "";
          $.each(data, function(index, items){
            switch(index){
              case 0:
                first_day = items;
                break;
              case 1:
                last_day = items;
                break;
              case 2:
              total_day = items;
                break;
            }
          });

          $("ul.sum_day").attr("data-start", first_day, "data-end", last_day, "data-days", );
          $("ul.sum_day").attr("data-end", last_day);
          $("ul.sum_day").attr("data-days", total_day);
          $("div.schedule_header").attr("data-date", first_day);
          $("div.current_date span").html("選擇的日期為：" + first_day +" ～ "+ last_day);

          $("div.current_date span").removeClass("-none");
          $("div.current_date span").fadeIn();
          // $("div.update_date input").addClass("-none");
          // $("div.change_date button").addClass("-none");
          $("div.update_date input").fadeOut();
          $("div.change_date button").fadeOut();

          if(total_day > 10){
            $("ul.sum_day").addClass("-onScroll");
          }else{
            $("ul.sum_day").removeClass("-onScroll");
          }
          
          for(let i = 1; i <= total_day; i++){
            let start_date = flatpickr.formatDate(new Date(first_day), 'Y-m-d');
            console.log(start_date)
            add_day +=
              `<li class="Day` + i + `"data-sort="` + i + `"data-date="`+ start_date +`">
              <button type="button" class="btn btn-primary btn-lg">Day` + i + `</button>
              </li>`;
            first_day = new Date(first_day).getTime(); 
            first_day += (60*60*24*1000);
          }
          $("ul.sum_day").append(add_day);
        }else{
          $("div.current_date span").removeClass("-none");
          $("div.current_date span").fadeIn();
          $("div.update_date input").fadeOut();
          $("div.change_date button").fadeOut();
          $("div.update_date input").val("");
        }
      });

    });
    /*-----------------------------使用者重新選擇天數時用的function------------------------------*/
    function listDateResult(startDateObj) {
      let allDate = [];
      let first_day = "";
      let last_day = "";
      $.each(startDateObj, function(index, items){     //宣告變數承接所有日期
        let time = new Date(items);
        console.log(time)
        if(index == 0){
          first_day = time;
          let flatDate = flatpickr.formatDate(items, 'Y-m-d');
          allDate.push(flatDate);
        }else{
          last_day = time;
          let flatDate = flatpickr.formatDate(items, 'Y-m-d');
          allDate.push(flatDate);
        }
      });

      if(first_day.length != 0 && last_day != ""){
        let total_day = ((last_day - first_day) / (60*60*24*1000)) + 1;       //取得選取的天數
        allDate.push(total_day.toString());
      }
      return allDate;
    };  

    /*-----------------------------讀取產品的動作------------------------------*/
    function init() {
      // $.ajax({
      //   url: "http://localhost:8081/TDA101G1/project/JsonController",
      //   type: "GET",
      //   data: {
      //     "loadProduct": "loadProduct"
      //   },
      //   dataType: "json",
      //   beforeSend: function () {
      //     $("div.product_body_content").html(
      //       '<li style="text-align: center;"><i class="fas fa-spinner fa-spin fa-3x"></i></li>');
      //   },
      //   success: function (data) {
      //     let insertHtml = "";
      //     let items = data.products; //products = server傳回的key
      //     // console.log(items)
      //     $.each(items, function (index, value) {
      //       insertHtml += `<div class="col-6 col-md-6 col-lg-4">
      //                       <div id="` + value.product_ID + `" class="card">
      //                         <img src="https://picsum.photos/200/100/?random=1" class="card-img-top">
      //                         <div class="card-body">
      //                           <h5 class="card-title">` + value.product_Name + `</h5>
      //                           <p class="card-text"><i class="fas fa-map-marker-alt"></i><span> ` + value
      //         .product_Address + `</span></p>
      //                           <span>4.3</span>
      //                           <span><i class="fas fa-star"></i></span>
      //                           <span><i class="fas fa-star"></i></span>
      //                           <span><i class="fas fa-star"></i></span>
      //                           <span><i class="fas fa-star"></i></span>
      //                           <span><i class="fas fa-star"></i></span>
      //                           <span class="love"><i class="far fa-heart fa-2x"></i></span>
      //                         </div>
      //                         <div class="list-group list-group-flush">
      //                           <p class="list-group-item">` + value.product_Intro + `</p>
      //                         </div>
      //                         <p class="stay_time -none">` + value.product_Staytime + `</p>
      //                       </div>
      //                     </div>`
      //     });
      //     $("div.product_body_content").html("<div class='row'>" + insertHtml);

      //   },
      //   error: function () {
      //     alert("fail")
      //   }
      // });

      $.ajax({
        url: "http://localhost:8081/TDA101G1/project/JsonController",
        type: "GET",
        data: {
          "loadProduct": "loadProduct"
        },
        dataType: "json",
        beforeSend: function () {
          $("div.product_body_content").html(
            '<li style="text-align: center;"><i class="fas fa-spinner fa-spin fa-3x"></i></li>');
        },
        success: function (data) {
          let insertHtml = "";
          let items = data.products; //products = server傳回的key
          let product_id = [];
          let schedule_product_id = [];
          $.each(items, function (index, value) {
            product_id.push(value.product_ID);
            insertHtml += `<div class="col-6 col-md-6 col-lg-4">
                            <div id="` + value.product_ID + `" class="card">
                              <img src="https://picsum.photos/200/100/?random=1" class="card-img-top">
                              <div class="card-body">
                                <h5 class="card-title">` + value.product_Name + `</h5>
                                <p class="card-text"><i class="fas fa-map-marker-alt"></i><span> ` + value.product_Address + `</span></p>
                                <span>4.3</span>
                                <span><i class="fas fa-star"></i></span>
                                <span><i class="fas fa-star"></i></span>
                                <span><i class="fas fa-star"></i></span>
                                <span><i class="fas fa-star"></i></span>
                                <span><i class="fas fa-star"></i></span>
                                <span class="love"><i class="far fa-heart fa-2x"></i></span>
                              </div>
                              <div class="list-group list-group-flush">
                                <p class="list-group-item">` + value.product_Intro + `</p>
                              </div>
                              <p class="stay_time -none">` + value.product_Staytime + `</p>
                            </div>
                          </div>`
          });
          $("div.product_body_content").html("<div class='row'>" + insertHtml);
          $("ul.schedule_list").find("li").each(function(index, items){
            schedule_product_id.push($(items).attr("id"));
          })
          for(let i = 0; i < product_id.length; i++){
            if($.inArray(product_id[i], schedule_product_id) != -1){             //若等於-1，就是表示兩邊列表沒有共同的id
              $("div#"+ product_id[i]).closest("div.col-lg-4").addClass("-none");  //反之不等於-1，就是表示兩邊有共同的id，所以要隱藏起來
            }
          }
        },
        error: function () {
          alert("fail")
        }
      });
    }

    /*-----------------------------載入選擇的天數------------------------------*/
    function init2() {
      let add_day = "";
      let millisecond = 60*60*24*1000;
      let first_day = $("ul.sum_day").attr("data-start");
      let last_day = $("ul.sum_day").attr("data-end");
      let total_day = $("ul.sum_day").attr("data-days");
      let time = new Date(first_day).getTime();   

      if(total_day > 10){
        $("ul.sum_day").addClass("-onScroll");
      }else{
        $("ul.sum_day").removeClass("-onScroll");
      }

      for (let i = 1; i <= total_day; i++) {
        let start_date = flatpickr.formatDate(new Date(time), 'Y-m-d');
        add_day +=
        `<li class="Day` + i + `"data-sort="` + i + `"data-date="`+ start_date +`">
          <button type="button" class="btn btn-primary btn-lg">Day` + i + `</button>
          </li>`;
        time += millisecond;
        }
      $("ul.sum_day").append(add_day);
    }

    /*----------------------------------新增行程區塊----------------------------*/

    function scheduleView(product_ID, sort, product_img, product_name, stay_time, schedule_info) {
      let insertHtml =
        `<li class="schedule_block" id="` + product_ID + `"data-sort="` + sort + `" style="padding-left: 15px; padding-right: 15px;">
                          <div class="row" style="padding-left: 15px; padding-right: 15px;">
                            <div class="col col-md-10">
                                <div class="row del" style="padding-left: 15px; padding-right: 15px; margin-top: 20px;">
                                <div class="col col-md-6">
                                  <span><i class="fas fa-car-side fa-2x"></i></span>
                                  <span>25KM</span>
                                </div>
                                <div class="col col-md-6" >
                                  <span><i class="fas fa-arrow-down fa-2x"></i></span>
                                </div>
                              </div>

                              <div class="detail_block">
                                <div class="detail_top">
                                  <div class="detail_img">
                                    <img src="` + product_img + `">
                                  </div>
                                  <div class="detail_time">
                                    <p style="font-size: 24px">` + product_name + `</p>
                                    <p><i class="far fa-clock"></i> 建議遊玩時間：<span>` + stay_time + `</span>小時</p>
                                  </div>
                                </div>
                                <div class="detail_info">
                                  <p>` + schedule_info + `</p>
                                </div>
                              </div>

                            </div>
                            
                            <div class="col col-md-1 align-self-center" style="margin-top:50px;">
                              <span class="trash"><i class="fas fa-trash-alt fa-2x"></i></span>
                            </div>
                            <div class="col col-md-1 align-self-center" style="margin-top:50px;">
                              <span><i class="fas fa-bars fa-2x"></i></span>
                            </div>
                          </div>
                        </li>`;

      let no_km = `<li class="schedule_block" id="` + product_ID + `"data-sort="` + sort + `" style="padding-left: 15px; padding-right: 15px;">
                          <div class="row" style="padding-left: 15px; padding-right: 15px;">
                            <div class="col col-md-10">
                              <div class="detail_block">
                                <div class="detail_top">
                                  <div class="detail_img">
                                    <img src="` + product_img + `">
                                  </div>
                                  <div class="detail_time">
                                    <p style="font-size: 24px">` + product_name + `</p>
                                    <p><i class="far fa-clock"></i> 建議遊玩時間：<span>` + stay_time + `</span>小時</p>
                                  </div>
                                </div>
                                <div class="detail_info">
                                  <p>` + schedule_info + `</p>
                                </div>
                              </div>
                            </div>
                            <div class="col col-md-1 align-self-center">
                              <span class="trash"><i class="fas fa-trash-alt fa-2x"></i></span>
                            </div>
                            <div class="col col-md-1 align-self-center">
                              <span><i class="fas fa-bars fa-2x"></i></span>
                            </div>
                          </div>
                        </li>`;

      if ($("ul.schedule_list").find("li").hasClass("schedule_block")) {
        $("ul.schedule_list").append(insertHtml);
      } else {
        $("ul.schedule_list").append(no_km);
      }
    }
    /*--------------------------------取得行程列表的當前資訊------------------------------*/
    function take_schedule_list(array) {
      $("ul.schedule_list").find("li").each(function (index, items) { //讀取當前天數的內容，儲存於current_data
        let date = $("div.schedule_header").attr("data-date");
        let product_ID = $(this).attr("id");
        let product_name = $(this).find("div.detail_time p").html();
        let product_img = $(this).find("div.detail_img img").attr("src");
        let stay_time = $(this).find("div.detail_time span").html();
        let schedule_info = $(this).find("div.detail_info p").html();
        let sort = $(this).attr("data-sort");
        let currentData = {
          "date": date,
          "product_ID": product_ID,
          "product_name": product_name,
          "product_img": product_img,
          "stay_time": stay_time,
          "sort": sort,
          "schedule_info": schedule_info
        };
        array.push(currentData);
      });
    }

    /*------------------檢查當前行程列表全部的ID是否跟彈跳視窗的產品ID相同-------------------*/
    function check_Id(schedule_id, product_id){
          if (schedule_id.length != 0) {
            for (j of schedule_id) {
              if (j === product_id) {
                return true;
              }
            }
          }
          return false
        }
    /*----------------------------------檢查兩個陣列裡物件的內容----------------------------*/
    function checkArray(arrayA, arrayB) {
      if (!Array.isArray(arrayA) || !Array.isArray(arrayB)) {
        return false;
      } else if (arrayA.length != arrayB.length) {
        return false;
      } else {
        for (var i = 0; i < arrayA.length; i++) {
          console.log("進迴圈")
          if (arrayA[i].product_ID !== arrayB[i].product_ID || arrayA[i].schedule_info !== arrayB[i].schedule_info) {
            console.log("不一樣") //依照物件內的name自行更改
            return false;
            break;
          }
        }
      }
    }
    
  </script>
</body>

</html>