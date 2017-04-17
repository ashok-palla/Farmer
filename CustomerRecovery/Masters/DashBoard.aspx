<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DashBoard.aspx.cs" Inherits="Masters_DashBoard" MasterPageFile="~/MasterPage/CRMaster.master" %>

<asp:Content ContentPlaceHolderID="CRMasterHead" runat="server"></asp:Content>
<asp:Content ContentPlaceHolderID="CRMasterBody" runat="server">
     <script src="../APPRequires/highcharts/4.2.0/highcharts.js"></script>
    <script src="../APPRequires/highcharts/4.2.0/highcharts-3d.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>
    <div class="panel-body PagePanelBody">
        <a class="btn btn-warning pull-right" role="button" id="ReportCollasseButton" data-toggle="collapse" href="#ReportCollassePanel" aria-expanded="false" aria-controls="ReportCollassePanel" title="Filters" style="height: 16px; -ms-border-radius: 0; border-radius: 0; -ms-border-bottom-left-radius: 4px; border-bottom-left-radius: 4px; -ms-border-bottom-right-radius: 4px; border-bottom-right-radius: 4px; padding-top: 0; padding-bottom: 0; margin-bottom: 2px; color: white"><span class="glyphicon glyphicon-chevron-down"></span></a>
        <div class="collapse" id="ReportCollassePanel">
            <div class="panel-body" style="border: 1px solid #ebebeb">

                <div class="form-group form-group-sm" style="margin-bottom: 0">
                    <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; padding-top: 5px; text-align: right">City </label>
                    <div class="col-lg-6" style="padding-bottom: 1%">
                        <select class="form-control form-control col-xs-4 col-md-4 col-lg-2 input-sm " name="DROP_DOWN_CITY_FOR_REPORT" id="DROP_DOWN_CITY_FOR_REPORT" style="width: 100%"></select>
                    </div>
                </div>

                <div class="form-group form-group-sm" style="margin-bottom: 0">
                    <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; padding-top: 5px; text-align: right">Eexecutive </label>
                    <div class="col-lg-6" style="padding-bottom: 1%">
                        <select class="chosen-select form-control form-control col-xs-4 col-md-4 col-lg-2 input-sm " name="DROP_DOWN_EXECUTIVE_FOR_REPORT" id="DROP_DOWN_EXECUTIVE_FOR_REPORT" style="width: 100%"></select>
                    </div>
                </div>

                <div class="form-group form-group-sm" style="margin-bottom: 0">
                    <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; padding-top: 5px; text-align: right">Bank </label>
                    <div class="col-lg-6" style="padding-bottom: 1%">
                        <select class="chosen-select form-control form-control col-xs-4 col-md-4 col-lg-2 input-sm" name="DROP_DOWN_BANK_FOR_REPORT" id="DROP_DOWN_BANK_FOR_REPORT" style="width: 100%"></select>
                    </div>
                </div>

                <div class="form-group form-group-sm" style="margin-bottom: 0">
                    <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right">From Date(<%=DateFormatForDatePicker%>)</label>
                    <div class="col-lg-6" style="padding-bottom: 1%">
                        <input type="tel" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2" name="TEXT_BOX_FROMDATE_FOR_REPORT" id="TEXT_BOX_FROMDATE_FOR_REPORT" style="width: 100%" />
                    </div>
                </div>

                <div class="form-group form-group-sm" style="margin-bottom: 0">
                    <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right">To Date(<%=DateFormatForDatePicker%>)</label>
                    <div class="col-lg-6" style="padding-bottom: 1%">
                        <input type="tel" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2" name="TEXT_BOX_TODATE_FOR_REPORT" id="TEXT_BOX_TODATE_FOR_REPORT" style="width: 100%" />
                    </div>
                </div>
                <div class="form-group form-group-sm" style="margin-bottom: 0">
                    <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right"></label>
                    <div class="col-lg-6" style="padding-bottom: 1%">
                        <input type="button" id="SubmitMethod" class="btn btn-default" value="Submit" />
                    </div>
                </div>
            </div>
        </div>
        <div class="panel panel-primary DashBoardChart col-lg-12" style="border-color: #00a0af !important;">
            <div id="NPA_Details_Status" class="panel-body"></div>
        </div>
        <div class="panel panel-primary DashBoardChart col-lg-12" style="border-color: #00a0af !important;">
            <div id="Bank_and_Branch_Wise_NPA_Recovery_Status" class="panel-body"></div>
        </div>
        <div class="panel panel-primary DashBoardChart col-lg-12" style="border-color: #00a0af !important;">
            <div id="Bank_and_Branch_Wise_NPA_Recovery_Status_Amount" class="panel-body"></div>
        </div>
        <div class="panel panel-primary DashBoardChart col-lg-12" style="border-color: #00a0af !important;">
            <div id="BANK_AND_BRANCH_WISE_BILLING" class="panel-body"></div>
        </div>
    </div>
    <script>
        $(function () {
            $("#DROP_DOWN_CITY_FOR_REPORT").change(function () {
                EXECUTIVEDROPDOWN_FOR_REPORT();
                BANKDROPDOWN_FOR_REPORT();
            });

            $("#ReportCollasseButton").click(function () {
                if (!$("#ReportCollassePanel").hasClass('in')) {
                    EXECUTIVEDROPDOWN_FOR_REPORT();
                    BANKDROPDOWN_FOR_REPORT();
                    CITY_FOR_REPORT();
                    $("#TEXT_BOX_TODATE_FOR_REPORT").datepicker({
                        changeMonth: true,
                        changeYear: true
                        //onClose: function (selectedDate) {
                        //    $("#TEXT_BOX_FROMDATE_FOR_REPORT").datepicker("option", "minDate", selectedDate);
                        //}
                    }).datepicker("setDate", new Date());
                    $("#TEXT_BOX_FROMDATE_FOR_REPORT").datepicker({
                        changeMonth: true,
                        changeYear: true,
                        onClose: function (selectedDate) {
                            $("#TEXT_BOX_TODATE_FOR_REPORT").datepicker("option", "minDate", selectedDate);
                        }
                    }).datepicker("setDate", new Date());
                    $("#TEXT_BOX_FROMDATE_FOR_REPORT,#TEXT_BOX_TODATE_FOR_REPORT").val("");
                }
            });

            Bank_and_Branch_Wise_NPA_Recovery_Status();
            NPA_Details_Status();
            BANK_AND_BRANCH_WISE_BILLING();
            $("#SubmitMethod").click(function () {
                Bank_and_Branch_Wise_NPA_Recovery_Status();
                NPA_Details_Status();
                BANK_AND_BRANCH_WISE_BILLING();
            });

        });
        function NPA_Details_Status() {
            $(function () {
                var obj = {};
                obj.EXID = $("#DROP_DOWN_EXECUTIVE_FOR_REPORT").val() == -1 ? null : $("#DROP_DOWN_EXECUTIVE_FOR_REPORT").val();
                obj.Bank = $("#DROP_DOWN_BANK_FOR_REPORT").val() == -1 ? null : $("#DROP_DOWN_BANK_FOR_REPORT").val();
                obj.CityID = $("#DROP_DOWN_CITY_FOR_REPORT").val() == -1 ? null : $("#DROP_DOWN_CITY_FOR_REPORT").val();
                obj.FDATE = $("#TEXT_BOX_FROMDATE_FOR_REPORT").val();
                obj.TDATE = $("#TEXT_BOX_TODATE_FOR_REPORT").val();
                $.ajax({
                    async: false,
                    type: "POST",
                    url: "DashBoard.aspx/NPA_Details_Status",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify(obj),
                    success: function (data) {
                        if (data != null) {
                            if (data.d.length > 0) {
                                $('#NPA_Details_Status').highcharts({
                                    chart: {
                                        type: 'pie',
                                        height: 380,
                                        options3d: {
                                            enabled: true,
                                            alpha: 35,
                                            beta: 0
                                        }
                                    },
                                    title: {
                                        text: "Total NPA's Count - " + data.d[0].TOTAL,
                                        style: {
                                            fontWeight: 'bold'
                                        }
                                    },
                                    credits: {
                                        enabled: true,
                                        href: "http://www.atharvana.com",
                                        text: "Atharvana.com",
                                    },
                                    tooltip: {
                                        pointFormat: '{series.name}: <b>{point.y}</b>'
                                    },
                                    plotOptions: {
                                        pie: {
                                            allowPointSelect: true,
                                            cursor: 'pointer',
                                            depth: 35,
                                            dataLabels: {
                                                enabled: true,
                                                format: '<b>{point.name}</b>: {point.y} ',
                                                color: 'black',
                                                style: {
                                                    textShadow: undefined
                                                }
                                            }
                                        }
                                    },
                                    series: [{
                                        name: 'Count',
                                        colorByPoint: true,
                                        data: [{
                                            name: 'Pending',
                                            color: 'rgba(89, 154, 211,1)',
                                            y: data.d[0].OPEN
                                        }, {
                                            name: 'Close',
                                            color: 'rgba(158, 102, 171,1)',
                                            y: data.d[0].CLOSE
                                        }]
                                    }]
                                });
                            }
                            else {
                                $('#NPA_Details_Status').highcharts({
                                    chart: {
                                        type: 'pie',
                                        height: 380,
                                    },
                                    title: {
                                        text: "Total NPA's Count - 0",
                                        style: {
                                            fontWeight: 'bold'
                                        }
                                    },
                                    credits: {
                                        enabled: true,
                                        href: "http://www.atharvana.com",
                                        text: "Atharvana.com",
                                    },
                                    tooltip: {
                                        pointFormat: '{series.name}: <b>{point.y}</b>'
                                    },
                                    plotOptions: {
                                        pie: {
                                            allowPointSelect: false,
                                            cursor: 'pointer',
                                            dataLabels: {
                                                enabled: true,
                                                format: '<b>{point.name}</b>: {point.y} ',
                                                color: 'black',
                                                style: {
                                                    textShadow: undefined
                                                }
                                            }
                                        }
                                    },
                                    series: [{
                                        name: 'Count',
                                        colorByPoint: true,
                                        data: [{
                                            name: 'Pending',
                                            color: 'rgba(89, 154, 211,1)',
                                            y: 0
                                        }, {
                                            name: 'Close',
                                            color: 'rgba(158, 102, 171,1)',
                                            y: 0
                                        }]
                                    }]
                                });
                            }
                        }
                        else {
                            $('#NPA_Details_Status').highcharts({
                                chart: {
                                    type: 'pie',
                                    height: 380,
                                },
                                title: {
                                    text: "Total NPA's Count - 0",
                                    style: {
                                        fontWeight: 'bold'
                                    }
                                },
                                tooltip: {
                                    pointFormat: '{series.name}: <b>{point.y}</b>'
                                },
                                credits: {
                                    enabled: true,
                                    href: "http://www.atharvana.com",
                                    text: "Atharvana.com",
                                },
                                plotOptions: {
                                    pie: {
                                        allowPointSelect: false,
                                        cursor: 'pointer',
                                        dataLabels: {
                                            enabled: true,
                                            format: '<b>{point.name}</b>: {point.y} ',
                                            color: 'black',
                                            style: {
                                                textShadow: undefined
                                            }
                                        }
                                    }
                                },
                                series: [{
                                    name: 'Count',
                                    colorByPoint: true,
                                    data: [{
                                        name: 'Pending',
                                        color: 'rgba(89, 154, 211,1)',
                                        y: 0
                                    }, {
                                        name: 'Close',
                                        color: 'rgba(158, 102, 171,1)',
                                        y: 0
                                    }]
                                }]
                            });
                        }
                    }
                });
            });
        }
        function Bank_and_Branch_Wise_NPA_Recovery_Status() {
            var CATEGORIES = [];
            var OPEN = [];
            var CLOSE = [];
            var RECOVERY_AMOUNT = [];
            var UNRECOVERY_AMOUNT = [];
            var obj = {};
            obj.EXID = $("#DROP_DOWN_EXECUTIVE_FOR_REPORT").val() == -1 ? null : $("#DROP_DOWN_EXECUTIVE_FOR_REPORT").val();
            obj.Bank = $("#DROP_DOWN_BANK_FOR_REPORT").val() == -1 ? null : $("#DROP_DOWN_BANK_FOR_REPORT").val();
            obj.CityID = $("#DROP_DOWN_CITY_FOR_REPORT").val() == -1 ? null : $("#DROP_DOWN_CITY_FOR_REPORT").val();
            obj.FDATE = $("#TEXT_BOX_FROMDATE_FOR_REPORT").val();
            obj.TDATE = $("#TEXT_BOX_TODATE_FOR_REPORT").val();
            $.ajax({
                async: false,
                type: "POST",
                url: "DashBoard.aspx/Bank_and_Branch_Wise_NPA_Recovery_Status",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify(obj),
                success: function (data) {
                    if (data != null) {
                        if (data.d.length > 0) {
                            for (var i = 0; i < data.d.length; i++) {
                                CATEGORIES.push(data.d[i].BANKNAME);
                                OPEN.push(data.d[i].OPEN);
                                CLOSE.push(data.d[i].CLOSE);

                                RECOVERY_AMOUNT.push(data.d[i].RECOVERY_AMOUNT);
                                UNRECOVERY_AMOUNT.push(data.d[i].UNRECOVERY_AMOUNT);
                            }
                        }
                        $('#Bank_and_Branch_Wise_NPA_Recovery_Status').highcharts({
                            chart: {
                                renderTo: 'Bank_and_Branch_Wise_NPA_Recovery_Status',
                                type: 'column',
                                zoomType: 'x',
                                height: 380,
                            },
                            title: {
                                text: 'Bank and Branch Wise NPA Status',
                                style: {
                                    fontWeight: 'bold'
                                }
                            },
                            legend: {
                                layout: 'vertical',
                                align: 'left',
                                verticalAlign: 'top',
                                x: 100,
                                y: 0,
                                floating: true,
                                borderWidth: 1,
                                backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF',
                                labelFormatter: function () {
                                    var Total = 0;
                                    for (var i = 0; i < this.yData.length; i++) {
                                        Total += parseFloat(this.yData[i]);
                                    }
                                    return '<div style="text-align: left; width:130px;float:left;">' + this.name + '</div><div style="width:40px; float:left;text-align:right;"> - ' + Total + '</div>';
                                }
                            },
                            xAxis: {
                                min: 0,
                                max: 10,
                                categories: CATEGORIES,
                            },
                            scrollbar: {
                                enabled: true
                            },
                            credits: {
                                enabled: true,
                                href: "http://www.atharvana.com",
                                text: "Atharvana.com",
                            },
                            yAxis: {
                                allowDecimals: false,
                                title: {
                                    text: 'Total'
                                }
                            },
                            tooltip: {
                                followTouchMove: true, animation: true,
                                formatter: function () {
                                    return '<b>' + this.x + '</b><br/>' + this.series.name + ': ' + this.y + '<br/>' + 'Total: ' + this.point.stackTotal;
                                }
                            },
                            plotOptions: {
                                column: {
                                    stacking: 'normal',
                                    dataLabels: {
                                        enabled: true,
                                        color: 'black',
                                        style: {
                                            textShadow: undefined
                                        }
                                    }
                                }
                            },
                            series: [{
                                name: 'Close',
                                color: 'rgba(158, 102, 171,1)',
                                data: CLOSE,
                                stack: '1'
                            }, {
                                name: 'Pending',
                                color: 'rgba(89, 154, 211,1)',
                                data: OPEN,
                                stack: '1'
                            }]
                        });

                        $('#Bank_and_Branch_Wise_NPA_Recovery_Status_Amount').highcharts({
                            chart: {
                                type: 'column',
                                zoomType: 'x',
                                height: 380,
                            },

                            title: {
                                text: 'Bank & Branch Wise Recovery Details',
                                style: {
                                    fontWeight: 'bold'
                                }
                            },
                            legend: {
                                layout: 'vertical',
                                align: 'left',
                                verticalAlign: 'top',
                                x: 100,
                                y: 0,
                                floating: true,
                                borderWidth: 1,
                                backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF',
                                labelFormatter: function () {
                                    var Total = 0;
                                    for (var i = 0; i < this.yData.length; i++) {
                                        Total += parseFloat(this.yData[i]);
                                    }
                                    return '<div style="text-align: left; width:130px;float:left;">' + this.name + '</div><div style="width:40px; float:left;text-align:right;"> - ' + Total.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, '$1,') + '</div>';
                                }
                            },
                            xAxis: {
                                min: 0,
                                max: 10,
                                categories: CATEGORIES
                            },
                            scrollbar: {
                                enabled: true
                            },
                            credits: {
                                enabled: true,
                                href: "http://www.atharvana.com",
                                text: "Atharvana.com",
                            },
                            yAxis: {
                                allowDecimals: false,
                                min: 0,
                                title: {
                                    text: 'Amount'
                                }
                            },
                            tooltip: {
                                formatter: function () {
                                    return '<b>' + this.x + '</b><br/>' + this.series.name + ': ' + this.y + '.00<br/>' + 'Total: ' + this.point.stackTotal + '.00';
                                }
                            },
                            plotOptions: {
                                column: {
                                    stacking: 'normal',
                                    dataLabels: {
                                        enabled: true,
                                        color: 'black',
                                        style: {
                                            textShadow: undefined
                                        }
                                    }
                                }
                            },
                            series: [{
                                name: 'Amount Recovered',
                                color: 'rgba(158, 102, 171,1)',
                                data: RECOVERY_AMOUNT,
                                stack: '1'
                            }, {
                                name: 'Total Amount',
                                color: 'rgba(89, 154, 211,1)',
                                data: UNRECOVERY_AMOUNT,
                                stack: '2'
                            }]
                        });
                    }
                },
                failure: function () {
                    debugger;
                },
                error: function () {
                    debugger;
                }
            });
        }
        function BANK_AND_BRANCH_WISE_BILLING() {
            var CATEGORIES = [];
            var TOTALCOMMISSION = [];
            var BILL_AMOUNT_RECOVERED = [];
            var obj = {};
            obj.EXID = $("#DROP_DOWN_EXECUTIVE_FOR_REPORT").val() == -1 ? null : $("#DROP_DOWN_EXECUTIVE_FOR_REPORT").val();
            obj.Bank = $("#DROP_DOWN_BANK_FOR_REPORT").val() == -1 ? null : $("#DROP_DOWN_BANK_FOR_REPORT").val();
            obj.CityID = $("#DROP_DOWN_CITY_FOR_REPORT").val() == -1 ? null : $("#DROP_DOWN_CITY_FOR_REPORT").val();
            obj.FDATE = $("#TEXT_BOX_FROMDATE_FOR_REPORT").val();
            obj.TDATE = $("#TEXT_BOX_TODATE_FOR_REPORT").val();
            $.ajax({
                async: false,
                type: "POST",
                url: "DashBoard.aspx/BANK_AND_BRANCH_WISE_BILLING",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify(obj),
                success: function (data) {
                    if (data != null) {
                        if (data.d.length > 0) {
                            for (var i = 0; i < data.d.length; i++) {
                                CATEGORIES.push(data.d[i].BANKNAME);
                                TOTALCOMMISSION.push(data.d[i].TOTALCOMMISSION);
                                BILL_AMOUNT_RECOVERED.push(data.d[i].BILL_AMOUNT_RECOVERED);
                            }
                        }
                        $('#BANK_AND_BRANCH_WISE_BILLING').highcharts({
                            chart: {
                                type: 'column',
                                zoomType: 'x',
                                height: 380,
                            },

                            title: {
                                text: 'Bank & Branch Wise Billing Recovery Details',
                                style: {
                                    fontWeight: 'bold'
                                }
                            },
                            credits: {
                                enabled: true,
                                href: "http://www.atharvana.com",
                                text: "Atharvana.com",
                            },
                            legend: {
                                layout: 'vertical',
                                align: 'left',
                                verticalAlign: 'top',
                                x: 100,
                                y: 0,
                                floating: true,
                                borderWidth: 1,
                                backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF',
                                labelFormatter: function () {
                                    var Total = 0;
                                    for (var i = 0; i < this.yData.length; i++) {
                                        Total += parseFloat(this.yData[i]);
                                    }
                                    return '<div style="text-align: left; width:130px;float:left;">' + this.name + '</div><div style="width:40px; float:left;text-align:right;"> - ' + Total.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, '$1,') + '</div>';
                                }
                            },
                            xAxis: {
                                min: 0,
                                max: 10,
                                categories: CATEGORIES
                            },
                            scrollbar: { enabled: true },
                            yAxis: {
                                allowDecimals: false,
                                min: 0,
                                title: {
                                    text: 'Total'
                                }
                            },
                            tooltip: {
                                followTouchMove: true, animation: true,
                                formatter: function () {
                                    return '<b>' + this.x + '</b><br/>' + this.series.name + ': ' + this.y + '<br/>' + 'Total: ' + this.point.stackTotal;
                                }
                            },
                            plotOptions: {
                                column: {
                                    stacking: 'normal',
                                    dataLabels: {
                                        enabled: true,
                                        color: 'black',
                                        style: {
                                            textShadow: undefined
                                        }
                                    }
                                }
                            },
                            series: [{
                                name: 'Commision Received',
                                color: 'rgba(158, 102, 171,1)',
                                data: BILL_AMOUNT_RECOVERED,
                                stack: '1'
                            },{
                                name: 'Total Commission',
                                color: 'rgba(89, 154, 211,1)',
                                data: TOTALCOMMISSION,
                                stack: '2'
                            }]
                        });
                    }
                },
                failure: function () {
                    debugger;
                },
                error: function () {
                    debugger;
                }
            });
        }
    </script>
    <script>
        function EXECUTIVEDROPDOWN_FOR_REPORT() {
            var obj = {};
            obj.City = $("#DROP_DOWN_CITY_FOR_REPORT").val();
            $.ajax({
                type: "POST",
                url: "DashBoard.aspx/EXECUTIVE_DROPDOEN_GET",
                data: JSON.stringify(obj),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    $("#DROP_DOWN_EXECUTIVE_FOR_REPORT").empty();
                    var xmlDoc = $.parseXML(data.d);
                    var xml = $(xmlDoc);
                    var ExecutiveDropDownT = xml.find("Table");
                    if (ExecutiveDropDownT.length > 0) {
                        $("#DROP_DOWN_EXECUTIVE_FOR_REPORT").append('<option value="-1">-- ALL --</option>');
                        $.each(ExecutiveDropDownT, function () {
                            $("#DROP_DOWN_EXECUTIVE_FOR_REPORT").append('<option value="' + $(this).find("USERID").text() + '">' + $(this).find("LOGIN").text() + '</option>');
                        });
                    }
                    else {
                        $("#DROP_DOWN_EXECUTIVE_FOR_REPORT").append('<option value="-1">-- No Data --</option>');
                    }
                    var config = { '.chosen-select': {} }
                    for (var selector in config) {
                        if (config.hasOwnProperty(selector)) {
                            if (config.hasOwnProperty(selector)) {
                                $(selector).chosen(config[selector]);
                            }
                        }
                    }
                    $("#DROP_DOWN_EXECUTIVE_FOR_REPORT").trigger("chosen:updated");
                }
            });
        }

        function BANKDROPDOWN_FOR_REPORT() {
            var obj = {};
            obj.City = $("#DROP_DOWN_CITY_FOR_REPORT").val();
            $.ajax({
                type: "POST",
                url: "DashBoard.aspx/BANK_DROPDOWN_GET",
                data: JSON.stringify(obj),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    $("#DROP_DOWN_BANK_FOR_REPORT").empty();
                    var xmlDoc = $.parseXML(data.d);
                    var xml = $(xmlDoc);
                    var BankDropDownT = xml.find("Table");
                    if (BankDropDownT.length > 0) {
                        $("#DROP_DOWN_BANK_FOR_REPORT").append('<option value="-1">-- ALL --</option>');
                        $.each(BankDropDownT, function () {
                            $("#DROP_DOWN_BANK_FOR_REPORT").append('<option value="' + $(this).find("ID").text() + '">' + $(this).find("Name").text() + ' - ' + $(this).find("Zone").text() + ' - ' + $(this).find("Branch").text() + ' - ' + $(this).find("CITY_NAME").text() + '</option>');
                        });
                    }
                    else {
                        $("#DROP_DOWN_BANK_FOR_REPORT").append('<option value="-1">-- No Data --</option>');
                    }
                    var config = { '.chosen-select': {} }
                    for (var selector in config) {
                        if (config.hasOwnProperty(selector)) {
                            if (config.hasOwnProperty(selector)) {
                                $(selector).chosen(config[selector]);
                            }
                        }
                    }
                    $("#DROP_DOWN_BANK_FOR_REPORT").trigger("chosen:updated");
                }
            });
        }

        function CITY_FOR_REPORT() {
            $.ajax({
                type: "POST",
                url: "../Default.aspx/CITY_GET",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    window.status = null;
                    var Rows = "";
                    $("#DROP_DOWN_CITY_FOR_REPORT").empty();
                    var xmlDoc = $.parseXML(data.d);
                    var xml = $(xmlDoc);
                    var ExecutiveDropDownT = xml.find("Table");
                    if (ExecutiveDropDownT.length > 0) {
                        $("#DROP_DOWN_CITY_FOR_REPORT").append('<option value="-1">-- ALL --</option>');
                        $.each(ExecutiveDropDownT, function () {
                            if ('<%=Convert.ToInt32(Request.Cookies["UserRole"].Value)%>' != '0' && '<%=Convert.ToInt32(Request.Cookies["CityID"].Value)%>' != "") {
                                if ($(this).find("CityID").text() == ('<%=Convert.ToInt32(Request.Cookies["CityID"].Value)%>').toString()) {
                                    Rows += '<option value="' + $(this).find("CityID").text() + '">' + $(this).find("City_Name").text() + '</option>';
                                }
                            }
                            else {
                                Rows += '<option value="' + $(this).find("CityID").text() + '">' + $(this).find("City_Name").text() + '</option>';
                            }
                        });
                        $("#DROP_DOWN_CITY_FOR_REPORT").append(Rows);
                        if ('<%=Convert.ToInt32(Request.Cookies["UserRole"].Value)%>' != '0' && '<%=Convert.ToInt32(Request.Cookies["CityID"].Value)%>' != "") {
                            $("#DROP_DOWN_CITY_FOR_REPORT option:contains(" + $(this).find("CityID").text() + ")").attr('selected', 'selected');
                            $("#DROP_DOWN_CITY_FOR_REPORT").prop('disabled', true);
                        }
                    }
                    else {
                        $("#DROP_DOWN_CITY_FOR_REPORT").append('<option value="-1">-- No Data --</option>');
                    }
                }
            });
        }
    </script>
</asp:Content>
