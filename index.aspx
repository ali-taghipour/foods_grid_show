<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html>

<html>
<head>
    <script src="script/JavaScript.js"></script>
    <script src="script/jquery.js"></script>
    <link href="style/base.css" rel="stylesheet" />
    <link href="style/grid.css" rel="stylesheet" />


    <script>

        fo = [];
        ve = "v1";

        function create_pager(psize) {
            $.ajax({
                url: "index.aspx/getsize",
                data: {},
                dataType: "json",
                contentType: "application/json",
                type: "post",

                success: function (res) {

                    wsize = res.d;
                    num = Math.ceil(wsize / psize);

                    $("#pager").empty();



                    for (i = 0; i < (num + 2); i++) {
                        pa = $("<li>").html(i);
                        $("#pager").append(pa);

                        $("#pager > li").css({
                            opacity: 0, position: "relative",
                            transform: "rotateZ(45deg) scale(0.85)", margin: "0px"
                        });
                        $("#pager > li").delay(i * 100).animate({
                            opacity: 1, transform: "rotateY(-45deg) scale(1)",
                            margin: "5px"
                        }, 500);

                    }
                    /* pager */
                    $("#pager").on("click", "li:not(.bi)", function () {

                        $("#pager > li").removeClass("sel");
                        $(this).addClass("sel");
                        $("#pager > li:eq(-1)").removeClass("sel").addClass("bi");
                        $("#pager > li:eq(0)").removeClass("sel").addClass("bi");

                        page = $(this).html();
                        size = $("#capacity > option:selected").html();

                        start = (page - 1) * size;
                        count = size;

                        fill(start, count, ve);
                    });

                    $("#pager > li:eq(1)").addClass("sel");

                    $("#pager > li:eq(0)").html("<");
                    $("#pager > li:eq(-1)").html(">");


                    $("#pager > li:eq(0)").on("click", function () {


                        for (p = 0; p < 1; p++) {

                            p = $("li.sel").html();
                            $("#pager > li.sel").removeClass("sel").prev("li").addClass("sel");


                            size = $("#capacity > option:selected").html();

                            start = (p - 1) * size;
                            count = size;

                            fill(start, count, ve);

                            if (p == 1) {
                                $("#pager > li.sel").removeClass("sel");
                                $("#pager > li:eq(1)").addClass("sel");

                                size = $("#capacity > option:selected").html();

                                start = (p - 1) * size;
                                count = size;

                                fill(start, count, ve);
                            }
                        }
                    });


                    $("#pager > li:eq(-1)").on("click", function () {

                        for (p = 0; p < 1; p++) {

                            p = $("li.sel").html();
                            $("#pager > li.sel").removeClass("sel").next("li").addClass("sel");


                            size = $("#capacity > option:selected").html();

                            start = p * size;
                            count = size;

                            fill(start, count, ve);

                            if (p == num) {
                                $("#pager > li.sel").removeClass("sel");
                                $("#pager > li:eq(1)").addClass("sel");

                                size = $("#capacity > option:selected").html();

                                start = (p - num) * size;
                                count = size;

                                fill(start, count, ve);
                            }
                        }

                    });


                },
                failure: function () { },

            });
        }

        function fill(start, count, ve) {
            $.ajax({
                url: "index.aspx/getAll",
                data: "{st:" + start + ",cu:" + count + "}",
                dataType: "json",
                contentType: "application/json",
                type: "post",

                success: function (res) {
                    fo = res.d;
                    $("#grid").empty();

                    for (i = 0; i < fo.length; i++) {
                        it = $("<div>").addClass("items");

                        im = $("<img>").attr({ src: "images/" + fo[i].pic });

                        mas = $("<div>").addClass("mask");

                        h = $("<h2>").html(fo[i].fname);

                        st = $("<span>").addClass("star").css({ width: fo[i].grade * 25 + "px" });

                        pr = $("<span>").addClass("price").html(fo[i].price + "$");

                        par = $("<p>").html(fo[i].describe);

                        mas.append(h).append(st).append(pr).append(par);
                        it.append(im).append(mas);
                        $("#grid").append(it);

                        im.delay((i + 1) * 3000).animate({ animation: "anim1" }, 500);
                    }
                },
                failure: function () { },

            });
        }

        $(document).ready(function () {
            create_pager(8);
            fill(8, 8, "v1");

            /* capacity */
            $("#capacity").change(function () {
                size = $("#capacity > option:selected").html();
                create_pager(size);

                fill(0, size, ve);
            });
            /* view */
            $(".view > li").on("click", function () {
                $(".view > li").removeClass("sel");
                $(this).addClass("sel");

                b = $(this).index() + 1;
                ve = "v" + b;

                $("#grid").removeClass().addClass("grid").addClass(ve);
            });
        });

    </script>

</head>
<body>
    <div id="header"></div>
    <div id="content">
        <div class="address">آشپزخانه مهندس</div>
        <div class="all">
            <div class="pager">
                <ul id="pager" runat="server">
                    <li class="right">< </li>
                    <li class="sel">1 </li>
                    <li>2 </li>
                    <li>3 </li>
                    <li class="left">> </li>
                </ul>
            </div>
            <div class="set">
                <ul class="view">
                    <li class="sel"></li>
                    <li></li>
                </ul>
                <select id="capacity">
                    <option>4 </option>
                    <option selected>8 </option>
                    <option>16 </option>
                </select>
            </div>
            <div id="grid" class="grid v1" runat="server">
                <%--                <div class="items">
                    <img src="images/images/shixon/07.bmp" />
                    <div class="mask">
                        <h2> عطر بدبو </h2>
                        <span class="star"> </span>
                        <p> عطری که در یک ثانیه آدما را میکشد </p>
                        <span class="price"> 250$ </span>
                    </div>
                </div>--%>
            </div>
        </div>
    </div>


    <script>

        atrha = [{ fname: "خفن", price: 20000, grade: 3, pic: "01.bmp", describe: "مثلا خوشبو هسته . . ." },
        { fname: "حسن", price: 25000, grade: 2, pic: "02.bmp", describe: "مثلا بدبو هسته . . ." },
        { fname: "ژیلا", price: 35000, grade: 4, pic: "03.bmp", describe: "مثلا کرم هسته . . ." },
        { fname: "jaguar", price: 25000, grade: 2, pic: "04.bmp", describe: "مثلا گرون هسته . . ." },
        { fname: "خفن", price: 20000, grade: 5, pic: "05.bmp", describe: "مثلا خوشبو هسته . . ." },
        { fname: "حسن", price: 25000, grade: 1, pic: "06.bmp", describe: "مثلا بدبو هسته . . ." },
        { fname: "ژیلا", price: 35000, grade: 3, pic: "07.bmp", describe: "مثلا کرم هسته . . ." },
        { fname: "jaguar", price: 25000, grade: 2, pic: "08.jpg", describe: "مثلا گرون هسته . . ." }

        ];

    </script>
</body>
</html>
