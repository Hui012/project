<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

        button,
        img,
        .btn_overlay_schedule_close,
        .btn_overlay_style_close {
            cursor: pointer;
        }

        ul {
            list-style: none;
            padding: 0;
        }
        .-none{
            display: none;
        }

        nav.navbar {
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 10;
            opacity: 0.8;
        }

        /*-------------------------------top_navbar------------------------------*/
        div.top_navbar {
            width: 100%;
            height: 70px;
            margin-top: 56px;
            background-color: #343434;
            color: #E6903B;
            font-size: 32px;
            font-weight: bold;
            /* display: flex; */
            /* align-items: center */
        }

        span.text_title {
            line-height: 70px;
            height: 500px;
        }

        div.btn_model {
            line-height: 70px;
            float: right;
        }

        div.btn_model button {
            margin-left: 10px;
        }

        /*-------------------------------行程明細------------------------------*/
        div.schedule_content {
            width: 100%;
            height: 100%;
            border: 1px solid black;
        }

        div.detail_block {
            width: 600px;
            height: 150px;
            border: 1px solid black;
            font-size: 0;
            box-shadow: 0 0 6px;
            border-radius: 4px;
            margin: 20px auto 0 auto;
        }

        div.detail_info {
            border-top: 1px solid black;
            display: block;
            width: 100%;
            height: 69px;
            font-size: 16px;
            word-break: break-all;
        }

        div.detail_info p {
            max-height: 100%;
            word-break: break-all;
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
        div.product_ticket{
            width: 230px;
            height: 110px;
            border: 1px solid black;
        }


        /*-------------------選購明細--------------------*/
        div.cart_content {
            width: 100%;
            height: 100%;
            border: 1px solid black;
        }
        div.cart_title{
            border: 1px solid black;
            width: 100% + 2px;
            height: 80px;
            margin: -1px 0 0 -1px;
            text-align: center;
        }
        div.cart_title{
            line-height: 80px;
            font-size: 32px;
            font-weight: bold;
            color: #343434;
        }
        li.cart_detail{
            width: 100%;
            height: 140px;
            border-bottom: 1px solid #343434;
        }
        div.product_block, div.select_block, div.trash_block{
            height: 140px;
            border: 1px solid red;
            text-align: center;
        }
    


        /*------------------行程資訊---------------------*/
        div.schedule_info {
            text-align: center;
            margin: 20px 0;
        }

        div.total_day {
            border: 1px solid black;
            background-color: #31C7D2;
            width: 280px;
            height: 105px;
            display: inline-block;
            margin-right: 10px;

        }

        div.icon_date_block {
            width: 76px;
            height: 100%;
            display: inline-block;
        }

        div.schedule_spent {
            border: 1px solid black;
            background-color: #31C7D2;
            width: 280px;
            height: 105px;
            display: inline-block;
            margin-left: 10px;
        }

        div.icon_money_block {
            width: 76px;
            height: 100%;
            display: inline-block;
        }

        div.icon_date,
        div.icon_money {
            line-height: 68px;
            background-color: #E0DFDF;
            width: 55px;
            height: 55px;
            border-radius: 50px;
            margin: 22px auto 0 auto;
            color: #343434;
            font-weight: bold;

        }

        div.text_date,
        div.text_money {
            display: inline-block;
            font-size: 16px;
            font-weight: bold;
            color: #343434;
            vertical-align: top;
            width: 198px;
            height: 100%;
            /* line-height: 103px; */
        }

        /*------------------------單日資訊------------------------*/
        div.day_info,
        div.day_weather,
        div.day_spent {
            width: 100%;
            height: 100%;

        }

        div.all {
            width: 600px;
            height: 80px;
            margin: 20px auto 0 auto;
            text-align: center;
            font-size: 16px;
        }

        div.day_icon {
            display: inline-block;
            height: 100%;
            width: 70px;
            vertical-align: top;
        }

        div.day_date {
            background-color: #E6903B;
            width: 55px;
            height: 55px;
            border-radius: 50px;
            color: #343434;
            font-weight: bold;
            display: inline-block;
            line-height: 55px;
        }

        div.day_text_date {
            display: inline-block;
            height: 100%;
            width: 124px;
        }

        footer {
            background-color: black;
            height: 164px;
            font-size: 24px;
            font-weight: bold;
            position: absolute;
            bottom: 0;
            width: 1920px;
        }
    </style>
    <!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css"> -->
    <link rel="stylesheet" type="text/css" href="https://npmcdn.com/flatpickr/dist/themes/material_orange.css">
</head>

<body>

    <!-- Image and text -->
    <nav class="navbar navbar-light bg-light">
        <a class="navbar-brand" href="#">Tourism</a>
    </nav>


    <div class="container-fliud">
        <div class="top_navbar">
            <div class="row" style="margin: 0;">
                <div class="col col-md-6">
                    <span class="text_title">台北之旅</span>
                </div>
                <div class="col col-md-6">
                    <div class="btn_model">
                        <button id="btn_map" type="button" class="btn btn-primary btn-lg">行程路線</button>
                        <button id="btn_produce" type="submit" class="btn btn-primary btn-lg">編輯行程</button>
                        <button id="btn_share" type="button" class="btn btn-primary btn-lg">分享行程</button>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="container" style="margin-top: -1px;">
        <div class="row">
            <div class="col col-md-7" style="padding-right: 0;">
                <div class="schedule_content">
                    <div class="schedule_info">
                        <div class="total_day">
                            <div class="icon_date_block">
                                <div class="icon_date">
                                    <i class="far fa-calendar-alt fa-2x"></i>
                                </div>
                            </div>
                            <div class="text_date">
                                <p>共5天</p>
                                <p>2020-02-11~2020-02-18</p>
                            </div>
                        </div>
                        <div class="schedule_spent">
                            <div class="icon_money_block">
                                <div class="icon_money">
                                    <i class="fas fa-dollar-sign fa-2x"></i>
                                </div>
                            </div>
                            <div class="text_money">
                                <span>TWD 10000</span>
                            </div>
                        </div>
                    </div>

                    <!--------------- 動態新增 --------------->

                    <ul class="schedule_detail">
                        <div class="all">
                            <div class="row" style="padding-left: 15px; padding-right: 15px;">
                                <div class="col col-md-4" style="padding-right: 0; padding-left: 0;">
                                    <div class="day_info">
                                        <div class="day_icon">
                                            <div class="day_date">
                                                <span>D1</span>
                                            </div>
                                        </div>
                                        <div class="day_text_date">
                                            <p>2020/04/21</p>
                                            <p>週三</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col col-md-4" style="padding-right: 0; padding-left: 0;">
                                    <div class="day_weather">
                                        <p class="km" style="margin-bottom: 6px;"">單日里程：15</p>
                                        <p>天氣預測：22 C <i class="fas fa-cloud fa-2x -none"></i><i class="fas fa-sun fa-2x"></i>
                                            <i class="fas fa-cloud-showers-heavy fa-2x -none"></i>
                                            <i class="fas fa-cloud-sun fa-2x -none"></i<i class="fas fa-cloud-sun-rain fa-2x -none"></i></p>
                                    </div>
                                </div>
                                <div class="col col-md-4" style="padding-right: 0; padding-left: 0;">
                                    <div class="day_spent">
                                        <p>單日花費：$1500</p>
                                        <p>人數：2</p>
                                    </div>
                                </div>
                            </div>
                        </div>



                        <li class="schedule_block" id="` + product_ID + `" data-sort="` + sort + `"
                            style="padding-left: 15px; padding-right: 15px;">
                            <div class="row" style="padding-left: 15px; padding-right: 15px;">
                                <div class="col col-md-12" style="padding: 0;">
                                    <div class="detail_block">
                                        <div class="detail_top">
                                            <div class="detail_img">
                                                <img src="` + product_img + `">
                                            </div>
                                            <div class="detail_time">
                                                <p style="font-size: 24px">` + product_name + `</p>
                                                <p><i class="far fa-clock"></i> 建議遊玩時間：<span>` + stay_time + `</span>小時
                                                </p>
                                            </div>
                                        </div>
                                        <div class="detail_info">
                                            <p>` + schedule_info + `</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>

                        <li class="schedule_block" id="` + product_ID + `"data-sort="` + sort + `" style="padding-left: 15px; padding-right: 15px;">
                            <div class="row" style="padding-left: 15px; padding-right: 15px;">
                              <div class="col col-md-12">
                                  <div class="row" style="padding-left: 15px; padding-right: 15px; margin-top: 20px;">
                                  <div class="col col-md-3">
                                    <span><i class="fas fa-car-side fa-2x"></i></span>
                                    <span>25KM</span>
                                  </div>
                                  <div class="col col-md-6" style="text-align: center;">
                                    <span style="margin: auto;"><i class="fas fa-arrow-down fa-2x"></i></span>
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
                            </div>
                          </li>

                    </ul>
                </div>
            </div>
            <div class="col col-md-5" style="padding-left: 0;">
                <div class="cart_content">
                    <div class="cart_title">
                        <p>選購明細</p>
                    </div>
                    <ul class="cart_list">
                        <!--------------- 動態新增 --------------->
                        <li id="" class="cart_detail">
                            <div class="row" style="padding-left: 15px; padding-right: 15px;">
                                    <div class="col col-md-7" style="padding-right: 0; padding-left: 0;">
                                        <div class="product_block">
                                            <div class="product_ticket">

                                            </div>
                                        </div>
                                    </div>
                                    <div class="col col-md-4" style="padding-right: 0; padding-left: 0;">
                                        <div class="select_block">
                                            <input class="input_quantity" type="number" value="1" name="points" min="1" max="99"></input>
                                        </div>
                                    </div>
                                    <div class="col col-md-1" style="padding-right: 0; padding-left: 0;">
                                        <div class="trash_block">
                                            <span class="trash"><i class="fas fa-trash-alt fa-2x"></i></span>
                                        </div>
                                    </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>





    <!-- <footer class="footer mt-auto py-3">
        <div class="container">
            <span class="text-muted">WEB DEVELOPER</span>
        </div>
    </footer> -->

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

    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <script>
        $(function () {



            // <div class="all">
            //                 <div class="row" style="padding-left: 15px; padding-right: 15px;">
            //                     <div class="col col-md-4" style="padding-right: 0; padding-left: 0;">
            //                         <div class="day_info">
            //                             <div class="day_icon">
            //                                 <div class="day_date">
            //                                     <span>D1</span>
            //                                 </div>
            //                             </div>
            //                             <div class="day_text_date">
            //                                 <p>2020/04/21</p>
            //                                 <p>週三</p>
            //                             </div>
            //                         </div>
            //                     </div>
            //                     <div class="col col-md-4" style="padding-right: 0; padding-left: 0;">
            //                         <div class="day_weather">
            //                             <p>天氣預測：22</p>
            //                             <p>單日里程：15</p>
            //                         </div>
            //                     </div>
            //                     <div class="col col-md-4" style="padding-right: 0; padding-left: 0;">
            //                         <div class="day_spent">
            //                             <p>人數：2</p>
            //                             <p>單日花費：$1500</p>
            //                         </div>
            //                     </div>
            //                 </div>
            //             </div>



            //             <li class="schedule_block" id="` + product_ID + `" data-sort="` + sort + `"
            //                 style="padding-left: 15px; padding-right: 15px;">
            //                 <div class="row" style="padding-left: 15px; padding-right: 15px;">
            //                     <div class="col col-md-12" style="padding: 0;">
            //                         <div class="detail_block">
            //                             <div class="detail_top">
            //                                 <div class="detail_img">
            //                                     <img src="` + product_img + `">
            //                                 </div>
            //                                 <div class="detail_time">
            //                                     <p style="font-size: 24px">` + product_name + `</p>
            //                                     <p><i class="far fa-clock"></i> 建議遊玩時間：<span>` + stay_time + `</span>小時
            //                                     </p>
            //                                 </div>
            //                             </div>
            //                             <div class="detail_info">
            //                                 <p>` + schedule_info + `</p>
            //                             </div>
            //                         </div>
            //                     </div>
            //                 </div>
            //             </li>














        });
    </script>
</body>

</html>