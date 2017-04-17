<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DailyReport.aspx.cs" Inherits="Reports.Reports_DailyReport" MasterPageFile="~/MasterPage/CRMaster.master" %>

<asp:Content ContentPlaceHolderID="CRMasterHead" runat="server"></asp:Content>
<asp:Content ContentPlaceHolderID="CRMasterBody" runat="server">
<script src="../APPRequires/FooTable/js/footable.js"></script>
<script src="../APPRequires/FooTable/js/footable.filter.js"></script>
<script src="../APPRequires/FooTable/js/footable.sort.js"></script>
<script src="../APPRequires/FooTable/js/footable.paginate.js"></script>
<link href="../APPRequires/FooTable/css/footable.core.css" rel="stylesheet" />
<link href="../APPRequires/FooTable/css/footable.metro.css" rel="stylesheet" />
    <div class="page-header">
        <h3>Daily Report </h3>
    </div>
    <div class="panel-body PagePanelBody">
        <input type="text" class="form-control SEARCH_BOX" placeholder="Search Here" id="Create_Customer_Search" style="margin-bottom: 3px">
        <%--REPORT COLLAPSE PANEL START--%>
        <a class="btn btn-warning pull-right" role="button" id="ReportCollasseButton" data-toggle="collapse" href="#ReportCollassePanel" aria-expanded="false" aria-controls="ReportCollassePanel" title="Filters/Export/Reports" style="height: 16px; -ms-border-radius: 0; border-radius: 0; -ms-border-bottom-left-radius: 4px; border-bottom-left-radius: 4px; -ms-border-bottom-right-radius: 4px; border-bottom-right-radius: 4px; padding-top: 0; padding-bottom: 0; margin-bottom: 2px; color: white"><span class="glyphicon glyphicon-chevron-down"></span></a>
        <div class="collapse" id="ReportCollassePanel">
            <div class="panel-body" style="border: 1px solid #ebebeb">
                <div class="form-group form-group-sm" style="margin-bottom: 0">
                    <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; padding-top: 5px; text-align: right">Eexecutive </label>
                    <div class="col-lg-6" style="padding-bottom: 1%">
                        <select class="form-control form-control col-xs-4 col-md-4 col-lg-2 input-sm " name="DROP_DOWN_EXECUTIVE_FOR_REPORT" id="DROP_DOWN_EXECUTIVE_FOR_REPORT" style="width: 100%"></select>
                    </div>
                </div>

                <div class="form-group form-group-sm" style="margin-bottom: 0">
                    <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; padding-top: 5px; text-align: right">Bank </label>
                    <div class="col-lg-6" style="padding-bottom: 1%">
                        <select class="form-control form-control col-xs-4 col-md-4 col-lg-2 input-sm " name="DROP_DOWN_BANK_FOR_REPORT" id="DROP_DOWN_BANK_FOR_REPORT" style="width: 100%"></select>
                    </div>
                </div>

                <div class="form-group form-group-sm" style="margin-bottom: 0">

                    <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; padding-top: 5px; text-align: right">Branch </label>
                    <div class="col-lg-6" style="padding-bottom: 1%">
                        <select class="form-control form-control col-xs-4 col-md-4 col-lg-2 input-sm " name="DROP_DOWN_BRANCH_FOR_REPORT" id="DROP_DOWN_BRANCH_FOR_REPORT" style="width: 100%"></select>
                    </div>
                </div>

                <div class="form-group form-group-sm" style="margin-bottom: 0">
                    <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; padding-top: 5px; text-align: right">City </label>
                    <div class="col-lg-6" style="padding-bottom: 1%">
                        <select class="form-control form-control col-xs-4 col-md-4 col-lg-2 input-sm " name="DROP_DOWN_CITY_FOR_REPORT" id="DROP_DOWN_CITY_FOR_REPORT" style="width: 100%"></select>
                    </div>
                </div>
                <%--<div class="form-group form-group-sm" style="margin-bottom: 0px">
                            <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; padding-top: 5px; text-align: right">NPA </label>
                            <div class="col-lg-6" style="padding-bottom: 1%">
                                <select class="form-control form-control col-xs-4 col-md-4 col-lg-2 input-sm " name="DROP_DOWN_NPA_FOR_REPORT" id="DROP_DOWN_NPA_FOR_REPORT" style="width: 100%"></select>
                            </div>
                        </div>--%>

                <div class="form-group form-group-sm" style="margin-bottom: 0">
                    <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right">Date((<%=DateFormatForDatePicker.ToUpper()%>))</label>
                    <div class="col-lg-6" style="padding-bottom: 1%">
                        <input type="tel" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2" name="TEXT_BOX_FROMDATE_FOR_REPORT" id="TEXT_BOX_FROMDATE_FOR_REPORT" style="width: 100%" readonly="readonly"/>
                    </div>
                </div>
                
                <div class="form-group form-group-sm" style="margin-bottom: 0">
                    <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; padding-top: 5px; text-align: right">Status </label>
                    <div class="col-lg-6" style="padding-bottom: 1%">
                        <select class="form-control form-control col-xs-4 col-md-4 col-lg-2 input-sm " name="DROP_DOWN_STATUS_FOR_REPORT" id="DROP_DOWN_STATUS_FOR_REPORT" style="width: 100%">
                            <option value="-1">-- All --</option>
                            <option value="1">CLOSE</option>
                            <option value="0" selected="selected">PENDING</option>
                        </select>
                    </div>
                </div>

                <%--   <div class="form-group form-group-sm" style="margin-bottom: 0px">
            <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right">To Date(dd/mm/yyYY)</label>
            <div class="col-lg-6" style="padding-bottom: 1%">
                <input type="tel" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2" name="TEXT_BOX_TODATE_FOR_REPORT" id="TEXT_BOX_TODATE_FOR_REPORT" style="width: 100%" />
            </div>
        </div>--%>

                <div class="input-group input-group-sm col-lg-12 col-md-12" style="padding: 0; padding-top: 10px">
                    <select class="form-control" id="Report" style="z-index: 0">
                        <option selected="selected" value="1">XLS</option>
                        <option value="2">XLSX</option>
                        <option value="3">PDF</option>
                    </select>
                    <span class="input-group-btn">
                        <input type="button" id="ExportMethod" class="btn btn-default" value="Export" onclick="ExportMethod();" />
                    </span>
                </div>
            </div>
        </div>
        <%--REPORT COLLAPSE PANEL END--%>
        <table class="footable table  toggle-arrow-circle-filled" id="CreateCustomerTable" data-filter="#Create_Customer_Search" data-page-size="50" data-limit-navigation="1">
            <thead>
                <tr>
                    <th style="-moz-min-width: 210px; -ms-min-width: 210px; -o-min-width: 210px; -webkit-min-width: 210px; min-width: 210px; vertical-align: middle; font-weight: normal" rowspan="2">Name of The Executive</th>
                    <th style="-moz-min-width: 80px; -ms-min-width: 80px; -o-min-width: 80px; -webkit-min-width: 80px; min-width: 80px; vertical-align: middle; font-weight: normal" data-hide="phone, tablet" rowspan="2">Target</th>
                    <th data-hide="phone" style="-moz-min-width: 173px; -ms-min-width: 173px; -o-min-width: 173px; -webkit-min-width: 173px; min-width: 173px; vertical-align: middle; font-weight: normal" rowspan="2">No. of A/C's Alloted</th>
                    <th data-hide="phone" style="-moz-min-width: 180px; -ms-min-width: 180px; -o-min-width: 180px; -webkit-min-width: 180px; min-width: 180px; vertical-align: middle; font-weight: normal" rowspan="2">No. Of New Account</th>
                    <th data-hide="phone" style="-moz-min-width: 130px; -ms-min-width: 130px; -o-min-width: 130px; -webkit-min-width: 130px; min-width: 130px; vertical-align: middle; font-weight: normal" rowspan="2">No. of A/C's Attempted Today</th>
                    <th data-hide="phone" style="-moz-min-width: 135px; -ms-min-width: 135px; -o-min-width: 135px; -webkit-min-width: 135px; min-width: 135px; vertical-align: middle; font-weight: normal" rowspan="2">No. of A/C's Attempted Till Date</th>
                    <th style="-moz-min-width: 146px; -ms-min-width: 146px; -o-min-width: 146px; -webkit-min-width: 146px; min-width: 146px; text-align: center; font-weight: normal" colspan="2">Amount Recovered</th>
                    <th style="-moz-min-width: 152px; -ms-min-width: 152px; -o-min-width: 152px; -webkit-min-width: 152px; min-width: 152px; vertical-align: middle; font-weight: normal" rowspan="2">Bank</th>
                    <th style="-moz-min-width: 152px; -ms-min-width: 152px; -o-min-width: 152px; -webkit-min-width: 152px; min-width: 152px; vertical-align: middle; font-weight: normal" rowspan="2">Branch</th>
                    <th style="-moz-min-width: 120px; -ms-min-width: 120px; -o-min-width: 120px; -webkit-min-width: 120px; min-width: 120px; vertical-align: middle; font-weight: normal" rowspan="2">Account no.</th>
                    <th style="-moz-min-width: 150px; -ms-min-width: 150px; -o-min-width: 150px; -webkit-min-width: 150px; min-width: 150px; vertical-align: middle; font-weight: normal" rowspan="2">Customer name</th>
                    <th style="-moz-min-width: 81px; -ms-min-width: 81px; -o-min-width: 81px; -webkit-min-width: 81px; min-width: 81px; vertical-align: middle; font-weight: normal" rowspan="2">Age of NPA(DAYS)</th>
                    <th style="-moz-min-width: 81px; -ms-min-width: 81px; -o-min-width: 81px; -webkit-min-width: 81px; min-width: 81px; vertical-align: middle; font-weight: normal" rowspan="2">Bill No.</th>
                    <th style="-moz-min-width: 120px; -ms-min-width: 120px; -o-min-width: 120px; -webkit-min-width: 120px; min-width: 120px; vertical-align: middle; font-weight: normal" rowspan="2">Bill Claimed</th>
                    <th style="-moz-min-width: 125px; -ms-min-width: 125px; -o-min-width: 125px; -webkit-min-width: 125px; min-width: 125px; vertical-align: middle; font-weight: normal" rowspan="2">Bill Collected</th>
                    <th style="-moz-min-width: 81px; -ms-min-width: 81px; -o-min-width: 81px; -webkit-min-width: 81px; min-width: 81px; vertical-align: middle; font-weight: normal" rowspan="2">Performance Percentage</th>
                    <th style="-moz-min-width: 125px; -ms-min-width: 125px; -o-min-width: 125px; -webkit-min-width: 125px; min-width: 125px; vertical-align: middle; font-weight: normal" rowspan="2">A/C Status</th>
                </tr>
                <tr>
                    <th style="-moz-min-width: 111px; -ms-min-width: 111px; -o-min-width: 111px; -webkit-min-width: 111px; min-width: 111px; text-align:center;font-weight:normal">Today</th>
                    <th style="-moz-min-width: 138px; -ms-min-width: 138px; -o-min-width: 138px; -webkit-min-width: 138px; min-width: 138px; text-align:center;font-weight:normal">Tillday</th>
                </tr>
            </thead>
            <tbody id="DailyReportData"></tbody>

            <tfoot class="hide-if-no-paging" id="TableFoot"></tfoot>
        </table>
    </div>
    <script>
        jQuery(document).ready(function () {
            $('#TableFoot').append(TableFoot(18));
            $('.footable').footable();
            EXECUTIVEDROPDOWN_FOR_REPORT();
            BANKDROPDOWN_FOR_REPORT();
            DROP_DOWN_BRANCH_FOR_REPORT();
            CITY_FOR_REPORT();
            $("#TEXT_BOX_FROMDATE_FOR_REPORT").datepicker({
                
                changeMonth: true,
                changeYear: true,
                maxDate: new Date()
            }).datepicker("setDate", new Date());
            //NPADROPDOWN_FOR_REPORT();
            $("#DROP_DOWN_STATUS_FOR_REPORT, #DROP_DOWN_EXECUTIVE_FOR_REPORT, #DROP_DOWN_BANK_FOR_REPORT, #DROP_DOWN_BRANCH_FOR_REPORT, #DROP_DOWN_CITY_FOR_REPORT, #TEXT_BOX_FROMDATE_FOR_REPORT").change(function () { GET_DAILY_REPORT_RELATED_DATA(); });
        });
        function GET_DAILY_REPORT_RELATED_DATA() {
            var DataCollection = {};
            DataCollection.EXID = $("#DROP_DOWN_EXECUTIVE_FOR_REPORT").val();
            DataCollection.BankID = $("#DROP_DOWN_BANK_FOR_REPORT").val();
            DataCollection.Branch = $("#DROP_DOWN_BRANCH_FOR_REPORT").val();
            DataCollection.CityID = $("#DROP_DOWN_CITY_FOR_REPORT").val();
            DataCollection.DATE = $("#TEXT_BOX_FROMDATE_FOR_REPORT").val();
            DataCollection.STATUS = $("#DROP_DOWN_STATUS_FOR_REPORT").val();
            $.ajax({
                type: "POST",
                url: "DailyReport.aspx/GET_DAILY_REPORT_RELATED_DATA",
                data: JSON.stringify(DataCollection),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var Rows = "";
                    $("#DailyReportData").empty();
                    if (data.d.length > 0) {
                            $('#ReportCollasseButton').show();
                            for (var i in data.d) {
                            if (data.d.hasOwnProperty(i)) {
                                Rows += '<tr>' +
                                    '<td style=" font-weight:normal">' + data.d[i].NAMEOFTHEEXECUTIVE + '</td>' +
                                    '<td style=" font-weight:normal">' + data.d[i].TARGET + '</td>' +
                                    '<td style=" font-weight:normal">' + data.d[i].NOOFACSALLOTED + '</td>' +
                                    '<td style=" font-weight:normal">' + data.d[i].NOOFNEWALLOTED + '</td>' +
                                    '<td style=" font-weight:normal">' + data.d[i].NOOFACSATTEMPTEDTODAY + '</td>' +
                                    '<td style=" font-weight:normal">' + data.d[i].NOOFACSATTEMPTEDTILLDATE + '</td>' +
                                    '<td style=" font-weight:normal">' + data.d[i].TODAY + '</td>' +
                                    '<td style=" font-weight:normal">' + data.d[i].TILLDATE + '</td>' +
                                    '<td style=" font-weight:normal">' + data.d[i].BANK + '</td>' +
                                    '<td style=" font-weight:normal">' + data.d[i].BRANCH + '</td>' +
                                    '<td style=" font-weight:normal">' + data.d[i].ACCOUNTNO + '</td>' +
                                    '<td style=" font-weight:normal">' + data.d[i].CUSTOMERNAME + '</td>' +
                                    '<td style=" font-weight:normal">' + data.d[i].AGEOFNPA + '</td>' +
                                    '<td style=" font-weight:normal">' + data.d[i].BILLNO + '</td>' +
                                    '<td style=" font-weight:normal">' + data.d[i].BILLCLAIMED + '</td>' +
                                    '<td style=" font-weight:normal">' + data.d[i].BILLCOLLECTED + '</td>' +
                                    '<td style=" font-weight:normal">' + data.d[i].PERFORMANCEPERCENTAGE + '</td>' +
                                    '<td style=" font-weight:normal">' + data.d[i].STATUS + '</td>' +
                                    '</tr>';
                            }
                        };
                            $("#DailyReportData").append(Rows);
                            $("#ReportCollassePanel").addClass("in");
                    }
                    else {
                        $("#DailyReportData").append('<tr><td colspan="18" style="text-align:center"> No Data To Display</td></tr>');
                        $("#ReportCollassePanel").addClass("in");
                    }
                    $('.footable').trigger('footable_initialize');
                }
            });
        }
        function ExportMethod() {
            var EXECUTIVE = $("#DROP_DOWN_EXECUTIVE_FOR_REPORT").val();
            var BANK = $("#DROP_DOWN_BANK_FOR_REPORT").val();
            var BRANCH = $("#DROP_DOWN_BRANCH_FOR_REPORT").val();
            var CityID = $("#DROP_DOWN_CITY_FOR_REPORT").val();
            var FDATE = $("#TEXT_BOX_FROMDATE_FOR_REPORT").val();
            var STATUS = $("#DROP_DOWN_STATUS_FOR_REPORT").val();
            var URL = window.location + '?ReportType=' + $("#Report").val() + '&EXECUTIVE=' + EXECUTIVE + '&BANK=' + BANK + '&BRANCH=' + BRANCH + '&CityID=' + CityID + '&FDATE=' + FDATE + '&STATUS=' + STATUS;
            window.location = URL;
        };
        function EXECUTIVEDROPDOWN_FOR_REPORT() {
            $.ajax({
                type: "POST",
                url: "../DailyTransactions/BankVisitDetails.aspx/EXECUTIVE_DROPDOEN_GET",
                data: {},
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
                        NPADROPDOWN_FOR_REPORT();
                    }
                    else {
                        $("#DROP_DOWN_EXECUTIVE_FOR_REPORT").append('<option value="-1">-- No Data --</option>');
                    }
                }
            });
        }
        function BANKDROPDOWN_FOR_REPORT() {
            $.ajax({
                type: "POST",
                url: "../DailyTransactions/NPADetails.aspx/BANK_DROPDOWN_FOR_REPORT",
                data: {},
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
                            $("#DROP_DOWN_BANK_FOR_REPORT").append('<option value="' + $(this).find("NAME").text() + '">' + $(this).find("NAME").text() + '</option>');
                        });
                        DROP_DOWN_BRANCH_FOR_REPORT();
                    }
                    else {
                        $("#DROP_DOWN_BANK_FOR_REPORT").append('<option value="-1">-- No Data --</option>');
                        DROP_DOWN_BRANCH_FOR_REPORT();
                    }
                }
            });
        }
        function DROP_DOWN_BRANCH_FOR_REPORT() {
            $.ajax({
                type: "POST",
                url: "../DailyTransactions/NPADetails.aspx/DROP_DOWN_BRANCH_FOR_REPORT",
                data: "{'BANK':'" + $("#DROP_DOWN_BANK_FOR_REPORT").val() + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    $("#DROP_DOWN_BRANCH_FOR_REPORT").empty();
                    var xmlDoc = $.parseXML(data.d);
                    var xml = $(xmlDoc);
                    var BankDropDownT = xml.find("Table");
                    if (BankDropDownT.length > 0) {
                        $("#DROP_DOWN_BRANCH_FOR_REPORT").append('<option value="-1">-- ALL --</option>');
                        $.each(BankDropDownT, function () {
                            $("#DROP_DOWN_BRANCH_FOR_REPORT").append('<option value="' + $(this).find("BRANCH").text() + '">' + $(this).find("BRANCH").text() + '</option>');
                        });
                        NPADROPDOWN_FOR_REPORT();
                    }
                    else {
                        $("#DROP_DOWN_BRANCH_FOR_REPORT").append('<option value="-1">-- No Data --</option>');
                        NPADROPDOWN_FOR_REPORT();
                    }
                }
            });
        }
        function NPADROPDOWN_FOR_REPORT() {
            var DataCollection = {};
            DataCollection.BANK = $("#DROP_DOWN_BANK_FOR_REPORT").val();
            DataCollection.BRANCH = $("#DROP_DOWN_BRANCH_FOR_REPORT").val();
            $.ajax({
                type: "POST",
                url: "../DailyTransactions/RecoveryStatement.aspx/NPADETAILS_BY_BANK_BRANCH",
                data: JSON.stringify(DataCollection),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    $("#DROP_DOWN_NPA_FOR_REPORT").empty();
                    var xmlDoc = $.parseXML(data.d);
                    var xml = $(xmlDoc);
                    var BankDropDownT = xml.find("Table");
                    if (BankDropDownT.length > 0) {
                        $("#DROP_DOWN_NPA_FOR_REPORT").append('<option value="-1">-- ALL --</option>');
                        $.each(BankDropDownT, function () {
                            $("#DROP_DOWN_NPA_FOR_REPORT").append('<option value="' + $(this).find("ID").text() + '">' + $(this).find("LoanAccountNo").text() + '</option>');
                        });
                    }
                    else {
                        $("#DROP_DOWN_NPA_FOR_REPORT").append('<option value="-1">-- No Data --</option>');
                    }
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
                        GET_DAILY_REPORT_RELATED_DATA();
                    }
                    else {
                        $("#DROP_DOWN_CITY_FOR_REPORT").append('<option value="-1">-- No Data --</option>');
                    }
                }
            });
        }
    </script>
    <style>
        th {
            height:30px !important;
        }
    </style>
</asp:Content>
