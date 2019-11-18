<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.impl.NUserServiceImpl" %>
<%@ page import="vo.user.NUser" %>
<%@ page language="java" pageEncoding="gbk"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="gbk">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>bankms - 财务分析</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <!-- Google fonts - Popppins for copy-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,800">
    <!-- orion icons-->
    <link rel="stylesheet" href="css/orionicons.css">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="css/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="img/favicon.png?3">
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
</head>
<body>
<!-- navbar-->

<%@include file="WEB-INF/header.jsp"%>
<div class="d-flex align-items-stretch">
    <%@include file="WEB-INF/sidebar.jsp"%>
    <%
        NUserServiceImpl nudao=new NUserServiceImpl();
        NUser user = nudao.getNUserByuID(Long.parseLong(uID));

        Long cardID = (long)allBc.get(0).getID();
//	Long cardID = 1000000000000024L;
        session.setAttribute("cardID",cardID);
        if(request.getAttribute("analysis")==null){
            request.getRequestDispatcher("p_AnalysisServlet").forward(request, response);
        }
        vo.Analysis analysis = (vo.Analysis)request.getAttribute("analysis");
        String startTime = request.getParameter("startTime");
        if(startTime==null){
            startTime = "2018-07";
        }
        String endTime = request.getParameter("endTime");
        if(endTime==null){
            endTime = "2019-06";
        }
        List<Object> incomeList = new ArrayList();
        List<Object> expenseList = new ArrayList();
        List<Object> xLabel = new ArrayList();
        String[] inLabel = analysis.getIncomeLabel();
        String[] exLabel = analysis.getExpenceLabel();
        List<Object> inTypeList = new ArrayList();
        List<Object> extypeList = new ArrayList();
        double income=0,expense=0;

        String[] s= startTime.split("-");
        int startYear = Integer.parseInt(s[0]);
        int startMonth = Integer.parseInt(s[1]);
        s = endTime.split("-");
        int endYear = Integer.parseInt(s[0]);
        int endMonth = Integer.parseInt(s[1]);

        for(i = startYear;i<=endYear;i++){
            for (int j = 1;j<=12;j++){
                if(startYear==i&&startMonth>j||endYear==i&&endMonth<j){
                    continue;
                }
                String xl = i+"-"+j;
                xLabel.add(xl);
                if(analysis.getIncomes().get(String.valueOf(i))!=null && analysis.getIncomes().get(String.valueOf(i)).get(String.valueOf(j))!=null) {
                    double in = (double)analysis.getIncomes().get(String.valueOf(i)).get(String.valueOf(j));
                    incomeList.add(in);
                    income+=in;
                }else{
                    double in = 0;
                    incomeList.add(in);
                }
                if(analysis.getExpences().get(String.valueOf(i))!=null && analysis.getExpences().get(String.valueOf(i)).get(String.valueOf(j))!=null) {
                    double ex = (double)analysis.getExpences().get(String.valueOf(i)).get(String.valueOf(j));
                    expenseList.add(ex);
                    expense+=ex;
                }else{
                    double ex = 0;
                    expenseList.add(ex);
                }
            }
        }
//	System.out.println(incomeList);
//	System.out.println(expenseList);
//	System.out.println(xLabel);
        for(String oo:inLabel){
            if(analysis.getTypeIncomes().get(oo)==null){
                continue;
            }
            double tin = 0;
            for(int j = startYear;j<=endYear;j++){
                for (int k = 1;k<=12;k++) {
                    if(startYear==j&&startMonth>k||endYear==j&&endMonth<k){
                        continue;
                    }
                    if(analysis.getTypeIncomes().get(oo).get(String.valueOf(j))!=null && analysis.getTypeIncomes().get(oo).get(String.valueOf(j)).get(String.valueOf(k))!=null){
                        tin +=(double)analysis.getTypeIncomes().get(oo).get(String.valueOf(j)).get(String.valueOf(k));
                    }
                }
            }
            inTypeList.add(tin);
        }
        for(String o:exLabel){
            if(analysis.getTypeExpences().get(o)==null){
                continue;
            }
            double tex = 0;
            for(int j = startYear;j<=endYear;j++){
                for (int k = 1;k<=12;k++) {
                    if(startYear==j&&startMonth>k||endYear==j&&endMonth<k){
                        continue;
                    }
                    if(analysis.getTypeExpences().get(o).get(String.valueOf(j))!=null && analysis.getTypeExpences().get(o).get(String.valueOf(j)).get(String.valueOf(k))!=null){
                        tex +=(double)analysis.getTypeExpences().get(o).get(String.valueOf(j)).get(String.valueOf(k));
                    }
                }
            }
            extypeList.add(tex);
        }
        System.out.println(inTypeList);
        System.out.println(extypeList);
    %>
    <div class="page-holder w-100 d-flex flex-wrap">
        <div class="container-fluid px-xl-5">
            <section class="py-3">
                <div class="row mb-1">
                    <div class="col-lg-12 mb-1">
                        <div class="card">

                            <div class="card-body ">
                                <form class="form-inline" action="p_Analysis.jsp">

                                    <div class="col-lg-4 form-group">
                                        <label  class="col-md form-control-label" for="startTime">开始时间</label>
                                        <input  type="month" class='form-control' id="startTime"  name="startTime" value="<%=startTime%>"/>
                                    </div>
                                    <div class="col-lg-4 form-group">
                                        <label class="col-md form-control-label" for="endTime">结束时间</label>
                                        <input type='month' class='form-control' id='endTime' name='endTime' value='<%=endTime%>'>
                                    </div>
                                    <div class="col-lg-4 form-group">
                                        <button class="btn btn-outline-blue" type="submit">查询</button>

                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <section class="py-2">
                <div class="row mb-1">

                    <div class="col-xl-3 col-lg-6 mb-1 mb-xl-0">
                        <div class="bg-white shadow roundy p-4 h-100 d-flex align-items-center justify-content-between">
                            <div class="flex-grow-1 d-flex align-items-center">
                                <div class="dot mr-3 bg-red"></div>
                                <div class="text">
                                    <span class="text-gray">收入</span><h5 class="mb-0 text-dark"><%=income%></h5>
                                </div>
                            </div>
                            <div class="icon text-white bg-red"><i class="fas fa-receipt"></i></div>
                        </div>
                    </div>

                    <div class="col-xl-3 col-lg-6 mb-1 mb-xl-0">
                        <div class="bg-white shadow roundy p-4 h-100 d-flex align-items-center justify-content-between">
                            <div class="flex-grow-1 d-flex align-items-center">
                                <div class="dot mr-3 bg-blue"></div>
                                <div class="text">
                                    <span class="text-gray">支出</span><h5 class="mb-0 text-dark"><%=expense%></h5>
                                </div>
                            </div>
                            <div class="icon text-white bg-blue"><i class="fa fa-dolly-flatbed"></i></div>
                        </div>
                    </div>

                    <div class="col-xl-3 col-lg-6 mb-1 mb-xl-0">
                        <div class="bg-white shadow roundy p-4 h-100 d-flex align-items-center justify-content-between">
                            <div class="flex-grow-1 d-flex align-items-center">
                                <div class="dot mr-3 bg-violet"></div>
                                <div class="text">
                                    <span class="text-gray">收益</span><h5 class="mb-0 text-dark"><%=income-expense%></h5>
                                </div>
                            </div>
                            <div class="icon text-white bg-violet"><i class="fas fa-server"></i></div>
                        </div>
                    </div>

                    <div class="col-xl-3 col-lg-6 mb-1 mb-xl-0">
                        <div class="bg-white shadow roundy p-4 h-100 d-flex align-items-center justify-content-between">
                            <div class="flex-grow-1 d-flex align-items-center">
                                <div class="dot mr-3 bg-green"></div>
                                <div class="text">
                                    <span class="text-gray">总流水</span><h5 class="mb-0 text-dark"><%=income+expense%></h5>
                                </div>
                            </div>
                            <div class="icon text-white bg-green"><i class="far fa-clipboard"></i></div>
                        </div>
                    </div>
                </div>
            </section>
            <section>
                <section class="py-5">
                    <div class="row mb-4">
                        <div class="col-lg-6 mb-4 mb-lg-0 ">
                            <div class="card">
                                <div class="card-header">
                                    <h2 class="h6 text-uppercase mb-0">面积图</h2>
                                </div>
                                <div class="card-body">
                                    <p class="mb-5 text-gray">Lorem ipsum dolor sit amet, consectetur adipisicing elit</p>
                                    <div class="chart-holder mt-5 mb-5">
                                        <canvas id="lineChartExample"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-6">
                            <div class="card">
                                <div class="card-header">
                                    <h2 class="h6 mb-0 text-uppercase">直方图</h2>
                                </div>
                                <div class="card-body">
                                    <p class="mb-5 text-gray">Lorem ipsum dolor sit amet, consectetur adipisicing elit</p>
                                    <div class="chart-holder mt-5 mb-5">
                                        <canvas id="barChartExample1"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-6">
                            <div class="card mb-4">
                                <div class="card-header">
                                    <h2 class="h6 text-uppercase mb-0">收入类别占比</h2>
                                </div>
                                <div class="card-body">
                                    <p class="mb-3 text-gray">Lorem ipsum dolor sit amet.</p>
                                    <div class="chart-holder">
                                        <canvas id="doughnutChartExample"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="card mb-4">
                                <div class="card-header">
                                    <h2 class="h6 text-uppercase mb-0">支出类别占比</h2>
                                </div>
                                <div class="card-body">
                                    <p class="mb-3 text-gray">Lorem ipsum dolor sit amet.</p>
                                    <div class="chart-holder">
                                        <canvas id="pieChartExample"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card mb-4">
                                <div class="card-header">
                                    <h2 class="h6 text-uppercase mb-0">收支雷达图</h2>
                                </div>
                                <div class="card-body">
                                    <p class="mb-3 text-gray">Lorem ipsum dolor sit amet.</p>
                                    <div class="chart-holder">
                                        <canvas id="radarChartExample"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </section>
        </div>
    </div>
</div>
<!-- JavaScript files-->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/popper.js/umd/popper.min.js"> </script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="vendor/jquery.cookie/jquery.cookie.js"> </script>
<script src="vendor/chart.js/Chart.min.js"></script>
<script src="js/js.cookie.min.js"></script>
<script src="js/front.js"></script>

<%--chart-cuntom.js--%>
<script>
    $(function () {


        var violet = '#DF99CA',
            red    = '#F0404C',
            green  = '#7CF29C';

        // ------------------------------------------------------- //
        // Charts Gradients
        // ------------------------------------------------------ //
        var ctx1 = $("canvas").get(0).getContext("2d");
        var gradient1 = ctx1.createLinearGradient(150, 0, 150, 300);
        gradient1.addColorStop(0, 'rgba(210, 114, 181, 0.91)');
        gradient1.addColorStop(1, 'rgba(177, 62, 162, 0)');

        var gradient2 = ctx1.createLinearGradient(10, 0, 150, 300);
        gradient2.addColorStop(0, '#00897B');
        gradient2.addColorStop(1, '#26C6DA');


        // ------------------------------------------------------- //
        // Line Chart
        // ------------------------------------------------------ //

        var LINECHARTEXMPLE   = $('#lineChartExample');
        var lineChartExample = new Chart(LINECHARTEXMPLE, {

            type: 'line',
            options: {
                legend: {labels:{fontColor:"#777", fontSize: 12}},
                scales: {
                    xAxes: [{
                        display: true,
                        gridLines: {
                            color: '#fff'
                        }
                    }],
                    yAxes: [{
                        display: true,
                        // ticks: {
                        // 	max: 100,
                        // 	min: 0
                        // },
                        gridLines: {
                            color: '#fff'
                        }
                    }]
                },
            },
            data: {
                labels:[
                    <%
                    out.print("\""+xLabel.get(0)+"\"");
                    for (i = 1;i<xLabel.size();i++){
                        out.print(",\""+xLabel.get(i)+"\"");
                    }
                    %>
                ],
                datasets: [
                    {
                        label: "收入",
                        fill: true,
                        lineTension: 0.3,
                        backgroundColor: gradient1,
                        borderColor: 'rgba(210, 114, 181, 0.91)',
                        borderCapStyle: 'butt',
                        borderDash: [],
                        borderDashOffset: 0.0,
                        borderJoinStyle: 'miter',
                        borderWidth: 2,
                        pointBorderColor: gradient1,
                        pointBackgroundColor: "#fff",
                        pointBorderWidth: 2,
                        pointHoverRadius: 5,
                        pointHoverBackgroundColor: gradient1,
                        pointHoverBorderColor: "rgba(220,220,220,1)",
                        pointHoverBorderWidth: 2,
                        pointRadius: 1,
                        pointHitRadius: 10,
                        data: [
                            <%
                            out.print("\""+incomeList.get(0)+"\"");
                            for (i = 1;i<incomeList.size();i++){
                                out.print(",\""+incomeList.get(i)+"\"");
                            }
                            %>
                        ],
                        spanGaps: false
                    },
                    {
                        label: "支出",
                        fill: true,
                        lineTension: 0.3,
                        backgroundColor: gradient2,
                        borderColor: 'rgba(210, 114, 181, 0.91)',
                        borderCapStyle: 'butt',
                        borderDash: [],
                        borderDashOffset: 0.0,
                        borderJoinStyle: 'miter',
                        borderWidth: 2,
                        pointBorderColor: gradient2,
                        pointBackgroundColor: "#fff",
                        pointBorderWidth: 2,
                        pointHoverRadius: 5,
                        pointHoverBackgroundColor: gradient2,
                        pointHoverBorderColor: "rgba(220,220,220,1)",
                        pointHoverBorderWidth: 2,
                        pointRadius: 1,
                        pointHitRadius: 10,
                        data: [
                            <%
                            out.print("\""+expenseList.get(0)+"\"");
                            for (i = 1;i<expenseList.size();i++){
                                out.print(",\""+expenseList.get(i)+"\"");
                            }
                            %>
                        ],
                        spanGaps: false
                    }
                ]
            }
        });

        // ------------------------------------------------------- //
        // Bar Chart
        // ------------------------------------------------------ //
        var BARCHARTEXMPLE    = $('#barChartExample1');
        var barChartExample = new Chart(BARCHARTEXMPLE, {
            type: 'bar',
            options: {
                legend: {
                    display: true,
                    labels:{fontColor:"#777", fontSize: 12}
                },
                scales: {
                    xAxes: [{
                        display: true,
                        gridLines: {
                            color: '#fff'
                        }
                    }],
                    yAxes: [{
                        display: true,
                        // ticks: {
                        // 	max: 100,
                        // 	min: 0
                        // },
                        gridLines: {
                            color: '#fff'
                        }
                    }]
                },

            },
            data: {
                labels: [
                    <%
                    out.print("\""+xLabel.get(0)+"\"");
                    for (i = 1;i<xLabel.size();i++){
                        out.print(",\""+xLabel.get(i)+"\"");
                    }
                    %>
                ],
                datasets: [
                    {
                        label: "收入",
                        backgroundColor: [
                            <%
                            for(i = 0;i<xLabel.size()-1;i++){
                                out.println("gradient1,");
                            }
                            out.println("gradient1");
                            %>
                        ],
                        hoverBackgroundColor: [
                            <%
                            for(i = 0;i<xLabel.size()-1;i++){
                                out.println("gradient1,");
                            }
                            out.println("gradient1");
                            %>

                        ],
                        borderColor: [
                            <%
                            for(i = 0;i<xLabel.size()-1;i++){
                                out.println("gradient1,");
                            }
                            out.println("gradient1");
                            %>
                        ],
                        borderWidth: 1,
                        data: [
                            <%
                            out.print("\""+incomeList.get(0)+"\"");
                            for (i = 1;i<incomeList.size();i++){
                                out.print(",\""+incomeList.get(i)+"\"");
                            }
                            %>
                        ],
                    },
                    {
                        label: "支出",
                        backgroundColor: [
                            <%
                            for(i = 0;i<xLabel.size()-1;i++){
                                out.println("gradient2,");
                            }
                            out.println("gradient2");
                            %>

                        ],
                        hoverBackgroundColor: [
                            <%
                            for(i = 0;i<xLabel.size()-1;i++){
                                out.println("gradient2,");
                            }
                            out.println("gradient2");
                            %>
                        ],
                        borderColor: [
                            <%
                            for(i = 0;i<xLabel.size()-1;i++){
                                out.println("gradient2,");
                            }
                            out.println("gradient2");
                            %>
                        ],
                        borderWidth: 1,
                        data: [
                            <%
                            out.print("\""+expenseList.get(0)+"\"");
                            for (i = 1;i<expenseList.size();i++){
                                out.print(",\""+expenseList.get(i)+"\"");
                            }
                            %>
                        ],
                    }
                ]
            }
        });



        // ------------------------------------------------------- //
        // Doughnut Chart
        // ------------------------------------------------------ //
        var DOUGHNUTCHARTEXMPLE  = $('#doughnutChartExample');
        var pieChartExample = new Chart(DOUGHNUTCHARTEXMPLE, {
            type: 'doughnut',
            options: {
                cutoutPercentage: 80,
            },
            data: {
                labels: [
                    <%
                        out.print("\""+inLabel[0]+"\"");
                        for (i = 1;i<inLabel.length;i++){
                            out.print(",\""+inLabel[i]+"\"");
                        }
                     %>
                ],
                datasets: [
                    {
                        data: [
                            <%
                            out.print("\""+inTypeList.get(0)+"\"");
                            for (i = 1;i<inTypeList.size();i++){
                                out.print(",\""+inTypeList.get(i)+"\"");
                            }
                            %>
                        ],
                        borderWidth: 0,
                        backgroundColor: [
                            '#df99ca',
                            '#c374ab',
                            "#a44e8a",
                            "#81376a"
                        ],
                        hoverBackgroundColor: [
                            '#df99ca',
                            '#c374ab',
                            "#a44e8a",
                            "#81376a"
                        ]
                    }]
            }
        });

        var pieChartExample = {
            responsive: true
        };

        // ------------------------------------------------------- //
        // Pie Chart
        // ------------------------------------------------------ //
        var PIECHARTEXMPLE    = $('#pieChartExample');
        var pieChartExample = new Chart(PIECHARTEXMPLE, {
            type: 'pie',
            data: {
                labels: [
                    <%
                        out.print("\""+exLabel[0]+"\"");
                        for (i = 1;i<exLabel.length;i++){
                            out.print(",\""+exLabel[i]+"\"");
                        }
				    %>
                ],
                datasets: [
                    {
                        data: [
                            <%
                            out.print("\""+extypeList.get(0)+"\"");
                            for (i = 1;i<extypeList.size();i++){
                                out.print(",\""+extypeList.get(i)+"\"");
                            }
                            %>
                        ],
                        borderWidth: 0,
                        backgroundColor: [
                            green,
                            "#CEFFCE",
                            "#93FF93",
                            "#28FF28",
                            "#50c670",
                            "#3fac5c",
                            "#2a8746"
                        ],
                        hoverBackgroundColor: [
                            green,
                            "#CEFFCE",
                            "#93FF93",
                            "#28FF28",
                            "#50c670",
                            "#3fac5c",
                            "#2a8746"
                        ]
                    }]
            }
        });



        // ------------------------------------------------------- //
        // Radar Chart
        // ------------------------------------------------------ //
        var RADARCHARTEXMPLE  = $('#radarChartExample');
        var radarChartExample = new Chart(RADARCHARTEXMPLE, {
            type: 'radar',
            data: {
                labels: [
                    <%
                        out.print("\""+xLabel.get(0)+"\"");
                        for (i = 1;i<xLabel.size();i++){
                            out.print(",\""+xLabel.get(i)+"\"");
                        }
                    %>
                ],
                datasets: [
                    {
                        label: "收入",
                        backgroundColor: "rgba(252, 117, 176, 0.4)",
                        borderWidth: 2,
                        borderColor: "rgba(252, 117, 176, 0.84)",
                        pointBackgroundColor: "rgba(252, 117, 176, 0.84)",
                        pointBorderColor: "#fff",
                        pointHoverBackgroundColor: "#fff",
                        pointHoverBorderColor: "rgba(252, 117, 176, 0.84)",
                        data: [
                            <%
                            out.print("\""+incomeList.get(0)+"\"");
                            for (i = 1;i<incomeList.size();i++){
                                out.print(",\""+incomeList.get(i)+"\"");
                            }
                            %>
                        ]
                    },
                    {
                        label: "支出",
                        backgroundColor: "rgba(250, 199, 106, 0.4)",
                        borderWidth: 2,
                        borderColor: "rgba(250, 199, 106, 0.92)",
                        pointBackgroundColor: "rgba(250, 199, 106, 0.92)",
                        pointBorderColor: "#fff",
                        pointHoverBackgroundColor: "#fff",
                        pointHoverBorderColor: "rgba(250, 199, 106, 0.92)",
                        data: [
                            <%
                            out.print("\""+expenseList.get(0)+"\"");
                            for (i = 1;i<expenseList.size();i++){
                                out.print(",\""+expenseList.get(i)+"\"");
                            }
                            %>
                        ]
                    }
                ]
            }
        });
        var radarChartExample = {
            responsive: true
        };



    });

</script>
</body>
</html>