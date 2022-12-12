<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
<style>
    .ttable1 {
		
        margin: auto;
		margin-top: 50px;
        width:470px;
	}
    .ttable {
		display: grid;
        margin: auto;
		margin-top: 50px;
		padding: 40px;
        align-items: center;
        justify-content: center;
		width:800px;
	}
    .tttable {
        display: grid;
		margin: auto;
		margin-top: 50px;
        align-items: center;
        justify-content: center;
		padding: 40px;
		width:700px;
	}
    @font-face {
          font-family: 'NanumSquareNeo-Variable';
          src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
          font-weight: normal;
          font-style: normal;
      }
    *{font-family: 'NanumSquareNeo-Variable';}

.kane{
    border: 0;
    outline: 0;
}
@-webkit-keyframes fall {
    0% {
        opacity: 0.9;
        top: 0
    }
    100% {
        opacity: 0.2;
        top: 100%
    }
}

@-o-keyframes fall {
    0% {
        opacity: 0.9;
        top: 0
    }
    100% {
        opacity: 0.2;
        top: 100%
    }
}

@-ms-keyframes fall {
    0% {
        opacity: 0.9;
        top: 0
    }
    100% {
        opacity: 0.2;
        top: 100%
    }
}

@-moz-keyframes fall {
    0% {
        opacity: 0.9;
        top: 0
    }
    100% {
        opacity: 0.2;
        top: 100%
    }
}

@keyframes fall {
    0% {
        opacity: 0.9;
        top: 0
    }
    100% {
        opacity: 0.2;
        top: 100%
    }
}

@-webkit-keyframes blow-soft-left {
    0% {
        margin-left: 0
    }
    100% {
        margin-left: -50%
    }
}

@-o-keyframes blow-soft-left {
    0% {
        margin-left: 0
    }
    100% {
        margin-left: -50%
    }
}

@-ms-keyframes blow-soft-left {
    0% {
        margin-left: 0
    }
    100% {
        margin-left: -50%
    }
}

@-moz-keyframes blow-soft-left {
    0% {
        margin-left: 0
    }
    100% {
        margin-left: -50%
    }
}

@keyframes blow-soft-left {
    0% {
        margin-left: 0
    }
    100% {
        margin-left: -50%
    }
}

@-webkit-keyframes blow-medium-left {
    0% {
        margin-left: 0
    }
    100% {
        margin-left: -100%
    }
}

@-o-keyframes blow-medium-left {
    0% {
        margin-left: 0
    }
    100% {
        margin-left: -100%
    }
}

@-ms-keyframes blow-medium-left {
    0% {
        margin-left: 0
    }
    100% {
        margin-left: -100%
    }
}

@-moz-keyframes blow-medium-left {
    0% {
        margin-left: 0
    }
    100% {
        margin-left: -100%
    }
}

@keyframes blow-medium-left {
    0% {
        margin-left: 0
    }
    100% {
        margin-left: -100%
    }
}

@-webkit-keyframes blow-soft-right {
    0% {
        margin-left: 0
    }
    100% {
        margin-left: 50%
    }
}

@-o-keyframes blow-soft-right {
    0% {
        margin-left: 0
    }
    100% {
        margin-left: 50%
    }
}

@-ms-keyframes blow-soft-right {
    0% {
        margin-left: 0
    }
    100% {
        margin-left: 50%
    }
}

@-moz-keyframes blow-soft-right {
    0% {
        margin-left: 0
    }
    100% {
        margin-left: 50%
    }
}

@keyframes blow-soft-right {
    0% {
        margin-left: 0
    }
    100% {
        margin-left: 50%
    }
}

@-webkit-keyframes blow-medium-right {
    0% {
        margin-left: 0
    }
    100% {
        margin-left: 100%
    }
}

@-o-keyframes blow-medium-right {
    0% {
        margin-left: 0
    }
    100% {
        margin-left: 100%
    }
}

@-ms-keyframes blow-medium-right {
    0% {
        margin-left: 0
    }
    100% {
        margin-left: 100%
    }
}

@-moz-keyframes blow-medium-lerightft {
    0% {
        margin-left: 0
    }
    100% {
        margin-left: 100%
    }
}

@keyframes blow-medium-right {
    0% {
        margin-left: 0
    }
    100% {
        margin-left: 100%
    }
}

@-webkit-keyframes sway-0 {
    0% {
        -webkit-transform: rotate(-5deg)
    }
    40% {
        -webkit-transform: rotate(28deg)
    }
    100% {
        -webkit-transform: rotate(3deg)
    }
}

@-o-keyframes sway-0 {
    0% {
        -o-transform: rotate(-5deg)
    }
    40% {
        -o-transform: rotate(28deg)
    }
    100% {
        -o-transform: rotate(3deg)
    }
}

@-ms-keyframes sway-0 {
    0% {
        -ms-transform: rotate(-5deg)
    }
    40% {
        -ms-transform: rotate(28deg)
    }
    100% {
        -ms-transform: rotate(3deg)
    }
}

@-moz-keyframes sway-0 {
    0% {
        -moz-transform: rotate(-5deg)
    }
    40% {
        -moz-transform: rotate(28deg)
    }
    100% {
        -moz-transform: rotate(3deg)
    }
}

@keyframes sway-0 {
    0% {
        transform: rotate(-5deg)
    }
    40% {
        transform: rotate(28deg)
    }
    100% {
        transform: rotate(3deg)
    }
}

@-webkit-keyframes sway-1 {
    0% {
        -webkit-transform: rotate(10deg)
    }
    40% {
        -webkit-transform: rotate(43deg)
    }
    100% {
        -webkit-transform: rotate(15deg)
    }
}

@-o-keyframes sway-1 {
    0% {
        -o-transform: rotate(10deg)
    }
    40% {
        -o-transform: rotate(43deg)
    }
    100% {
        -o-transform: rotate(15deg)
    }
}

@-ms-keyframes sway-1 {
    0% {
        -ms-transform: rotate(10deg)
    }
    40% {
        -ms-transform: rotate(43deg)
    }
    100% {
        -ms-transform: rotate(15deg)
    }
}

@-moz-keyframes sway-1 {
    0% {
        -moz-transform: rotate(10deg)
    }
    40% {
        -moz-transform: rotate(43deg)
    }
    100% {
        -moz-transform: rotate(15deg)
    }
}

@keyframes sway-1 {
    0% {
        transform: rotate(10deg)
    }
    40% {
        transform: rotate(43deg)
    }
    100% {
        transform: rotate(15deg)
    }
}

@-webkit-keyframes sway-2 {
    0% {
        -webkit-transform: rotate(15deg)
    }
    40% {
        -webkit-transform: rotate(56deg)
    }
    100% {
        -webkit-transform: rotate(22deg)
    }
}

@-o-keyframes sway-2 {
    0% {
        -o-transform: rotate(15deg)
    }
    40% {
        -o-transform: rotate(56deg)
    }
    100% {
        -o-transform: rotate(22deg)
    }
}

@-ms-keyframes sway-2 {
    0% {
        -ms-transform: rotate(15deg)
    }
    40% {
        -ms-transform: rotate(56deg)
    }
    100% {
        -ms-transform: rotate(22deg)
    }
}

@-moz-keyframes sway-2 {
    0% {
        -moz-transform: rotate(15deg)
    }
    40% {
        -moz-transform: rotate(56deg)
    }
    100% {
        -moz-transform: rotate(22deg)
    }
}

@keyframes sway-2 {
    0% {
        transform: rotate(15deg)
    }
    40% {
        transform: rotate(56deg)
    }
    100% {
        transform: rotate(22deg)
    }
}

@-webkit-keyframes sway-3 {
    0% {
        -webkit-transform: rotate(25deg)
    }
    40% {
        -webkit-transform: rotate(74deg)
    }
    100% {
        -webkit-transform: rotate(37deg)
    }
}

@-o-keyframes sway-3 {
    0% {
        -o-transform: rotate(25deg)
    }
    40% {
        -o-transform: rotate(74deg)
    }
    100% {
        -o-transform: rotate(37deg)
    }
}

@-ms-keyframes sway-3 {
    0% {
        -ms-transform: rotate(25deg)
    }
    40% {
        -ms-transform: rotate(74deg)
    }
    100% {
        -ms-transform: rotate(37deg)
    }
}

@-moz-keyframes sway-3 {
    0% {
        -moz-transform: rotate(25deg)
    }
    40% {
        -moz-transform: rotate(74deg)
    }
    100% {
        -moz-transform: rotate(37deg)
    }
}

@keyframes sway-3 {
    0% {
        transform: rotate(25deg)
    }
    40% {
        transform: rotate(74deg)
    }
    100% {
        transform: rotate(37deg)
    }
}

@-webkit-keyframes sway-4 {
    0% {
        -webkit-transform: rotate(40deg)
    }
    40% {
        -webkit-transform: rotate(68deg)
    }
    100% {
        -webkit-transform: rotate(25deg)
    }
}

@-o-keyframes sway-4 {
    0% {
        -o-transform: rotate(40deg)
    }
    40% {
        -o-transform: rotate(68deg)
    }
    100% {
        -o-transform: rotate(25deg)
    }
}

@-ms-keyframes sway-4 {
    0% {
        -ms-transform: rotate(40deg)
    }
    40% {
        -ms-transform: rotate(68deg)
    }
    100% {
        -ms-transform: rotate(25deg)
    }
}

@-moz-keyframes sway-4 {
    0% {
        -moz-transform: rotate(40deg)
    }
    40% {
        -moz-transform: rotate(68deg)
    }
    100% {
        -moz-transform: rotate(25deg)
    }
}

@keyframes sway-4 {
    0% {
        transform: rotate(40deg)
    }
    40% {
        transform: rotate(68deg)
    }
    100% {
        transform: rotate(25deg)
    }
}

@-webkit-keyframes sway-5 {
    0% {
        -webkit-transform: rotate(50deg)
    }
    40% {
        -webkit-transform: rotate(78deg)
    }
    100% {
        -webkit-transform: rotate(40deg)
    }
}

@-o-keyframes sway-5 {
    0% {
        -o-transform: rotate(50deg)
    }
    40% {
        -o-transform: rotate(78deg)
    }
    100% {
        -o-transform: rotate(40deg)
    }
}

@-ms-keyframes sway-5 {
    0% {
        -ms-transform: rotate(50deg)
    }
    40% {
        -ms-transform: rotate(78deg)
    }
    100% {
        -ms-transform: rotate(40deg)
    }
}

@-moz-keyframes sway-5 {
    0% {
        -moz-transform: rotate(50deg)
    }
    40% {
        -moz-transform: rotate(78deg)
    }
    100% {
        -moz-transform: rotate(40deg)
    }
}

@keyframes sway-5 {
    0% {
        transform: rotate(50deg)
    }
    40% {
        transform: rotate(78deg)
    }
    100% {
        transform: rotate(40deg)
    }
}

@-webkit-keyframes sway-6 {
    0% {
        -webkit-transform: rotate(65deg)
    }
    40% {
        -webkit-transform: rotate(92deg)
    }
    100% {
        -webkit-transform: rotate(58deg)
    }
}

@-o-keyframes sway-6 {
    0% {
        -o-transform: rotate(65deg)
    }
    40% {
        -o-transform: rotate(92deg)
    }
    100% {
        -o-transform: rotate(58deg)
    }
}

@-ms-keyframes sway-6 {
    0% {
        -ms-transform: rotate(65deg)
    }
    40% {
        -ms-transform: rotate(92deg)
    }
    100% {
        -ms-transform: rotate(58deg)
    }
}

@-moz-keyframes sway-6 {
    0% {
        -moz-transform: rotate(65deg)
    }
    40% {
        -moz-transform: rotate(92deg)
    }
    100% {
        -moz-transform: rotate(58deg)
    }
}

@keyframes sway-6 {
    0% {
        transform: rotate(65deg)
    }
    40% {
        transform: rotate(92deg)
    }
    100% {
        transform: rotate(58deg)
    }
}

@-webkit-keyframes sway-7 {
    0% {
        -webkit-transform: rotate(72deg)
    }
    40% {
        -webkit-transform: rotate(118deg)
    }
    100% {
        -webkit-transform: rotate(68deg)
    }
}

@-o-keyframes sway-7 {
    0% {
        -o-transform: rotate(72deg)
    }
    40% {
        -o-transform: rotate(118deg)
    }
    100% {
        -o-transform: rotate(68deg)
    }
}

@-ms-keyframes sway-7 {
    0% {
        -ms-transform: rotate(72deg)
    }
    40% {
        -ms-transform: rotate(118deg)
    }
    100% {
        -ms-transform: rotate(68deg)
    }
}

@-moz-keyframes sway-7 {
    0% {
        -moz-transform: rotate(72deg)
    }
    40% {
        -moz-transform: rotate(118deg)
    }
    100% {
        -moz-transform: rotate(68deg)
    }
}

@keyframes sway-7 {
    0% {
        transform: rotate(72deg)
    }
    40% {
        transform: rotate(118deg)
    }
    100% {
        transform: rotate(68deg)
    }
}

@-webkit-keyframes sway-8 {
    0% {
        -webkit-transform: rotate(94deg)
    }
    40% {
        -webkit-transform: rotate(136deg)
    }
    100% {
        -webkit-transform: rotate(82deg)
    }
}

@-o-keyframes sway-8 {
    0% {
        -o-transform: rotate(94deg)
    }
    40% {
        -o-transform: rotate(136deg)
    }
    100% {
        -o-transform: rotate(82deg)
    }
}

@-ms-keyframes sway-8 {
    0% {
        -ms-transform: rotate(94deg)
    }
    40% {
        -ms-transform: rotate(136deg)
    }
    100% {
        -ms-transform: rotate(82deg)
    }
}

@-moz-keyframes sway-8 {
    0% {
        -moz-transform: rotate(94deg)
    }
    40% {
        -moz-transform: rotate(136deg)
    }
    100% {
        -moz-transform: rotate(82deg)
    }
}

@keyframes sway-8 {
    0% {
        transform: rotate(94deg)
    }
    40% {
        transform: rotate(136deg)
    }
    100% {
        transform: rotate(82deg)
    }
}

.sakura {
    background: -webkit-linear-gradient(120deg, rgba(255, 183, 197, 0.9), rgba(255, 197, 208, 0.9));
    background: -o-linear-gradient(120deg, rgba(255, 183, 197, 0.9), rgba(255, 197, 208, 0.9));
    background: -ms-linear-gradient(120deg, rgba(255, 183, 197, 0.9), rgba(255, 197, 208, 0.9));
    background: -moz-linear-gradient(120deg, rgba(255, 183, 197, 0.9), rgba(255, 197, 208, 0.9));
    background: linear-gradient(120deg, rgba(255, 183, 197, 0.9), rgba(255, 197, 208, 0.9));
    -webkit-border-radius: 12px 1px;
    -o-border-radius: 12px 1px;
    -ms-border-radius: 12px 1px;
    -moz-border-radius: 12px 1px;
    border-radius: 12px 1px;
    -webkit-pointer-events: none;
    -moz-pointer-events: none;
    -ms-pointer-events: none;
    -o-pointer-events: none;
    pointer-events: none;
    position: absolute
}
</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.18/js/i18n/defaults-ko_KR.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.18/dist/css/bootstrap-select.min.css">
</head>
<body>
      
    <h2 class="ttable1" style="color: black; font-weight: bold;">회원가입</h2>

    <div class="tttable">
        <div class="input-group mb-3">
            <div class="form-floating">
              <input type="text" class="form-control" id="phoneInput" required>
              <label for="phoneInput">*전화번호 입력</label>
            </div>            
            <button type="button" class="btn btn-primary">
                <span>
                    <span class="">인증하기</span>
                </span>
            </button>
        </div>
        <br>
        <div class="input-group mb-3">
            <div class="form-floating">
              <input type="text" class="form-control" id="confirmNumber1" required>
              <label for="confirmNumber1">*인증번호</label>
            </div>
            <button type="button" class="btn btn-primary">
                <span>
                    <span class="">인증확인</span>
                </span>
            </button>
        </div>
        <br>
        <div class="input-group mb-3">
            <div class="form-floating">
              <input type="text" class="form-control" id="idInput" required>
              <label for="idInput">*아이디 입력</label>
            </div>
            <button type="button" class="btn btn-primary">
                <span>
                    <span class="">중복확인</span>
                </span>
            </button>
        </div>
        <br>
        <div class="input-group mb-3">
            <div class="form-floating">
              <input type="text" class="form-control" id="nicknameInput" required>
              <label for="nicknameInput">*닉네임 입력</label>
            </div>
            <button type="button" class="btn btn-primary">
                <span>
                    <span class="">중복확인</span>
                </span>
            </button>
        </div>
        <br>
        <div class="input-group mb-3">
            <div class="form-floating">
              <input type="text" class="form-control" id="addressInput1" required>
              <label for="addressInput1">*주소 입력</label>
            </div>
            <div class="form-floating">
                <input type="text" class="form-control" id="addressInput2" >
                <label for="addressInput2">상세주소 입력</label>
              </div>
        </div>
        <br>
        <div class="input-group mb-3">
            <div class="form-floating">
              <input type="email" class="form-control" id="emailInput" required>
              <label for="emailInput">*이메일 입력</label>
            </div>
        </div>
        <br>
        <div class="input-group mb-3">
            <div class="form-floating">
              <input type="text" class="form-control" id="nameInput" required>
              <label for="nameInput">*이름 입력</label>
            </div>
        </div>
        <br>
        <div>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
                <label class="form-check-label" for="inlineRadio1">남자</label>
            </div>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
                <label class="form-check-label" for="inlineRadio2">여자</label>
            </div>
        </div>
        <br>
        <div class="input-group mb-3">
            <div class="form-floating">
              <input type="password" class="form-control" id="passwordInput" required>
              <label for="passwordInput">*비밀번호 </label>
            </div>
        </div>
        <br>
        <div class="input-group mb-3">
            <div class="form-floating">
              <input type="password" class="form-control" id="passwordCheckInput" required>
              <label for="passwordCheckInput">*비밀번호 확인</label>
            </div>
        </div>
        <br>
        <select class="form-select" aria-label="Default select example">
		  <option selected>관심있는 카테고리</option>
		  <option value="1">One</option>
		  <option value="2">Two</option>
		  <option value="3">Three</option>
		</select>
		<br>
        <button type="button" class="btn btn-primary">
            <span>
                <span class="">가입하기</span>
            </span>
        </button>
        <br>
        <div>
            &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;  이미 회원이신가요?
        <button type="button" class="btn btn-link" onclick="location.href='${contextPath}/loginenroll.me'">로그인하기</button>
        </div>
    </div>
    
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script>
        $(window).load(function () {
            $('body').sakura();
        });

        (function ($) {
    // requestAnimationFrame Polyfill
    (function () {
        var lastTime = 0;
        var vendors = ['ms', 'moz', 'webkit', 'o'];

        for (var x = 0; x < vendors.length && !window.requestAnimationFrame; ++x) {
            window.requestAnimationFrame = window[vendors[x] + 'RequestAnimationFrame'];
            window.cancelAnimationFrame = window[vendors[x] + 'CancelAnimationFrame'] || window[vendors[x] + 'CancelRequestAnimationFrame'];
        }

        if (!window.requestAnimationFrame)
            window.requestAnimationFrame = function (callback, element) {
                var currTime = new Date().getTime();
                var timeToCall = Math.max(0, 16 - (currTime - lastTime));
                var id = window.setTimeout(function () {
                        callback(currTime + timeToCall);
                    },
                    timeToCall);
                lastTime = currTime + timeToCall;

                return id;
            };

        if (!window.cancelAnimationFrame)
            window.cancelAnimationFrame = function (id) {
                clearTimeout(id);
            };
    }());

    // Sakura function.
    $.fn.sakura = function (options) {
        // We rely on these random values a lot, so define a helper function for it.
        function getRandomInt(min, max) {
            return Math.floor(Math.random() * (max - min + 1)) + min;
        }

        // Helper function to attach cross-browser events to an element.
        var prefixes = ['moz', 'ms', 'o', 'webkit', ''];
        var prefCount = prefixes.length;

        function prefixedEvent(element, type, callback) {
            for (var i = 0; i < prefCount; i++) {
                if (!prefixes[i]) {
                    type = type.toLowerCase();
                }

                element.get(0).addEventListener(prefixes[i] + type, callback, false);
            }
        }

        // Defaults for the option object, which gets extended below.
        var defaults = {
            blowAnimations: ['blow-soft-left', 'blow-medium-left', 'blow-hard-left', 'blow-soft-right', 'blow-medium-right', 'blow-hard-right'],
            className: 'sakura',
            fallSpeed: 0.5,
            maxSize: 14,
            minSize: 9,
            newOn: 300,
            swayAnimations: ['sway-0', 'sway-1', 'sway-2', 'sway-3', 'sway-4', 'sway-5', 'sway-6', 'sway-7', 'sway-8']
        };

        var options = $.extend({}, defaults, options);

        // Declarations.
        var documentHeight = $(document).height();
        var documentWidth = $(document).width();
        var sakura = $('<div class="' + options.className + '" />');

        // Set the overflow-x CSS property on the body to prevent horizontal scrollbars.
        $('body').css({ 'overflow-x': 'hidden' });

        // Function that inserts new petals into the document.
        var petalCreator = function () {
            setTimeout(function () {
                requestAnimationFrame(petalCreator);
            }, options.newOn);

            // Get one random animation of each type and randomize fall time of the petals.
            var blowAnimation = options.blowAnimations[Math.floor(Math.random() * options.blowAnimations.length)];
            var swayAnimation = options.swayAnimations[Math.floor(Math.random() * options.swayAnimations.length)];
            var fallTime = (Math.round(documentHeight * 0.007) + Math.random() * 5) * options.fallSpeed;

            var animations = 'fall ' + fallTime + 's linear 0s 1' + ', ' +
                blowAnimation + ' ' + (((fallTime > 30 ? fallTime : 30) - 20) + getRandomInt(0, 20)) + 's linear 0s infinite' + ', ' +
                swayAnimation + ' ' + getRandomInt(2, 4) + 's linear 0s infinite';
            var petal = sakura.clone();
            var size = getRandomInt(options.minSize, options.maxSize);
            var startPosLeft = Math.random() * documentWidth - 100;
            var startPosTop = -((Math.random() * 20) + 15);

            // Apply Event Listener to remove petals that reach the bottom of the page.
            prefixedEvent(petal, 'AnimationEnd', function () {
                $(this).remove();
            });

            // Apply Event Listener to remove petals that finish their horizontal float animation.
            prefixedEvent(petal, 'AnimationIteration', function (ev) {
                if ($.inArray(ev.animationName, options.blowAnimations) != -1) {
                    $(this).remove();
                }
            });

            petal
                .css({
                    '-webkit-animation': animations,
                    '-o-animation': animations,
                    '-ms-animation': animations,
                    '-moz-animation': animations,
                    animation: animations,
                    height: size,
                    left: startPosLeft,
                    'margin-top': startPosTop,
                    width: size
                })
                .appendTo('body');
        };


        // Recalculate documentHeight and documentWidth on browser resize.
        $(window).resize(function () {
            documentHeight = $(document).height();
            documentWidth = $(document).width();
        });

        // Finally: Start adding petals.
        requestAnimationFrame(petalCreator);
    };
}(jQuery));
    </script>
    

</body>
</html>