<%@page import="java.util.List"%>
<%@page import="com.customerizedetail.model.CustDetailVO"%>
<%@page import="com.customerize.model.CustVO"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<%

CustVO custVO = (CustVO) request.getAttribute("custVO");
List<CustDetailVO> lists = (List<CustDetailVO>) request.getAttribute("custDetailVOs");
pageContext.setAttribute("list", lists);





%>
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
        body{
            height: 100%;
        }
        div.main-content{
            min-height: 100%;
            padding-top:50px;
            padding-bottom:50px;
            position: relative;
            margin-bottom: -100px;
        }
        footer {
            background-color: black;
            height: 164px;
            font-size: 24px;
            font-weight: bold;
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
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

        .-none {
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

        div.product_ticket {
            width: 230px;
            height: 110px;
            border: 1px solid black;
        }


        /*-------------------選購明細--------------------*/
        div.cart_content {
            display: block;
            width: 100%;
            height: 100%;
            border: 1px solid black;
            max-height: 650px;
            text-align: center;
        }

        div.cart_title {
            border: 1px solid black;
            width: 100% + 2px;
            height: 80px;
            margin: -1px 0 0 -1px;
            text-align: center;
        }

        div.cart_title {
            line-height: 80px;
            font-size: 32px;
            font-weight: bold;
            color: #343434;
        }

        li.cart_detail {
            width: 100%;
            height: 140px;
            border-bottom: 1px solid #343434;
            margin-top: 20px;
        }

        div.product_block {
            height: 140px;
        }

        div.product_ticket {
            box-shadow: 0 0 6px;
            border-radius: 4px;
        }

        div.product_ticket_img {
            width: 120px;
            height: 100%;
            border-bottom: 1px solid #343434;
            display: inline-block;
        }

        div.product_ticket_name {
            width: calc(100% - 120px - 4px);
            height: 100%;
            display: inline-block;
            vertical-align: top;
        }

        div.product_ticket_name p {
            text-align: center;
            line-height: 108px;
            font-size: 16px;
            font-weight: bold;
            color: #343434;
        }

        div.trash_block {
            height: 140px;
            text-align: center;
            line-height: 100px;
        }

        div.select_block {
            height: 140px;
            text-align: center;
        }

        input.input_quantity {
            width: 45px;
            vertical-align: top;
        }

        div.cart_body {
            height: calc(100% - 82px - 80px);
            overflow-y: scroll;
            overflow-x: hidden;
        }

        div.go_buy {
            width: 100%;
            height: 80px;
            bottom: 0;
            border-top: 1px solid black;
            line-height: 80px;
        }


        /*--------------------廣告------------------------*/
        div.ad_content {
            width: 100%;
            height: 100%;
            border: 1px solid black;
            display: block;
        }

        div.ad_title {
            border: 1px solid black;
            width: 100% + 2px;
            height: 80px;
            margin: -1px 0 0 -1px;
            text-align: center;
        }

        div.ad_title {
            line-height: 80px;
            font-size: 32px;
            font-weight: bold;
            color: #343434;
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

        
    </style>
    <!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css"> -->
    <link rel="stylesheet" type="text/css" href="https://npmcdn.com/flatpickr/dist/themes/material_orange.css">
</head>

<body>  
    <div class="main_content">

        <nav class="navbar navbar-expand navbar-light d-flex justify-content-start" style="background-color: #e3f2fd;">
            <a class="navbar-brand mr-auto" href="#">
              <img src="<%=request.getContextPath()%>/project/img/logo.png" width="30" height="30" class="d-inline-block align-top" alt="tourism">
              Tourism</a>
            <ul class="navbar-nav">
              <li class="nav-item">
                <a class="nav-link" href="#"><i class="fas fa-pen"></i>建立行程</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#"><i class="fas fa-store"></i>商城</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#"><i class="fas fa-shopping-cart"></i>購物車</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#"><i class="fas fa-sign-in-alt"></i>會員中心</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#"><i class="fas fa-user"></i>USER</a>
              </li>
            </ul>
          </nav>


    <div class="container-fliud">
        <div class="top_navbar" data-schedule-id="${custVO.cust_Schedule_ID}" data-member-id="${custVO.member_ID}"
                                data-position="${custVO.cust_Position}"	data-selected-county="${custVO.cust_Selected_County}">
            <div class="row" style="margin: 0;">
                <div class="col col-md-6">
                    <span class="text_title">${custVO.cust_Schedule_Name}</span>
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
                                <p style="margin: 25px auto auto auto;"><span>共</span>${custVO.cust_Schedule_Total_Day}<span>天</span></p>
                                <p>${custVO.cust_Schedule_Start_Time}~${custVO.cust_Schedule_End_Time}</p>
                            </div>
                        </div>
                        <div class="schedule_spent">
                            <div class="icon_money_block">
                                <div class="icon_money">
                                    <i class="fas fa-dollar-sign fa-2x"></i>
                                </div>
                            </div>
                            <div class="text_money">
                                <span style="line-height: 103px;">TWD 10000</span>
                            </div>
                        </div>
                    </div>

                    <!--------------- 動態新增 --------------->
				<c:forEach var="value" items="${list}">
				<c:set var="date1" value="${value.cust_Schedule_Detail_Date}"></c:set>
                    <div class="all">
                        <div class="row" style="padding-left: 15px; padding-right: 15px;">
                            <div class="col col-md-4" style="padding-right: 0; padding-left: 0;">
                                <div class="day_info">
                                    <div class="day_icon">
                                        <div class="day_date">
                                            <span>D1</span>${value.productVO.product_Name}
                                        </div>
                                    </div>
                                    <div class="day_text_date">
                                        <p>${value.cust_Schedule_Detail_Date}</p>
                                        <p>週三</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col col-md-4" style="padding-right: 0; padding-left: 0;">
                                <div class="day_weather">
                                    <p class="km" style="margin-bottom: 6px;">單日里程：15</p>
                                    <p>天氣預測：22 C <i class=" fas fa-cloud fa-2x -none"></i>
                                    <i class="fas fa-sun fa-2x"></i>
                                    <i class="fas fa-cloud-showers-heavy fa-2x -none"></i>
                                    <i class="fas fa-cloud-sun fa-2x -none"></i>
                                    <i class="fas fa-cloud-sun-rain fa-2x -none"></i></p>
                                </div>
                            </div>
                            <div class="col col-md-4" style="padding-right: 0; padding-left: 0;">
                                <div class="day_spent">
                                    <p>單日花費：$1500</p>
                                    <p><span>人數：</span>${custVO.cust_Quantity}</p>
                                </div>
                            </div>
                        </div>
                    </div>


                    <ul class="schedule_detail">
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

                        <li class="schedule_block" id="` + product_ID + `" data-sort="` + sort + `"
                            style="padding-left: 15px; padding-right: 15px;">
                            <div class="row" style="padding-left: 15px; padding-right: 15px;">
                                <div class="col col-md-12" style="padding: 0;">
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
                    </ul>
                </c:forEach>
                </div>
            </div>
            <div class="col col-md-5" style="padding-left: 0;">
                <div class="cart_content">
                    <div class="cart_title">
                        <p>選購明細</p>
                    </div>
                    <div class="cart_body">
                        <ul class="cart_list">
                            <!--------------- 動態新增 --------------->
                            <li id="" class="cart_detail">
                                <div class="row" style="padding-left: 15px; padding-right: 15px;">
                                    <div class="col col-md-6">
                                        <div class="product_block">
                                            <div class="product_ticket">
                                                <div class="product_ticket_img">
                                                    <img src="https://picsum.photos/120/108/?random=1">
                                                </div>
                                                <div class="product_ticket_name">
                                                    <p>故宮博物院</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col col-md-5" style="padding-right: 0; padding-left: 0;">
                                        <div class="select_block">
                                            <select class="select_options" style="height: 30px; margin-top: 30px;">
                                                <option>半票</option>
                                                <option>全票</option>
                                                <option>愛心票</option>
                                            </select>
                                            <input class="input_quantity" style="margin-top: 30px;" type="number"
                                                value="1" name="points" min="1" max="99"></input>
                                            <p>NT$ 1000</p>
                                        </div>
                                    </div>
                                    <div class="col col-md-1" style="padding-right: 0; padding-left: 0;">
                                        <div class="trash_block">
                                            <span class="trash"><i class="fas fa-trash-alt fa-2x"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li id="" class="cart_detail">
                                <div class="row" style="padding-left: 15px; padding-right: 15px;">
                                    <div class="col col-md-6">
                                        <div class="product_block">
                                            <div class="product_ticket">
                                                <div class="product_ticket_img">
                                                    <img src="https://picsum.photos/120/108/?random=1">
                                                </div>
                                                <div class="product_ticket_name">
                                                    <p>故宮博物院</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col col-md-5" style="padding-right: 0; padding-left: 0;">
                                        <div class="select_block">
                                            <select class="select_options" style="height: 30px; margin-top: 30px;">
                                                <option>半票</option>
                                                <option>全票</option>
                                                <option>愛心票</option>
                                            </select>
                                            <input class="input_quantity" style="margin-top: 30px;" type="number"
                                                value="1" name="points" min="1" max="99"></input>
                                            <p>NT$ 1000</p>
                                        </div>
                                    </div>
                                    <div class="col col-md-1" style="padding-right: 0; padding-left: 0;">
                                        <div class="trash_block">
                                            <span class="trash"><i class="fas fa-trash-alt fa-2x"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li id="" class="cart_detail">
                                <div class="row" style="padding-left: 15px; padding-right: 15px;">
                                    <div class="col col-md-6">
                                        <div class="product_block">
                                            <div class="product_ticket">
                                                <div class="product_ticket_img">
                                                    <img src="https://picsum.photos/120/108/?random=1">
                                                </div>
                                                <div class="product_ticket_name">
                                                    <p>故宮博物院</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col col-md-5" style="padding-right: 0; padding-left: 0;">
                                        <div class="select_block">
                                            <select class="select_options" style="height: 30px; margin-top: 30px;">
                                                <option>半票</option>
                                                <option>全票</option>
                                                <option>愛心票</option>
                                            </select>
                                            <input class="input_quantity" style="margin-top: 30px;" type="number"
                                                value="1" name="points" min="1" max="99"></input>
                                            <p>NT$ 1000</p>
                                        </div>
                                    </div>
                                    <div class="col col-md-1" style="padding-right: 0; padding-left: 0;">
                                        <div class="trash_block">
                                            <span class="trash"><i class="fas fa-trash-alt fa-2x"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li id="" class="cart_detail">
                                <div class="row" style="padding-left: 15px; padding-right: 15px;">
                                    <div class="col col-md-6">
                                        <div class="product_block">
                                            <div class="product_ticket">
                                                <div class="product_ticket_img">
                                                    <img src="https://picsum.photos/120/108/?random=1">
                                                </div>
                                                <div class="product_ticket_name">
                                                    <p>故宮博物院</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col col-md-5" style="padding-right: 0; padding-left: 0;">
                                        <div class="select_block">
                                            <select class="select_options" style="height: 30px; margin-top: 30px;">
                                                <option>半票</option>
                                                <option>全票</option>
                                                <option>愛心票</option>
                                            </select>
                                            <input class="input_quantity" style="margin-top: 30px;" type="number"
                                                value="1" name="points" min="1" max="99"></input>
                                            <p>NT$ 1000</p>
                                        </div>
                                    </div>
                                    <div class="col col-md-1" style="padding-right: 0; padding-left: 0;">
                                        <div class="trash_block">
                                            <span class="trash"><i class="fas fa-trash-alt fa-2x"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li id="" class="cart_detail">
                                <div class="row" style="padding-left: 15px; padding-right: 15px;">
                                    <div class="col col-md-6">
                                        <div class="product_block">
                                            <div class="product_ticket">
                                                <div class="product_ticket_img">
                                                    <img src="https://picsum.photos/120/108/?random=1">
                                                </div>
                                                <div class="product_ticket_name">
                                                    <p>故宮博物院</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col col-md-5" style="padding-right: 0; padding-left: 0;">
                                        <div class="select_block">
                                            <select class="select_options" style="height: 30px; margin-top: 30px;">
                                                <option>半票</option>
                                                <option>全票</option>
                                                <option>愛心票</option>
                                            </select>
                                            <input class="input_quantity" style="margin-top: 30px;" type="number"
                                                value="1" name="points" min="1" max="99"></input>
                                            <p>NT$ 1000</p>
                                        </div>
                                    </div>
                                    <div class="col col-md-1" style="padding-right: 0; padding-left: 0;">
                                        <div class="trash_block">
                                            <span class="trash"><i class="fas fa-trash-alt fa-2x"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li id="" class="cart_detail">
                                <div class="row" style="padding-left: 15px; padding-right: 15px;">
                                    <div class="col col-md-6">
                                        <div class="product_block">
                                            <div class="product_ticket">
                                                <div class="product_ticket_img">
                                                    <img src="https://picsum.photos/120/108/?random=1">
                                                </div>
                                                <div class="product_ticket_name">
                                                    <p>故宮博物院</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col col-md-5" style="padding-right: 0; padding-left: 0;">
                                        <div class="select_block">
                                            <select class="select_options" style="height: 30px; margin-top: 30px;">
                                                <option>半票</option>
                                                <option>全票</option>
                                                <option>愛心票</option>
                                            </select>
                                            <input class="input_quantity" style="margin-top: 30px;" type="number"
                                                value="1" name="points" min="1" max="99"></input>
                                            <p>NT$ 1000</p>
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
                    <div class="go_buy">
                        <div class="row" style="padding-left: 15px; padding-right: 15px;">
                            <div class="col col-md-6" style="padding-right: 0; padding-left: 0;">
                                <p>合計：NT$4000</p>
                            </div>
                            <div class="col col-md-6" style="padding-right: 0; padding-left: 0;">
                                <button id="btn_buy" type="button" class="btn btn-primary btn-lg">直接購買</button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="ad_content">
                    <div class="ad_title">
                        <p>廣告</p>
                    </div>
                    <ul class="ad_list">
                        <!--------------- 動態新增 --------------->
                        <li id="" class="ad_detail">
                            <div class="row" style="padding-left: 15px; padding-right: 15px;">
                                <div class="col col-md-6">
                                    
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>


            </div>


        </div>
<<<<<<< HEAD
                <!-- <footer class="footer"> -->
                    <!-- <div class="container"> -->
                        <!-- <span class="text-muted">WEB DEVELOPER</span> -->
                    <!-- </div> -->
                <!-- </footer> -->
=======
                <footer class="footer">
                    <!-- <div class="container"> -->
                        <span class="text-muted">WEB DEVELOPER</span>
                    <!-- </div> -->
                </footer>
>>>>>>> c4ecbf13292006d8bb1b9d1b93acdc662f9acef4



            <!-- Optional JavaScript -->
            <!-- jQuery first, then Popper.js, then Bootstrap JS -->
            <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
                integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
                crossorigin="anonymous">
            </script>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
                integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
                crossorigin="anonymous">
            </script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
                integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
                crossorigin="anonymous">
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