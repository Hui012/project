<%@page import="com.customerize.model.CustVO"%>
<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%
	//String date = (String)session.getAttribute("date");
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
      margin-top: 20px;
    }

    /* -----------------行程內容----------------- */
    div.schedule_content {
      width: 100%;
      height: 750px;
      position: relative;
      border: 1px solid black;
      display: block;
      border-radius: 4px;
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
      height: calc(100% -80px);
      font-size: 16px;
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

    div.input_title input {

      border: 0px solid;
    }

    div#first_row div {
      height: 80px;
      margin-bottom: 10px;
    }

    span.love {
      float: right;
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
      border: 1px solid #343434;
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
    div.context_title p.text{
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

  </style>
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
        <div class="input_title">
          <p data-schedule-id="${custVO.cust_Schedule_ID}" data-last-time="${custVO.cust_Schedule_Last_Timestamp}"></span>請輸入標題 <span><i class="fas fa-pen" style="font-size: 20px;"></i></p>
          <input type="text" class="title_update -none">

        </div>
      </div>
      <div class="col col-md-9">
        <div class="btn_model">
          <button id="btn_share" type="button" class="btn btn-primary btn-lg">分享行程</button>
          <button id="btn_Store" type="button" class="btn btn-primary btn-lg">儲存行程</button>
          <button id="btn_produce" type="button" class="btn btn-primary btn-lg">產生行程</button>
          <button id="btn_map" type="button" class="btn btn-primary btn-lg">地圖模式</button>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col col-md-1">
        <input class="update_date" type="date" name="date" style="width: 100%;">
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

          <div class="schedule_header">
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

      /*-----------------------------選取卡片的動作------------------------------*/
      let temp = "";
      let sort = 0;
      $("div.product_body_content").on("click", "div.card", function () {
        $(this).closest("div.col-lg-4").toggle("-none");
        $("div.overlay_add_schedule").addClass("-on1");
        $("div.overlay_add_schedule").fadeIn();
        let product_ID = $(this).attr("id");
        let product_name = $(this).find("h5").html();
        let product_img = $(this).find("img").attr("src");
        let stay_time = $(this).find("p.stay_time").html();
        $("div.context_title p.text").html(product_name);
        $("div.overlay_add_schedule img").attr("src", product_img);
        $("div.overlay_add_schedule").attr("data-product-id", product_ID);
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
      $("div.btn_block button#btn_confirm").on("click", function(){ 
        $("p.no_schedule").addClass("-none");
        $("div.overlay_add_schedule").fadeOut();
        let product_ID = $(this).closest("div.overlay_add_schedule").attr("data-product-id");
        let product_name = $(this).closest("div.overlay_add_schedule").find("div.context_title p.text").html();
        let product_img = $(this).closest("div.overlay_add_schedule").find("div.content_img img").attr("src");
        let stay_time = $(this).closest("div.overlay_add_schedule").find("div.context_title span").html();
        let schedule_info = $(this).closest("div.overlay_add_schedule").find("div.overlay_content textarea").val();
        console.log(product_ID)
        console.log(product_name)
        console.log(product_img)
        console.log(stay_time)
        console.log(schedule_info)
        sort += 1;
        let insertHtml =
          `<li class="schedule_block" data-product-id="` + product_ID + `" data-sort="` + sort + `" style="padding-left: 15px; padding-right: 15px;">
                          <div class="row" style="padding-left: 15px; padding-right: 15px;">
                            <div class="col col-md-10">
                              <div class="row" style="padding-left: 15px; padding-right: 15px; margin-top: 20px;">
                                <div class="col col-md-6">
                                  <span><i class="fas fa-car-side fa-2x"></i></span>
                                  <span>25KM</span>
                                </div>
                                <div class="col col-md-6">
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
                                    <p><i class="far fa-clock"></i><span> 建議遊玩時間：` + stay_time + `小時</span></p>
                                  </div>
                                </div>
                                <div class="detail_info">
                                  <p>`+schedule_info+`</p>
                                </div>
                              </div>

                            </div>

                            <div class="col col-md-1 align-self-center"  style="margin-top: 50px;">
                              <span class="trash"><i class="fas fa-trash-alt fa-2x"></i></span>
                            </div>
                            <div class="col col-md-1 align-self-center"  style="margin-top: 50px;">
                              <span><i class="fas fa-bars fa-2x"></i></span>
                            </div>
                          </div>
                        </li>`;

        let no_km = `<li class="schedule_block" data-product-id="` + product_ID + `" style="padding-left: 15px; padding-right: 15px;">
                          <div class="row" style="padding-left: 15px; padding-right: 15px;">
                            <div class="col col-md-10">
                              <div class="detail_block">
                                <div class="detail_top">
                                  <div class="detail_img">
                                    <img src="` + product_img + `">
                                  </div>
                                  <div class="detail_time">
                                    <p style="font-size: 24px">` + product_name + `</p>
                                    <p><i class="far fa-clock"></i><span> 建議遊玩時間：` + stay_time + `小時</span></p>
                                  </div>
                                </div>
                                <div class="detail_info">
                                  <p>`+schedule_info+`</p>
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
      });

      /*-----------------------------點選取消的動作------------------------------*/
      // 關閉 Modal
      $("div.btn_block button#btn_cancel").on("click", function(){
        let product_ID = $(this).closest("div.overlay_add_schedule").attr("data-product-id");
        $("div.overlay_add_schedule").fadeOut();
        $("div.product_body_content").find("div#"+product_ID).closest("div.col-lg-4").toggle("-none"); //點選取消時，原選取的卡片，會返回產品列表


        // $("div.overlay_add_schedule").addClass("-opacity-zero");
        
        // 設定隔一秒後，移除相關 class
        // setTimeout(function(){
        // $("div.overlay_add_schedule").removeClass("-on1 -opacity-zero");
        // }, 700);

       // $("div.product_body_content").find("div.col-lg-4").each(function(index, items){ //迴圈方式
          // if($(items).find("div.card").attr("data-product-id") == product_ID){         //點選取消時，原選取的卡片，會返回產品列表
          //   $(this).closest("div.col-lg-4").toggle("-none");
          // }
       // });
      });

      /*-----------------------------新增天數的按鈕------------------------------*/
      $("div.add_day").on("click", function () {
        let last_day_num = parseInt($("ul.sum_day").find("li").last().attr("data-sort")) + 1;
        let add_day =
          `<li class="day` + last_day_num + `" data-sort="` + last_day_num + `">
            <button type="button" class="btn btn-primary btn-lg">Day` + last_day_num + `</button>
          </li>`;
        $("ul.sum_day").append(add_day);
      });

      $("ul.sum_day").on("click", "button", function () {
        $("div.schedule_header p").text($(this).text());
        $("ul.schedule_list").html("");
        temp = "";
        init();
        $.ajax({
          url: "http://localhost:8081/TDA101G1/project/JsonController",
          type: "GET",
          data: {
            "updateSchedule": "updateSchedule"
          },
          dataType: "json",
          success: function (data) {
            console.log(data);
          }

        });



      });

      // $("ul#schedule_list").on("DOMNodeInserted",function(){
      // console.log("新增了")
      // })


    });

/*-----------------------------讀取產品的動作------------------------------*/
    function init() {
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
          console.log(items)
          $.each(items, function (index, value) {
            insertHtml += `<div class="col-6 col-md-6 col-lg-4">
                            <div id="`+ value.product_ID +`" class="card">
                              <img src="https://picsum.photos/200/100/?random=1" class="card-img-top">
                              <div class="card-body">
                                <h5 class="card-title">` + value.product_Name + `</h5>
                                <p class="card-text"><i class="fas fa-map-marker-alt"></i><span> ` + value
              .product_Address + `</span></p>
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
      let total_day = $("ul.sum_day").attr("data-days");
      let first_day = $("ul.sum_day").attr("data-start");
      let start_time = new Date(first_day).getTime() - millisecond;    //因為下面迴圈第一天日期會往後一天
      																   //所以這邊先減一次millisecond
      for (let i = 1; i <= total_day; i++) {
      	start_time += millisecond;
      	let date = new Date(start_time);
      	console.log(start_time)
    	let start_date = flatpickr.formatDate(date, 'Y-m-d');
        add_day +=
          `<li class="Day` + i + `" data-sort="` + i + `" data-date="`+ start_date +`">
                <button type="button" class="btn btn-primary btn-lg">Day` + i + `</button>
              </li>`;
      }
      $("ul.sum_day").append(add_day);
    }
  </script>
</body>

</html>