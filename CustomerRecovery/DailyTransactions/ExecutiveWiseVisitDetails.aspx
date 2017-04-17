<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ExecutiveWiseVisitDetails.aspx.cs" Inherits="DailyTransactions_ExecutiveWiseVisitDetails" MasterPageFile="~/MasterPage/CRMaster.master" Title="Records of visit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CRMasterHead" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CRMasterBody" runat="server">
    <script src="../APPRequires/FooTable/js/footable.js"></script>
    <script src="../APPRequires/FooTable/js/footable.filter.js"></script>
    <script src="../APPRequires/FooTable/js/footable.sort.js"></script>
    <script src="../APPRequires/FooTable/js/footable.paginate.js"></script>
    <link href="../APPRequires/FooTable/css/footable.core.css" rel="stylesheet" />
    <link href="../APPRequires/FooTable/css/footable.metro.css" rel="stylesheet" />
    <div class="page-header">
        <h3>Records Of Visit <span class="badge" id="VisitCount"></span></h3>
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
                        <select class="chosen-select form-control form-control col-xs-4 col-md-4 col-lg-2 input-sm " name="DROP_DOWN_EXECUTIVE_FOR_REPORT" id="DROP_DOWN_EXECUTIVE_FOR_REPORT" style="width: 100%"></select>
                    </div>
                </div>

                <div class="form-group form-group-sm" style="margin-bottom: 0">
                    <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; padding-top: 5px; text-align: right">Bank </label>
                    <div class="col-lg-6" style="padding-bottom: 1%">
                        <select class="chosen-select form-control form-control col-xs-4 col-md-4 col-lg-2 input-sm " name="DROP_DOWN_BANK_FOR_REPORT" id="DROP_DOWN_BANK_FOR_REPORT" style="width: 100%"></select>
                    </div>
                </div>

                <div class="form-group form-group-sm" style="margin-bottom: 0">
                    <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; padding-top: 5px; text-align: right">Branch </label>
                    <div class="col-lg-6" style="padding-bottom: 1%">
                        <select class="chosen-select form-control form-control col-xs-4 col-md-4 col-lg-2 input-sm " name="DROP_DOWN_BRANCH_FOR_REPORT" id="DROP_DOWN_BRANCH_FOR_REPORT" style="width: 100%"></select>
                    </div>
                </div>

                <div class="form-group form-group-sm" style="margin-bottom: 0">
                    <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; padding-top: 5px; text-align: right">City </label>
                    <div class="col-lg-6" style="padding-bottom: 1%">
                        <select class="chosen-select form-control form-control col-xs-4 col-md-4 col-lg-2 input-sm " name="DROP_DOWN_CITY_FOR_REPORT" id="DROP_DOWN_CITY_FOR_REPORT" style="width: 100%"></select>
                    </div>
                </div>

                <div class="form-group form-group-sm" style="margin-bottom: 0">
                    <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right">From Date(<%=DateFormatForDatePicker.ToUpper()%>)</label>
                    <div class="col-lg-6" style="padding-bottom: 1%">
                        <input type="tel" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2" name="TEXT_BOX_FROMDATE_FOR_REPORT" id="TEXT_BOX_FROMDATE_FOR_REPORT" style="width: 100%" />
                    </div>
                </div>

                <div class="form-group form-group-sm" style="margin-bottom: 0">
                    <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right">To Date(<%=DateFormatForDatePicker.ToUpper()%>)</label>
                    <div class="col-lg-6" style="padding-bottom: 1%">
                        <input type="tel" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2" name="TEXT_BOX_TODATE_FOR_REPORT" id="TEXT_BOX_TODATE_FOR_REPORT" style="width: 100%" />
                    </div>
                </div>

                <div class="input-group input-group-sm col-lg-12 col-md-12" style="padding: 0">
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
        <table class="footable table  toggle-arrow-circle-filled" id="CreateCustomerTable" data-filter="#Create_Customer_Search" data-page-size="10" data-limit-navigation="1">
            <thead>
                <tr>
                    <th data-sort-ignore="true" style="text-align: center; color: white; display: table-cell; vertical-align: middle; -moz-min-width: 72px; -ms-min-width: 72px; -o-min-width: 72px; -webkit-min-width: 72px; min-width: 72px">
                        <input type="button" class="button circle" style="height: 30px;" value="+" onclick="NewRecord();" title="Add New Record" /></th>
                    <th style="-moz-min-width: 120px; -ms-min-width: 120px; -o-min-width: 120px; -webkit-min-width: 120px; min-width: 120px">Executive</th>
                    <th style="-moz-min-width: 121px; -ms-min-width: 121px; -o-min-width: 121px; -webkit-min-width: 121px; min-width: 121px">NPA Details</th>
                    <th data-hide="phone" style="-moz-min-width: 133px; -ms-min-width: 133px; -o-min-width: 133px; -webkit-min-width: 133px; min-width: 133px">Date(MM/DD/YYYY)</th>
                    <th data-hide="phone, tablet" style="-moz-min-width: 94px; -ms-min-width: 94px; -o-min-width: 94px; -webkit-min-width: 94px; min-width: 94px">Loan Amount</th>
                    <th data-hide="phone, tablet" style="-moz-min-width: 94px; -ms-min-width: 94px; -o-min-width: 94px; -webkit-min-width: 94px; min-width: 94px">Bank Range type</th>
                    <%--<th data-hide="phone, tablet" style="min-width: 94px">Place Visited</th>--%>
                    <th data-hide="phone, tablet" style="-moz-min-width: 94px; -ms-min-width: 94px; -o-min-width: 94px; -webkit-min-width: 94px; min-width: 94px">Amount Recovered</th>
                    <%--<th data-hide="phone, tablet" style="min-width: 94px">Balance Amount</th>--%>
                    <th data-hide="all" style="-moz-min-width: 94px; -ms-min-width: 94px; -o-min-width: 94px; -webkit-min-width: 94px; min-width: 94px">Followup Action</th>
                    <th data-hide="phone, tablet" style="-moz-min-width: 94px; -ms-min-width: 94px; -o-min-width: 94px; -webkit-min-width: 94px; min-width: 94px">Next Date For Visit</th>
                    <%--<th data-hide="phone" style="min-width: 81px">Status</th>--%>
                </tr>
            </thead>
            <tbody id="ExecutiveWiseVisitDetailsData"></tbody>

            <tfoot class="hide-if-no-paging" id="TableFoot"></tfoot>
        </table>
        <form id="ExecutiveWiseVisitDetailsForm" class="form-horizontal" method="post">

            <div id="AddExecutiveWiseVisitDetailsModal" class="modal fade bs-example-modal-sm" tabindex="-1" style="top: 15%; overflow: hidden; overflow-y: scroll">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content" style="-ms-border-top-left-radius: 10px; border-top-left-radius: 10px; -ms-border-top-right-radius: 10px; border-top-right-radius: 10px">
                        <div class="modal-header" style="padding: 10px; height: 40px; color: white; background-color: #00a0af; -ms-border-top-left-radius: 5px; border-top-left-radius: 5px; -ms-border-top-right-radius: 5px; border-top-right-radius: 5px">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="margin-top: -9px; -ms-opacity: 10; opacity: 10"><span aria-hidden="true" style="color: #D43F3A">&times;</span></button>
                            <h4 class="modal-title" id="modal-header">Records Of Visit</h4>
                        </div>
                        <div class="modal-body container-fluid">

                            <input id="EWVID" name="EWVID" type="hidden" value="0" />

                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right"><span style="color: red">*</span>Executive Name </label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <select class="chosen-select form-control form-control col-xs-4 col-md-4 col-lg-2 input-sm" name="ExecutiveName" id="ExecutiveName" style="width: 100%"></select>
                                </div>
                            </div>

                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right"><span style="color: red">*</span>NPA Details </label>
                                <div class="col-lg-6" style="padding-bottom: 1%">

                                    <select class="chosen-select form-control form-control col-xs-4 col-md-4 col-lg-2 input-sm" name="NPADetails" id="NPADetails" style="width: 100%;"></select>
                                    <%--<select class="form-control form-control col-xs-4 col-md-4 col-lg-2 input-sm" name="NPADetails" id="NPADetails" style="width: 100%"></select>--%>
                                </div>
                            </div>

                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right">Date(<%=DateFormatForDatePicker.ToUpper()%>)</label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="text" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2 PasteDisable" name="Date" id="Date" style="width: 100%" readonly="readonly" />
                                </div>
                            </div>

                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right">Loan Amount</label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="text" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2 PasteDisable" onkeypress="return Percentage(event,this);" name="LoanAmount" id="LoanAmount" style="width: 100%" readonly="readonly" />
                                </div>
                            </div>

                            <div class="form-group form-group-sm" style="margin-bottom: 0" id="PreviousRecoveredAmountD">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right">Previous Recovered Amount</label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="text" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2 PasteDisable" onkeypress="return Percentage(event,this);" name="PreviousRecoveredAmount" id="PreviousRecoveredAmount" style="width: 100%" readonly="readonly" />
                                </div>
                            </div>

                            <div class="form-group form-group-sm Expences" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right"><span style="color: red">*</span>Bank Range Type </label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <select class="form-control form-control col-xs-4 col-md-4 col-lg-2 input-sm " name="BankRangeType" id="BankRangeType" style="width: 100%">
                                        <option value="-1" selected="selected">-- Select --</option>
                                        <option value="1">NORMAL</option>
                                        <option value="2">OTS</option>
                                    </select>
                                </div>
                            </div>

                            <%--<div class="form-group form-group-sm" style="margin-bottom: 0px">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right"><span style="color: red">*</span>Place Visited</label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="text" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2" name="PlaceVisited" id="PlaceVisited" style="width: 100%" />
                                </div>
                            </div>--%>

                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right"><span style="color: red">*</span>Amount Recovered</label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="text" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2 PasteDisable" onkeypress="return Percentage(event,this);" name="AmountRecovered" id="AmountRecovered" style="width: 100%" />
                                </div>
                            </div>

                            <div class="form-group form-group-sm" style="margin-bottom: 0" id="BalanceAmountD">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right">Balance Amount</label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="text" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2 PasteDisable" onkeypress="return Percentage(event,this);" name="BalanceAmount" id="BalanceAmount" style="width: 100%" readonly="readonly" />
                                </div>
                            </div>

                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right">Follow-Up Action </label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <textarea aria-multiline="true" rows="4" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2" name="Comments" id="Comments" style="width: 100%"></textarea>
                                </div>
                            </div>

                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right">Next Date For Visit(<%=DateFormatForDatePicker.ToUpper()%>)</label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="text" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2 PasteDisable" name="NextDateForVisit" id="NextDateForVisit" style="width: 100%" />
                                </div>
                            </div>

                            <%--<div class="form-group form-group-sm" style="margin-bottom: 0px">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right">Active </label>
                                <div class="col-lg-6" style="padding-top: 1%">
                                    <input type="checkbox" id="Active" name="Active" />
                                </div>
                            </div>--%>
                        </div>
                        <div class="row" style="padding-left: 20px">
                            Asterisk(<span style="color: Red">*</span>) Fields are Required
                        </div>
                        <div class="modal-footer" style="padding: 5px">
                            <button type="submit" class="btn btn-default Save" style="margin-top: 2px" id="SaveBtn"><span class="glyphicon glyphicon-ok"></span>&nbsp;Save</button>
                            <button type="button" data-dismiss="modal" class="btn btn-default Cancel"><span class="glyphicon glyphicon-remove"></span>&nbsp;Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>

    <script>
        jQuery(function () {
            if ('<%= Request.QueryString.AllKeys.Contains("Error")%>' == "True") {
                alert(<%=Request.QueryString["Error"]%>);
                window.location = "ExecutiveWiseVisitDetails.aspx";
            }
            $('#TableFoot').append(TableFoot(9));
            $('.footable').footable();
            EXECUTIVEWISEVISITDETAILS_GET();
            //window.onkeyup = function (e) {
            //    if (e.keyCode == 17) {
            //        NewRecord();
            //    };
            //}

            $("#DROP_DOWN_EXECUTIVE_FOR_REPORT,#DROP_DOWN_BANK_FOR_REPORT, #DROP_DOWN_BRANCH_FOR_REPORT, #DROP_DOWN_CITY_FOR_REPORT, #TEXT_BOX_FROMDATE_FOR_REPORT, #TEXT_BOX_TODATE_FOR_REPORT, #DROP_DOWN_CITY_FOR_REPORT").change(function () {
                EXECUTIVEWISEVISITDETAILS_GET();
            });
            $("#DROP_DOWN_BANK_FOR_REPORT").change(function () {
                DROP_DOWN_BRANCH_FOR_REPORT();
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
            $('#AddExecutiveWiseVisitDetailsModal').on('hidden.bs.modal', function () {
                $("#ExecutiveWiseVisitDetailsForm").bootstrapValidator('resetForm', true);
                $("#EWVID").val(0);
                $('select').val(-1);
                $('textarea').val("");
                $("#LoanAmount").val("");
                $("#PlaceVisited").val("");
                $("#AmountRecovered").val("");
                $("#BalanceAmount").val("");
                $("#Report").val(1);
            });
            $("#NPADetails").change(function () {
                var DataCollection = {};
                DataCollection.ID = $("#NPADetails").val();
                //DataCollection.EXID = null;
                //DataCollection.BankID = null;
                //DataCollection.Branch = null;
                //DataCollection.CityID = null;
                //DataCollection.FDATE = "";
                //DataCollection.TDATE = "";
                $.ajax({
                    type: "POST",
                    url: "ExecutiveWiseVisitDetails.aspx/PRE_RECOVERED_AMOUNT_ON_EXECUTIVE_VISIT",
                    data: JSON.stringify(DataCollection),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        var xmlDoc = $.parseXML(data.d);
                        var xml = $(xmlDoc);
                        var GetEnquiresUserLevel = xml.find("Table");
                        if (GetEnquiresUserLevel.length > 0) {
                            $.each(GetEnquiresUserLevel, function () {
                                $("#LoanAmount").empty().val($(this).find("OUTSTANDINGBALANCE").text()).attr('disabled', true);
                                $("#PreviousRecoveredAmount").empty().val($(this).find("AMOUNTRECOVERD").text()).attr('disabled', true);
                                $("#BalanceAmount").empty().val($(this).find("BALANCE_AMOUNT").text()).attr('disabled', true);
                            });
                        }
                        else {
                            $("#LoanAmount").empty().val("0.00").attr('disabled', true);
                        }
                    }
                });
            });
            $('#ExportMethod').click(function () {
                var EXID = $("#DROP_DOWN_EXECUTIVE_FOR_REPORT").val();
                var FDATE = $("#TEXT_BOX_FROMDATE_FOR_REPORT").val();
                var TDATE = $("#TEXT_BOX_TODATE_FOR_REPORT").val();
                var BANK = $("#DROP_DOWN_BANK_FOR_REPORT").val();
                var BRANCH = $("#DROP_DOWN_BRANCH_FOR_REPORT").val();
                var CITYID = $("#DROP_DOWN_CITY_FOR_REPORT").val();
                var URL = window.location + '?ReportType=' + $("#Report").val() + '&EXID=' + EXID + '&FDATE=' + FDATE + '&TDATE=' + TDATE + '&BANK=' + BANK + '&BRANCH=' + BRANCH + '&CITYID=' + CITYID;
                window.location = URL;
            });
            $('input.PasteDisable').on('paste', function () {
                alert("paste not allowed.");
                return false;
            });
            $("#ExecutiveName").change(function () {
                NPADETAILS_EX_GET(null);
                $('#ExecutiveWiseVisitDetailsForm').bootstrapValidator('revalidateField', $('#NPADetails'));
            });
            $("#LoanAmount,#AmountRecovered").on('keyup change paste', function () {
                var LAMOUNT = ($("#LoanAmount").val());
                var PRE_RAMOUNT = ($("#PreviousRecoveredAmount").val());
                var RAMOUNT = ($("#AmountRecovered").val());
                if (LAMOUNT == null || LAMOUNT == "" || LAMOUNT == undefined) {
                    LAMOUNT = parseFloat(0);
                }
                if (PRE_RAMOUNT == null || PRE_RAMOUNT == "" || PRE_RAMOUNT == undefined) {
                    PRE_RAMOUNT = parseFloat(0);
                }
                if (RAMOUNT == null || RAMOUNT == "" || RAMOUNT == undefined) {
                    RAMOUNT = parseFloat(0);
                }
                if ((parseFloat(LAMOUNT) - parseFloat(PRE_RAMOUNT)) < parseFloat($("#AmountRecovered").val())) {
                    $("#AmountRecovered").val(parseFloat(LAMOUNT) - parseFloat(PRE_RAMOUNT));
                    $("#BalanceAmount").val(0);
                    $('#ExecutiveWiseVisitDetailsForm').bootstrapValidator('revalidateField', $('#AmountRecovered'));
                }
                else {
                    $("#BalanceAmount").val(parseFloat(LAMOUNT) - parseFloat(PRE_RAMOUNT) - parseFloat(RAMOUNT));
                    $('#ExecutiveWiseVisitDetailsForm').bootstrapValidator('revalidateField', $('#AmountRecovered'));
                }
                //if ($("#LoanAmount").val() != "" && $("#AmountRecovered").val() != "") {
                //    $("#BalanceAmount").val(LAMOUNT - RAMOUNT);
                //}
                //else if ($("#LoanAmount").val() != "" && $("#AmountRecovered").val() == "") {
                //    var LAMOUNT = parseFloat($("#LoanAmount").val());
                //    $("#BalanceAmount").val(LAMOUNT - 0);
                //}
                //else if ($("#LoanAmount").val() == "" && $("#AmountRecovered").val() != "") {
                //    $("#AmountRecovered, #BalanceAmount").val(0)
                //}
                //else if ($("#LoanAmount").val() == "" && $("#AmountRecovered").val() == "") {
                //    $("#BalanceAmount").val(0);
                //}
            });
            $('#ExecutiveWiseVisitDetailsForm').bootstrapValidator({
                message: 'This value is not valid',
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                excluded: ':disabled',
                fields: {
                    ExecutiveName: {
                        validators: {
                            callback: {
                                message: 'Please select Executive',
                                callback: function (value) {
                                    if (value == -1) {
                                        return false;
                                    }
                                    else {
                                        return true;
                                    }
                                }
                            }
                        }
                    },
                    NPADetails: {
                        validators: {
                            callback: {
                                message: 'Please select NPA Details',
                                callback: function (value) {
                                    if (value == -1) {
                                        return false;
                                    }
                                    else {
                                        return true;
                                    }
                                }
                            }
                        }
                    },
                    BankRangeType: {
                        validators: {
                            callback: {
                                message: 'Please Select Bank Range Type',
                                callback: function (value, validator) {
                                    var options = validator.getFieldElements('BankRangeType').val();
                                    return (options != "-1");
                                }
                            }
                        }
                    },
                    LoanAmount: {
                        validators: {
                            notEmpty: {
                                message: 'Please Enter Loan Amount'
                            }
                        }
                    },
                    AmountRecovered: {
                        validators: {
                            notEmpty: {
                                message: 'Please Enter Amount Recovered'
                            },
                            callback: {
                                message: 'Please Enter Valid Amount',
                                callback: function () {
                                    //if (value <= 0) {
                                    //    return false;
                                    //}
                                    //else {
                                    return true;
                                    //}
                                }
                            }
                        }
                    }
                    //PlaceVisited: {
                    //    validators: {
                    //        notEmpty: {
                    //            message: 'Please Enter Place Visited'
                    //        }
                    //    }
                    //},
                }
            }).on('success.form.bv', function (e) {
                e.preventDefault();
                var DataCollection = {};
                DataCollection.EWVID = $("#EWVID").val();
                DataCollection.ExecutiveName = $("#ExecutiveName").val();
                DataCollection.NPADetails = $("#NPADetails").val();
                DataCollection.Date = $("#Date").val();
                DataCollection.LoanAmount = $("#LoanAmount").val();
                DataCollection.BankRangeType = $("#BankRangeType").val();
                //DataCollection.PlaceVisited = $("#PlaceVisited").val();
                DataCollection.AmountRecovered = $("#AmountRecovered").val();
                DataCollection.BalanceAmount = $("#BalanceAmount").val();
                DataCollection.Comments = $("#Comments").val();
                DataCollection.NextDateForVisit = $("#NextDateForVisit").val() != "" ? $("#NextDateForVisit").val() : "";
                DataCollection.Active = "true";//$("#Active").is(':checked');

                $.ajax({
                    url: "ExecutiveWiseVisitDetails.aspx/EXECUTEWISEDETAILS_INSERT_UPDATE",
                    data: JSON.stringify(DataCollection),
                    type: "POST",
                    async: false,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        if ($("#EWVID").val() != "0") {
                            $("#AlertMessage").finish().removeClass().addClass('alert alert-success').slideDown(window.InTimeinMicSec).delay(window.DelayTimeInMicSec).slideUp(window.OutTimeInMicSec).children('strong', this).empty().text('Success!').parent().children('span:first', this).empty().html('Succesfully <a href="#" onclick="EditRecord(' + $("#EWVID").val() + ')">Records Of Visit Details</a> Updated.');
                        }
                        else {
                            $("#AlertMessage").finish().removeClass().addClass('alert alert-success').slideDown(window.InTimeinMicSec).delay(window.DelayTimeInMicSec).slideUp(window.OutTimeInMicSec).children('strong', this).empty().text('Success!').parent().children('span:first', this).empty().html('Succesfully New Records Of Visit Details Saved.');
                        }
                        $('.modal').modal('hide');
                        EXECUTIVEWISEVISITDETAILS_GET();
                    }
                });
            });
        });
        function NewRecord() {
            $("#modal-header").empty().text("New Record Of Visit");
            $('#SaveBtn').empty().html('<span class="glyphicon glyphicon-ok"></span>&nbsp;Save');
            ExecutiveDropDown(null, null);
            $("#Active").prop('checked', true);
            $("#Date").datepicker({
                
                changeMonth: true,
                changeYear: true,
                maxDate: new Date()
            }).datepicker("setDate", new Date());
            $("#NextDateForVisit").datepicker({
                
                changeMonth: true,
                changeYear: true,
                minDate: new Date()
            }).datepicker("setDate", new Date());
            $("#NextDateForVisit").val("");
            $("#Report").val(1);
            $('#AddExecutiveWiseVisitDetailsModal').modal({ backdrop: 'static', keyboard: false }).on('shown.bs.modal', function () {
                $(this).find('#ExecutiveName').focus();
            });
            $("#PreviousRecoveredAmountD,#BalanceAmountD").show();
        }
        function EXECUTIVEWISEVISITDETAILS_GET() {
            var DataCollection = {};
            DataCollection.ID = null;
            DataCollection.EXID = $("#DROP_DOWN_EXECUTIVE_FOR_REPORT").val();
            DataCollection.BANK = $("#DROP_DOWN_BANK_FOR_REPORT").val();
            DataCollection.BRANCH = $("#DROP_DOWN_BRANCH_FOR_REPORT").val();
            DataCollection.FDATE = $("#TEXT_BOX_FROMDATE_FOR_REPORT").val();
            DataCollection.TDATE = $("#TEXT_BOX_TODATE_FOR_REPORT").val();
            DataCollection.CITYID = $("#DROP_DOWN_CITY_FOR_REPORT").val();
            $.ajax({
                type: "POST",
                url: "ExecutiveWiseVisitDetails.aspx/EXECUTIVEWISEVISITDETAILS_GET",
                data: JSON.stringify(DataCollection),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    $("#ExecutiveWiseVisitDetailsData").empty();
                    var xmlDoc = $.parseXML(data.d);
                    var xml = $(xmlDoc);
                    var GetEnquiresUserLevel = xml.find("Table");
                    if (GetEnquiresUserLevel.length > 0) {
                        $("#VisitCount").empty().text(GetEnquiresUserLevel.length);
                        $('#ReportCollasseButton').show();
                        $.each(GetEnquiresUserLevel, function () {
                            var EditRecord = '<a onclick="javascript:EditRecord(' + $(this).find("ID").text() + ')" style="cursor:pointer;"><span class="glyphicon glyphicon glyphicon-edit EDIT-ICON" style="color:black" title="Edit This Record"></span></a>';

                            var Status = "";
                            if ($(this).find("ACTIVE").text().toLowerCase() == "true") {
                                Status = '<span class="label label-success LBLACTIVE">Active</span>';
                            }
                            else {
                                Status = '<span class="label label-warning LBLINACTIVE">Inactive</span>';
                            }
                            $("#ExecutiveWiseVisitDetailsData").append('<tr>' +
                                                   '<td style="text-align:center">' + EditRecord + '</td>' +
                                                   '<td>' + $(this).find("LOGIN").text() + '</td>' +
                                                   '<td>' + $(this).find("ACNO").text() + '</td>' +
                                                   '<td>' + $(this).find("DATE").text() + '</td>' +
                                                   '<td>' + $(this).find("LOANAMOUNT").text() + '</td>' +
                                                   '<td>' + $(this).find("BANKRANGETYPEV").text() + '</td>' +
                                                   //'<td>' + $(this).find("PLACEVISITED").text() + '</td>' +
                                                   '<td>' + $(this).find("AMOUNTRECOVERD").text() + '</td>' +
                                                   //'<td>' + $(this).find("BALANCEAMOUNT").text() + '</td>' +
                                                   '<td>' + $(this).find("COMMENTS").text() + '</td>' +
                                                   '<td>' + $(this).find("NEXTDATEFORVISIT").text() + '</td>' +
                                                   //'<td style="text-align:center">' + Status + '</td>' +
                                                  '</tr>');
                        });
                    }
                    else {
                        $("#ExecutiveWiseVisitDetailsData").append('<tr><td colspan="9" style="text-align:center"> No Data To Display</td></tr>');
                        $("#VisitCount").empty().text(0);
                    }
                    $('.footable').trigger('footable_initialize');
                }
            });
        }

        function EditRecord(EWVID) {
            var DataCollection = {};
            DataCollection.ID = EWVID;
            DataCollection.EXID = null;
            DataCollection.BANK = null;
            DataCollection.BRANCH = null;
            DataCollection.FDATE = null;
            DataCollection.TDATE = null;
            DataCollection.CITYID = null;
            $.ajax({
                type: "POST",
                url: "ExecutiveWiseVisitDetails.aspx/EXECUTIVEWISEVISITDETAILS_GET",
                data: JSON.stringify(DataCollection),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var xmlDoc = $.parseXML(data.d);
                    var xml = $(xmlDoc);
                    var GetEnquiresUserLevel = xml.find("Table");
                    $.each(GetEnquiresUserLevel, function () {
                        $('#SaveBtn').empty().html('<span class="glyphicon glyphicon-ok"></span>&nbsp;Update');
                        $("#modal-header").empty().text("Edit Record Of Visit");
                        $("#EWVID").val($(this).find("ID").text());
                        ExecutiveDropDown($(this).find("EXECUTEID").text(), $(this).find("NPAID").text());
                        $("#Date").datepicker({
                            changeMonth: true,
                            changeYear: true,
                        }).datepicker("setDate", new Date($(this).find("DATE").text()));
                        if ($(this).find("NEXTDATEFORVISIT").text() != "") {
                            $("#NextDateForVisit").datepicker({
                                changeMonth: true,
                                changeYear: true
                            }).datepicker("setDate", new Date($(this).find("NEXTDATEFORVISIT").text()));
                        }
                        else {
                            $("#NextDateForVisit").val("");
                        }
                        $("#LoanAmount").val($(this).find("LOANAMOUNT").text());
                        $("#BankRangeType").val($(this).find("BANKRANGETYPE").text());
                        //$("#PlaceVisited").val($(this).find("PLACEVISITED").text());
                        $("#AmountRecovered").val($(this).find("AMOUNTRECOVERD").text());
                        $("#BalanceAmount").val($(this).find("BALANCEAMOUNT").text());
                        $("#Comments").val($(this).find("COMMENTS").text());
                        $("#PreviousRecoveredAmountD,#BalanceAmountD").hide();
                        //if ($(this).find("ACTIVE").text().toLowerCase() == "true") {
                        //    $("#Active").prop('checked', true);
                        //}
                        //else {
                        //    $("#Active").prop('checked', false);
                        //}
                    });
                    $('#AddExecutiveWiseVisitDetailsModal').modal({ backdrop: 'static', keyboard: false });
                }
            });
        }
        function InActiveRecord(EWVID) {
            $.ajax({
                type: "POST",
                url: "ExecutiveWiseVisitDetails.aspx/EXECUTEWISEDETAILS_DELETE",
                data: '{"ID":"' + EWVID + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function () {
                    $("#AlertMessage").finish().removeClass().addClass('alert alert-danger').slideDown(window.InTimeinMicSec).delay(window.DelayTimeInMicSec).slideUp(window.OutTimeInMicSec).children('strong', this).empty().text('Deleted!').parent().children('span:first', this).empty().html('Record succesfully inactive/deleted.');
                    EXECUTIVEWISEVISITDETAILS_GET();
                }
            });
        }
        function ExecutiveDropDown(ID, NPAID) {
            $.ajax({
                type: "POST",
                url: "BankVisitDetails.aspx/EXECUTIVE_DROPDOEN_GET",
                data: {},
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    $("#ExecutiveName").empty();
                    var xmlDoc = $.parseXML(data.d);
                    var xml = $(xmlDoc);
                    var ExecutiveDropDownT = xml.find("Table");
                    if (ExecutiveDropDownT.length > 0) {
                        $("#ExecutiveName").append('<option value="-1">-- Select --</option>');
                        $.each(ExecutiveDropDownT, function () {
                            $("#ExecutiveName").append('<option value="' + $(this).find("USERID").text() + '">' + $(this).find("LOGIN").text() + '</option>');
                        });
                        if (ID != null) {
                            $("#ExecutiveName").val(ID);
                        }
                        NPADETAILS_EX_GET(NPAID);
                    }
                    else {
                        $("#ExecutiveName").append('<option value="-1">-- No Data --</option>');
                    }
                    var config = { '.chosen-select': {} }
                    for (var selector in config) {
                        if (config.hasOwnProperty(selector)) {
                            if (config.hasOwnProperty(selector)) {
                                $(selector).chosen(config[selector]);
                            }
                        }
                    }
                    $("#ExecutiveName").trigger("chosen:updated");
                }
            });
        }

        function NPADETAILS_EX_GET(NPAID) {
            var EXID = $("#ExecutiveName").val();
            if (EXID == "" || EXID == null || EXID == undefined) {
                EXID = 0;
            }

            $.ajax({
                type: "POST",
                url: "ExecutiveWiseVisitDetails.aspx/NPADETAILS_EX_GET",
                data: '{"ID":"' + EXID + '","REF_ID":' + $("#EWVID").val() + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    $("#NPADetails").empty();
                    var xmlDoc = $.parseXML(data.d);
                    var xml = $(xmlDoc);
                    var BankDropDownT = xml.find("Table");
                    if (BankDropDownT.length > 0) {
                        $("#NPADetails").append('<option value="-1">-- Select --</option>');
                        $.each(BankDropDownT, function () {
                            $("#NPADetails").append('<option value="' + $(this).find("ID").text() + '">' + $(this).find("LOANACCOUNTNO").text() + '</option>');
                        });
                        if (NPAID != null) {
                            $("#NPADetails").val(NPAID);
                        }
                    }
                    else {
                        if (EXID == "-1") {
                            $("#NPADetails").append('<option value="-1">-- Select --</option>');
                        }
                        else {
                            $("#NPADetails").append('<option value="-1">-- No NPA To Recover --</option>');
                        }
                    }
                    var config = { '.chosen-select': {} }
                    for (var selector in config) {
                        if (config.hasOwnProperty(selector)) {
                            if (config.hasOwnProperty(selector)) {
                                $(selector).chosen(config[selector]);
                            }
                        }
                    }
                    $("#NPADetails").trigger("chosen:updated");
                }
            });
        }
        function EXECUTIVEDROPDOWN_FOR_REPORT() {
            $.ajax({
                type: "POST",
                url: "BankVisitDetails.aspx/EXECUTIVE_DROPDOEN_GET",
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
            $.ajax({
                type: "POST",
                url: "NPADetails.aspx/BANK_DROPDOWN_FOR_REPORT",
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
        function DROP_DOWN_BRANCH_FOR_REPORT() {
            $.ajax({
                type: "POST",
                url: "NPADetails.aspx/DROP_DOWN_BRANCH_FOR_REPORT",
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
                    }
                    else {
                        $("#DROP_DOWN_BRANCH_FOR_REPORT").append('<option value="-1">-- ALL --</option>');
                    }
                    var config = { '.chosen-select': {} }
                    for (var selector in config) {
                        if (config.hasOwnProperty(selector)) {
                            if (config.hasOwnProperty(selector)) {
                                $(selector).chosen(config[selector]);
                            }
                        }
                    }
                    $("#DROP_DOWN_BRANCH_FOR_REPORT").trigger("chosen:updated");
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
                    var config = { '.chosen-select': {} }
                    for (var selector in config) {
                        if (config.hasOwnProperty(selector)) {
                            if (config.hasOwnProperty(selector)) {
                                $(selector).chosen(config[selector]);
                            }
                        }
                    }
                    $("#DROP_DOWN_CITY_FOR_REPORT").trigger("chosen:updated");
                }
            });
            }
    </script>
</asp:Content>
