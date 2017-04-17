<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ExecutiveReport.aspx.cs" Inherits="Reports_ExecutiveReport" MasterPageFile="~/MasterPage/CRMaster.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CRMasterHead" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CRMasterBody" runat="server">
    <div class="page-header">
        <h3>Executive Report <span class="badge" id="NPACount"></span></h3>
    </div>
    <div class="panel-body PagePanelBody">
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
                        <select class="form-control form-control col-xs-4 col-md-4 col-lg-2 input-sm" name="DROP_DOWN_BANK_FOR_REPORT" id="DROP_DOWN_BANK_FOR_REPORT" style="width: 100%"></select>
                    </div>
                </div>

                <div class="form-group form-group-sm" style="margin-bottom: 0">
                    <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; padding-top: 5px; text-align: right">Branch </label>
                    <div class="col-lg-6" style="padding-bottom: 1%">
                        <select class="form-control form-control col-xs-4 col-md-4 col-lg-2 input-sm " name="DROP_DOWN_BRANCH_FOR_REPORT" id="DROP_DOWN_BRANCH_FOR_REPORT" style="width: 100%"></select>
                    </div>
                </div>

                <div class="form-group form-group-sm" style="margin-bottom: 0">
                    <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; padding-top: 5px; text-align: right">NPA </label>
                    <div class="col-lg-6" style="padding-bottom: 1%">
                        <select class="chosen-select form-control form-control col-xs-4 col-md-4 col-lg-2 input-sm" name="DROP_DOWN_NPA_FOR_REPORT" id="DROP_DOWN_NPA_FOR_REPORT" style="width: 100%;"></select>
                    </div>
                </div>

                <div class="input-group input-group-sm col-lg-12 col-md-12" style="padding: 0; padding-top: 10px">
                    <select class="form-control" id="Report" style="z-index: 0">
                        <option selected="selected" value="1">XLS</option>
                        <option value="2">XLSX</option>
                        <option value="3">PDF</option>
                    </select>
                    <span class="input-group-btn">
                        <input type="button" id="ExportMethod" class="btn btn-default" value="Export" />
                    </span>
                </div>

            </div>
        </div>
        <%--REPORT COLLAPSE PANEL START--%>
        <table class="table footable">
            <thead>
                <tr>
                    <th style="-moz-min-width: 121px; -ms-min-width: 121px; -o-min-width: 121px; -webkit-min-width: 121px; min-width: 121px" data-breakpoints="xs">Executive Name</th>
                    <th data-hide="phone" style="-moz-min-width: 133px; -ms-min-width: 133px; -o-min-width: 133px; -webkit-min-width: 133px; min-width: 133px">Bank And Branch</th>
                    <th style="-moz-min-width: 121px; -ms-min-width: 121px; -o-min-width: 121px; -webkit-min-width: 121px; min-width: 121px" data-breakpoints="xs">Borrower Name</th>
                    <th style="-moz-min-width: 121px; -ms-min-width: 121px; -o-min-width: 121px; -webkit-min-width: 121px; min-width: 121px" data-hide="phone, tablet">Loan Amount</th>
                    <th style="-moz-min-width: 121px; -ms-min-width: 121px; -o-min-width: 121px; -webkit-min-width: 121px; min-width: 121px" data-hide="phone, tablet">Total Recovered NPA Amount</th>
                    <th data-hide="phone" style="-moz-min-width: 81px; -ms-min-width: 81px; -o-min-width: 81px; -webkit-min-width: 81px; min-width: 81px">Recovered Amount</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td colspan="7">No data to display</td>
                </tr>
            </tbody>
        </table>
    </div>
    <script src="../APPRequires/JavaScript/footable.js"></script>
    <link href="../APPRequires/CascadingStyleSheet/footable.bootstrap.css" rel="stylesheet" />
    <link href="../APPRequires/FooTable/css/footable.core.css" rel="stylesheet" />
    <link href="../APPRequires/FooTable/css/footable.metro.css" rel="stylesheet" />
    <script src="~/APPRequires/JavaScript/moment.js"></script>
    
    <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.3/css/bootstrapValidator.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.3/js/bootstrapValidator.js" type="text/javascript"></script>
    <link href="../APPRequires/CascadingStyleSheet/chosen.css" rel="stylesheet" />
    <script src="../APPRequires/JavaScript/chosen.jquery.js"></script>
    <script>
        function UploadedDocUrl(EditID) {
            window.rownumb = EditID;
            if (EditID != "")
                window.location = "ExecutiveReport.aspx?docurl=" + window.rownumb;
            else
                return "";
            return "";
        }

        jQuery(function () {
            if ('<%= Request.QueryString.AllKeys.Contains("Error")%>' == "True") {
                alert(<%=Request.QueryString["Error"]%>);
                window.location = "ExecutiveReport.aspx";
            }
            EXECUTIVE_REPORT_GET();
            $("#DROP_DOWN_EXECUTIVE_FOR_REPORT, #DROP_DOWN_BANK_FOR_REPORT, #DROP_DOWN_BRANCH_FOR_REPORT, #DROP_DOWN_NPA_FOR_REPORT").change(function () {
                EXECUTIVE_REPORT_GET();
            });
            $("#DROP_DOWN_EXECUTIVE_FOR_REPORT, #DROP_DOWN_BANK_FOR_REPORT, #DROP_DOWN_BRANCH_FOR_REPORT").change(function () {
                NPADROPDOWN_FOR_REPORT();
            });
            $("#ReportCollasseButton").click(function () {
                if (!$("#ReportCollassePanel").hasClass('in')) {
                    EXECUTIVEDROPDOWN_FOR_REPORT();
                    BANKDROPDOWN_FOR_REPORT();
                    NPADROPDOWN_FOR_REPORT();
                }
            });

            $('#ExportMethod').click(function () {
                var EXID = $("#DROP_DOWN_EXECUTIVE_FOR_REPORT").val();
                var BankID = $("#DROP_DOWN_BANK_FOR_REPORT").val();
                var Branch = $("#DROP_DOWN_BRANCH_FOR_REPORT").val();
                var NPAID = $("#DROP_DOWN_NPA_FOR_REPORT").val();
                var URL = window.location + '?ReportType=' + $("#Report").val() + '&EXID=' + EXID + '&Bank=' + BankID + '&Branch=' + Branch + '&NPAID=' + NPAID ;
                window.location = URL;
            });
            $('#AddNPADetailsModal').on('hidden.bs.modal', function () {
                $("#GuarantyPHNumber").val('');
                $("#Active").prop('checked', true);
                $('select').val(-1);
                $('textarea').val("");
                $("#NPADetailsForm").bootstrapValidator('resetForm', true);
                $("#Report").val(1);
            });
            $("#DROP_DOWN_BANK_FOR_REPORT").change(function () {
                DROP_DOWN_BRANCH_FOR_REPORT();
            });

        });
        function EXECUTIVE_REPORT_GET() {
            var DataCollection = {}
            DataCollection.EXID = $("#DROP_DOWN_EXECUTIVE_FOR_REPORT").val();
            DataCollection.Bank = $("#DROP_DOWN_BANK_FOR_REPORT").val();
            DataCollection.Branch = $("#DROP_DOWN_BRANCH_FOR_REPORT").val();
            DataCollection.NPAID = $("#DROP_DOWN_NPA_FOR_REPORT").val();
            $.ajax({
                type: "POST",
                url: "ExecutiveReport.aspx/EXECUTIVE_REPORT_GET",
                data: JSON.stringify(DataCollection),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    $("#NPACount").empty().text($.parseJSON(data.d).length);
                    var columns = [
                        { "name": "EXECUTIVE NAME", "title": "Executive Name", "breakpoints": "xs", "type": "text" },
                        { "name": "BANK AND BRANCH", "title": "Bank And Branch" },
                        { "name": "BORROWER NAME", "title": "Borrower Name", "breakpoints": "xs" },
                        { "name": "ACCOUNT NUMBER", "title": "Account Number", "style": { "min-width": "106px" } },
                        { "name": "LOAN AMOUNT", "title": "Loan Amount", "breakpoints": "xs sm" },
                        { "name": "TOTAL RECOVERED NPA AMOUNT", "title": "Total Recovered NPA Amount", "breakpoints": "xs sm md" },
                        { "name": "RECOVERED AMOUNT", "title": "Executive Recovered Amount", "breakpoints": "xs sm" }
                    ];
                    if ($.parseJSON(data.d).length > 0) {
                        $('.table').empty();
                        $('.table').footable({
                            "useParentWidth": true,
                            "paging": {
                                "enabled": true,
                                "size": 50,
                                "limit": 1,
                                "countFormat": "{PF} - {PL} out of {TR}"
                            },
                            "filtering": {
                                "enabled": true,
                                "min": 3,
                                "placeholder": "Search here"
                            },
                            "sorting": {
                                "enabled": true
                            },
                            "columns": columns,
                            "rows": $.parseJSON(data.d)
                        });
                    } else {
                        $('.table').empty();
                    }
                }
            });
        }

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
                    } else {
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
                    } else {
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
                    } else {
                        $("#DROP_DOWN_BRANCH_FOR_REPORT").append('<option value="-1">-- ALL --</option>');
                    }
                }
            });
        }

        function NPADROPDOWN_FOR_REPORT() {
            var DataCollection = {};
            DataCollection.BANK = $("#DROP_DOWN_BANK_FOR_REPORT").val();
            DataCollection.BRANCH = $("#DROP_DOWN_BRANCH_FOR_REPORT").val();
            DataCollection.EXID = $("#DROP_DOWN_EXECUTIVE_FOR_REPORT").val();
            $.ajax({
                type: "POST",
                url: "ExecutiveReport.aspx/EXECUTIVE_REPORT_GET_BY_BANKID",
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
                    var config = { '.chosen-select': {} }
                    for (var selector in config) {
                        if (config.hasOwnProperty(selector)) {
                            if (config.hasOwnProperty(selector)) {
                                $(selector).chosen(config[selector]);
                            }
                        }
                    }
                    $("#DROP_DOWN_NPA_FOR_REPORT").trigger("chosen:updated");
                }
            });
        }
    </script>
</asp:Content>
