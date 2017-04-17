<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RecoveryStatement.aspx.cs" Inherits="DailyTransactions_RecoveryStatement" MasterPageFile="~/MasterPage/CRMaster.master" %>

<asp:Content ContentPlaceHolderID="CRMasterHead" runat="server"></asp:Content>
<asp:Content ContentPlaceHolderID="CRMasterBody" runat="server">
<script src="../APPRequires/FooTable/js/footable.js"></script>
<script src="../APPRequires/FooTable/js/footable.filter.js"></script>
<script src="../APPRequires/FooTable/js/footable.sort.js"></script>
<script src="../APPRequires/FooTable/js/footable.paginate.js"></script>
<link href="../APPRequires/FooTable/css/footable.core.css" rel="stylesheet" />
<link href="../APPRequires/FooTable/css/footable.metro.css" rel="stylesheet" />
    <div class="page-header">
        <h3>Bank billing details <span class="badge" id="BankBillingCount"></span></h3>
    </div>
    <div class="panel-body PagePanelBody">

        <input type="text" class="form-control SEARCH_BOX" placeholder="Search Here" id="Create_Customer_Search" style="margin-bottom: 3px">
        <%--REPORT COLLAPSE PANEL START--%>
        <a class="btn btn-warning pull-right" role="button" id="ReportCollasseButton" data-toggle="collapse" href="#ReportCollassePanel" aria-expanded="false" aria-controls="ReportCollassePanel" title="Filters/Export/Reports" style="height: 16px; -ms-border-radius: 0; border-radius: 0; -ms-border-bottom-left-radius: 4px; border-bottom-left-radius: 4px; -ms-border-bottom-right-radius: 4px; border-bottom-right-radius: 4px; padding-top: 0; padding-bottom: 0; margin-bottom: 2px; color: white"><span class="glyphicon glyphicon-chevron-down"></span></a>
        <div class="collapse" id="ReportCollassePanel">
            <div class="panel-body" style="border: 1px solid #ebebeb">

                <%--<div class="form-group form-group-sm" style="margin-bottom: 0px">
                    <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; padding-top: 5px; text-align: right">Eexecutive </label>
                    <div class="col-lg-6" style="padding-bottom: 1%">
                        <select class="form-control form-control col-xs-4 col-md-4 col-lg-2 input-sm " name="DROP_DOWN_EXECUTIVE_FOR_REPORT" id="DROP_DOWN_EXECUTIVE_FOR_REPORT" style="width: 100%"></select>
                    </div>
                </div>--%>
                
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
                    <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; padding-top: 5px; text-align: right">NPA </label>
                    <div class="col-lg-6" style="padding-bottom: 1%">
                        <select class="chosen-select form-control form-control col-xs-4 col-md-4 col-lg-2 input-sm" name="DROP_DOWN_NPA_FOR_REPORT" id="DROP_DOWN_NPA_FOR_REPORT" style="width: 100%;"></select>
                    </div>
                </div>
                
                <div class="form-group form-group-sm" style="margin-bottom: 0">
                    <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; padding-top: 5px; text-align: right">Status </label>
                    <div class="col-lg-6" style="padding-bottom: 1%">
                        <select class="form-control form-control col-xs-4 col-md-4 col-lg-2 input-sm " name="DROP_DOWN_STATUS_FOR_REPORT" id="DROP_DOWN_STATUS_FOR_REPORT" style="width: 100%">
                            <option value="-1">-- All --</option>
                            <option value="1">CLOSE</option>
                            <option value="0">PENDING</option>
                        </select>
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
        <table class="footable table  toggle-arrow-circle-filled" id="CreateCustomerTable" data-filter="#Create_Customer_Search" data-page-size="10" data-limit-navigation="1">
            <thead>
                <tr>
                    <th data-sort-ignore="true" style="text-align: center; color: white; display: table-cell; vertical-align: middle; -moz-min-width: 55px; -ms-min-width: 55px; -o-min-width: 55px; -webkit-min-width: 55px; min-width: 55px">
                        <input type="button" class="button circle" style="height: 30px;" value="+" onclick="NewRecord();" title="Add New Record" /></th>
                    <th style="-moz-min-width: 135px; -ms-min-width: 135px; -o-min-width: 135px; -webkit-min-width: 135px; min-width: 135px; text-align: left">Bank </th>
                    <th style="-moz-min-width: 114px; -ms-min-width: 114px; -o-min-width: 114px; -webkit-min-width: 114px; min-width: 114px; text-align: left" data-hide="phone">Branch</th>
                    <th data-hide="phone, tablet" style="-moz-min-width: 113px; -ms-min-width: 113px; -o-min-width: 113px; -webkit-min-width: 113px; min-width: 113px; text-align: center">NPA</th>
                    <th data-hide="phone, tablet" style="-moz-min-width: 105px; -ms-min-width: 105px; -o-min-width: 105px; -webkit-min-width: 105px; min-width: 105px; text-align: right">Recovered Amount</th>
                    <th data-hide="phone" style="-moz-min-width: 111px; -ms-min-width: 111px; -o-min-width: 111px; -webkit-min-width: 111px; min-width: 111px; text-align: right">Bill Amount</th>
                    <th data-hide="phone" style="-moz-min-width: 94px; -ms-min-width: 94px; -o-min-width: 94px; -webkit-min-width: 94px; min-width: 94px; text-align: right">Bill Amount Received</th>
                    <th data-hide="phone" style="-moz-min-width: 110px; -ms-min-width: 110px; -o-min-width: 110px; -webkit-min-width: 110px; min-width: 110px; text-align: right">Amount Less Paid</th>
                    <th data-hide="phone" style="-moz-min-width: 110px; -ms-min-width: 110px; -o-min-width: 110px; -webkit-min-width: 110px; min-width: 110px; text-align: right">TDS</th>
                    <th data-hide="phone, tablet" style="-moz-min-width: 94px; -ms-min-width: 94px; -o-min-width: 94px; -webkit-min-width: 94px; min-width: 94px; text-align: right">Bill Due</th>
                    <%--<th data-hide="phone" style="min-width: 110px">Date</th>--%>
                    <th style="-moz-min-width: 81px; -ms-min-width: 81px; -o-min-width: 81px; -webkit-min-width: 81px; min-width: 81px">Status</th>
                </tr>
            </thead>
            <tbody id="TableBody">
            </tbody>
            <tfoot class="hide-if-no-paging" id="TableFoot"></tfoot>
        </table>

        <form id="RecoveryStatementForm" class="form-horizontal" method="post">

            <div id="RecoveryStatementModal" class="modal fade bs-example-modal-sm" tabindex="-1" style="top: 15%; overflow: hidden; overflow-y: scroll">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content" style="-ms-border-top-left-radius: 10px; border-top-left-radius: 10px; -ms-border-top-right-radius: 10px; border-top-right-radius: 10px">
                        <div class="modal-header" style="padding: 10px; height: 40px; color: white; background-color: #00a0af; -ms-border-top-left-radius: 5px; border-top-left-radius: 5px; -ms-border-top-right-radius: 5px; border-top-right-radius: 5px">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="margin-top: -9px; -ms-opacity: 10; opacity: 10"><span aria-hidden="true" style="color: #D43F3A">&times;</span></button>
                            <h4 class="modal-title" id="modal-header">New User</h4>
                        </div>
                        <div class="modal-body container-fluid">

                            <input id="RecoveryStatementID" name="RecoveryStatementID" type="hidden" value="0" />

                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right"><span style="color: red">*</span>Bank Name </label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <select class="chosen-select form-control form-control col-xs-4 col-md-4 col-lg-2 input-sm" name="BankName" id="BankName" style="width: 100%"></select>
                                </div>
                            </div>

                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right"><span style="color: red">*</span>NPA Details </label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <select class="chosen-select form-control form-control col-xs-4 col-md-4 col-lg-2 input-sm" name="NPADetails" id="NPADetails" style="width: 100%;"></select>
                                    <%--<select class="form-control form-control col-xs-4 col-md-4 col-lg-2 input-sm" name="NPADetails" id="NPADetails" style="width: 100%"></select>--%>
                                </div>
                            </div>


                            <div class="form-group form-group-sm" style="margin-bottom: 0; margin: 0 auto">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right"></label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <table class="footable" id="Rangestable" hidden="hidden">
                                        <thead>
                                            <tr>
                                                <td>Type</td>
                                                <td>Total Commission</td>
                                                <%--<td>Pre Recovered Amount</td>--%>
                                                <%--<td>Balance Amount</td>--%>
                                            </tr>
                                        </thead>
                                        <tbody id="RecoveredTable"></tbody>
                                    </table>
                                </div>
                            </div>

                            <%--                            <div class="form-group form-group-sm" style="margin-bottom: 0px">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right">Total Recovered Amount</label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="text" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2 PasteDisable" name="RecoveredAmount" id="RecoveredAmount" style="width: 100%"  readonly="true"/>
                                </div>
                            </div>--%>

                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right">Bill Amount</label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="text" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2 PasteDisable" name="BillAmount" id="BillAmount" style="width: 100%" readonly="readonly"/>
                                </div>
                            </div>

                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right">Previous Bill Amount Recovered</label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="text" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2 PasteDisable" name="PreBillAmountRecovered" id="PreBillAmountRecovered" style="width: 100%" readonly="readonly"/>
                                </div>
                            </div>

                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right"><span style="color: red">*</span>Bill Amount Received</label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="text" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2 PasteDisable" onkeypress="return NumberOnly(event,this);" onblur="BillAmountRecoveredCalculation();" onkeyup="BillAmountRecoveredCalculation();" onchange="BillAmountRecoveredCalculation();" name="BillAmountRecovered" id="BillAmountRecovered" style="width: 100%" />
                                </div>
                            </div>

                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right">Amount less paid</label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="text" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2 PasteDisable" onkeypress="return NumberOnly(event,this);" onblur="BillAmountRecoveredCalculation1();" onkeyup="BillAmountRecoveredCalculation1();" onchange="BillAmountRecoveredCalculation1();" name="Amountlesspaid" id="Amountlesspaid" style="width: 100%" />
                                </div>
                            </div>

                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right">TDS</label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="text" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2 PasteDisable" onkeypress="return NumberOnly(event,this);" onblur="BillAmountRecoveredCalculation2();" onkeyup="BillAmountRecoveredCalculation2();" onchange="BillAmountRecoveredCalculation2();" name="TDS" id="TDS" style="width: 100%" />
                                </div>
                            </div>

                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right"><span style="color: red">*</span>Bill(s) Due</label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="text" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2 PasteDisable" name="BillsDue" id="BillsDue" style="width: 100%" readonly="readonly"/>
                                </div>
                            </div>

                            <div class="form-group form-group-sm Expences" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right"><span style="color: red">*</span>Date(<%=DateFormatForDatePicker.ToUpper()%>) </label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="tel" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2" name="Date" id="Date" style="width: 100%" readonly="readonly"/>
                                </div>
                            </div>

                            <%--<div class="form-group form-group-sm" style="margin-bottom: 0px">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right">Active </label>
                                <div class="col-lg-6" style="padding-top: 1%">
                                    <input type="checkbox" id="Active" name="Active" checked="checked" />
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

        <div id="RECOVERY_STATEMENT_BILLS_MODAL" class="modal fade bs-example-modal-sm" tabindex="-1" style="top: 15%; overflow: hidden; overflow-y: scroll">
            <div class="modal-dialog modal-lg">
                <div class="modal-content" style="-ms-border-top-left-radius: 10px; border-top-left-radius: 10px; -ms-border-top-right-radius: 10px; border-top-right-radius: 10px">
                    <div class="modal-header" style="padding: 10px; height: 40px; color: white; background-color: #00a0af; -ms-border-top-left-radius: 5px; border-top-left-radius: 5px; -ms-border-top-right-radius: 5px; border-top-right-radius: 5px">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="margin-top: -9px; -ms-opacity: 10; opacity: 10"><span aria-hidden="true" style="color: #D43F3A">&times;</span></button>
                            <h4 class="modal-title">Bill(s)</h4></div>
                    <div class="modal-body container-fluid">
                        <table class="footable table  toggle-arrow-circle-filled" data-page-size="50" data-limit-navigation="1">
                            <thead>
                                <tr>
                                    <th style="-moz-min-width: 135px; -ms-min-width: 135px; -o-min-width: 135px; -webkit-min-width: 135px; min-width: 135px; text-align: left">S.No. </th>
                                    <th style="-moz-min-width: 135px; -ms-min-width: 135px; -o-min-width: 135px; -webkit-min-width: 135px; min-width: 135px; text-align: right">Received Amount </th>
                                    <th data-hide="phone" style="-moz-min-width: 110px; -ms-min-width: 110px; -o-min-width: 110px; -webkit-min-width: 110px; min-width: 110px; text-align: right">Amount Less Paid</th>
                                    <th data-hide="phone" style="-moz-min-width: 110px; -ms-min-width: 110px; -o-min-width: 110px; -webkit-min-width: 110px; min-width: 110px; text-align: right">TDS</th>
                                    <th data-hide="phone" style="-moz-min-width: 110px; -ms-min-width: 110px; -o-min-width: 110px; -webkit-min-width: 110px; min-width: 110px; text-align: right">Total</th>
                                    <th data-hide="phone, tablet" style="-moz-min-width: 94px; -ms-min-width: 94px; -o-min-width: 94px; -webkit-min-width: 94px; min-width: 94px; text-align: center">Bill Date(MM/DD/YYYY)</th>
                                </tr>
                            </thead>
                            <tbody id="RECOVERY_STATEMENT_BILLS_BODY"></tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    


    <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.3/css/bootstrapValidator.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.3/js/bootstrapValidator.js" type="text/javascript"></script>
    <link href="../APPRequires/CascadingStyleSheet/chosen.css" rel="stylesheet" />
    <script src="../APPRequires/JavaScript/chosen.jquery.js"></script>
    <script>
        var UserID = null;
        var UserRole = null;
        var Status = new Array();
        jQuery(function () {
            if ('<%= Request.QueryString.AllKeys.Contains("Error")%>' == "True") {
                alert(<%=Request.QueryString["Error"]%>);
                window.location = "RecoveryStatement.aspx";
            }
            $('#TableFoot').append(TableFoot(11));
            $('.footable').footable();
            RECOVERY_STATEMENT_DATA();
            $('#RecoveryStatementModal').on('hidden.bs.modal', function () {
                $("#RecoveryStatementForm").bootstrapValidator('resetForm', true);
                $("#RecoveryStatementID").val(0);
                $("#Report").val(1);
            });

            $("#DROP_DOWN_EXECUTIVE_FOR_REPORT").change(function () {
                NPADROPDOWN_FOR_REPORT();
            });
            $("#DROP_DOWN_STATUS_FOR_REPORT, #DROP_DOWN_BANK_FOR_REPORT, #DROP_DOWN_BRANCH_FOR_REPORT, #DROP_DOWN_NPA_FOR_REPORT, #TEXT_BOX_FROMDATE_FOR_REPORT, #TEXT_BOX_TODATE_FOR_REPORT").change(function () {
                RECOVERY_STATEMENT_DATA();
            });
            $("#DROP_DOWN_BANK_FOR_REPORT").change(function () {
                DROP_DOWN_BRANCH_FOR_REPORT();
            });
            $("#DROP_DOWN_BRANCH_FOR_REPORT").change(function () {
                NPADROPDOWN_FOR_REPORT();
            });
            $("#ReportCollasseButton").click(function () {
                if (!$("#ReportCollassePanel").hasClass('in')) {
                    //EXECUTIVEDROPDOWN_FOR_REPORT();
                    BANKDROPDOWN_FOR_REPORT();
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
            $('#ExportMethod').click(function () {
                var BANK = $("#DROP_DOWN_BANK_FOR_REPORT").val();
                var BRANCH = $("#DROP_DOWN_BRANCH_FOR_REPORT").val();
                var NPAID = $("#DROP_DOWN_NPA_FOR_REPORT").val();
                var STATUS = $("#DROP_DOWN_STATUS_FOR_REPORT").val();
                var FDATE = $("#TEXT_BOX_FROMDATE_FOR_REPORT").val();
                var TDATE = $("#TEXT_BOX_TODATE_FOR_REPORT").val();
                var URL = window.location + '?ReportType=' + $("#Report").val() + '&BANK=' + BANK + '&BRANCH=' + BRANCH + '&NPAID=' + NPAID + '&STATUS=' + STATUS + '&FDATE=' + FDATE + '&TDATE=' + TDATE;
                window.location = URL;
            });
            $("#BankName").change(function () {
                NPADETAILS_GET(null);
            });
            $("#NPADetails").change(function() {
                RECOVERED_AMOUNT();
            });
            $('#RecoveryStatementForm').bootstrapValidator({
                message: 'This value is not valid',
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                excluded: ':disabled',
                fields: {
                    BankName: {
                        validators: {
                            callback: {
                                message: 'Please select bank',
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
                                        $("#BillAmountRecovered, #Amountlesspaid, #TDS").prop('disabled', true);
                                        return false;
                                    }
                                    else {
                                        $("#BillAmountRecovered, #Amountlesspaid, #TDS").prop('disabled', false);
                                        return true;
                                    }
                                }
                            }
                        }
                    },
                    BillAmountRecovered: {
                        validators: {
                            notEmpty: {
                                message: 'Please Enter Bill Amount Recovered'
                            },
                            callback: {
                                message: 'Please Enter Valid Amount',
                                callback: function (value) {
                                    if (value <= 0) {
                                        return false;
                                    }
                                    else {
                                        return true;
                                    }
                                }
                            }
                        }
                    }
                }
            }).on('success.form.bv', function () {
                var DataCollection = {};
                DataCollection.RecoveryStatementID = $("#RecoveryStatementID").val();
                DataCollection.BankName = $("#BankName").val();
                DataCollection.NPADetails = $("#NPADetails").val();
                DataCollection.BillAmountRecovered = $("#BillAmountRecovered").val();
                DataCollection.Date = $("#Date").val();
                DataCollection.Amountlesspaid = $("#Amountlesspaid").val() == "" ? null : $("#Amountlesspaid").val();
                DataCollection.TDS = $("#TDS").val() == "" ? null : $("#TDS").val() ;
                DataCollection.Active = "true";//$("#Active").is(':checked');
                $.ajax({
                    url: "RecoveryStatement.aspx/RECOVERY_STATEMENT_INSERT_UPDATE",
                    data: JSON.stringify(DataCollection),
                    type: "POST",
                    async: false,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        if ($("#RecoveryStatementID").val() != "0") {
                            $("#AlertMessage").finish().removeClass().addClass('alert alert-success').slideDown(window.InTimeinMicSec).delay(window.DelayTimeInMicSec).slideUp(window.OutTimeInMicSec).children('strong', this).empty().text('Success!').parent().children('span:first', this).empty().html('Succesfully <a href="#" onclick="EditRecord(' + $("#UserID").val() + ')">' + $("#UserName").val() + '</a> Updated.');
                        }
                        else {
                            $("#AlertMessage").finish().removeClass().addClass('alert alert-success').slideDown(window.InTimeinMicSec).delay(window.DelayTimeInMicSec).slideUp(window.OutTimeInMicSec).children('strong', this).empty().text('Success!').parent().children('span:first', this).empty().html('Succesfully New User Saved.');
                        }
                        $('.modal').modal('hide');
                    }
                });
            });
        });
        function NewRecord() {
            $("#modal-header").empty().text("New Bank billing details");
            $('#SaveBtn').empty().html('<span class="glyphicon glyphicon-ok"></span>&nbsp;Save');
            $("#Active").prop('checked', true);
            $('select').val(0);
            $("#Date").datepicker({
                
                changeMonth: true,
                changeYear: true,
                maxDate: new Date()
            }).datepicker("setDate", new Date());
            //$("input type[text]").val("");
            $('#BillAmountRecovered,#RecoveredAmount,#BillAmount,#PreBillAmountRecovered,#BillsDue,#Percentage,textarea,#TDS,#Amountlesspaid').val("");
            BankDropDown(null, null);
            $("#Report").val(1);
            $("#NormalRange,#NormalPercentage,#NormalAmount,#OTSRange,#OTSPercentage,#OTSAmount").empty();
            $("#Rangestable").hide();
            $("#BillAmountRecovered, #Amountlesspaid, #TDS").prop('disabled', true);
            $('#RecoveryStatementModal').modal({ backdrop: 'static', keyboard: false }).on('shown.bs.modal', function () {
                $(this).find('#BankName').focus();
            });
        }
        function RECOVERY_STATEMENT_DATA() {
            var DataCollection = {};
            DataCollection.ID = null;
            DataCollection.BANK = $("#DROP_DOWN_BANK_FOR_REPORT").val();
            DataCollection.BRANCH = $("#DROP_DOWN_BRANCH_FOR_REPORT").val();
            DataCollection.NPAID = $("#DROP_DOWN_NPA_FOR_REPORT").val();
            DataCollection.STATUS = $("#DROP_DOWN_STATUS_FOR_REPORT").val();
            DataCollection.FDATE = $("#TEXT_BOX_FROMDATE_FOR_REPORT").val();
            DataCollection.TDATE = $("#TEXT_BOX_TODATE_FOR_REPORT").val();
            $.ajax({
                type: "POST",
                url: "RecoveryStatement.aspx/RECOVERY_STATEMENT_GET",
                data: JSON.stringify(DataCollection),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    $('#ReportCollasseButton').show();
                    $("#TableBody").empty();
                    var xmlDoc = $.parseXML(data.d);
                    var xml = $(xmlDoc);
                    var GetEnquiresUserLevel = xml.find("Table");
                    if (GetEnquiresUserLevel.length > 0) {
                        $("#BankBillingCount").empty().text(GetEnquiresUserLevel.length);
                        var Rows = "";
                        $.each(GetEnquiresUserLevel, function () {
                            var ListOfRecord = '<a onclick="javascript:ListOfRecord(' + $(this).find("NPA_ID").text() + ')" style="cursor:pointer;"><span class="glyphicon glyphicon-th-list" style="color:black" title="List Of Records"></span></a>';

                            var Status = "";
                            if ($(this).find("STATUS").text().toLowerCase() == "close") {
                                Status = '<span class="label label-success LBLACTIVE">CLOSE</span>';
                            }
                            else {
                                Status = '<span class="label label-warning LBLINACTIVE">PENDING</span>';
                            }
                            Rows += '<tr>' +
                                                   '<td style="text-align:center">' + ListOfRecord + '</td>' +
                                                   '<td style="text-align:left">' + $(this).find("BANK_NAME").text() + '</td>' +
                                                   '<td style="text-align:left">' + $(this).find("BRANCH_NAME").text() + '</td>' +
                                                   '<td style="text-align:center">' + $(this).find("NPA_DETAILS").text() + '</td>' +
                                                   '<td style="text-align:right">' + $(this).find("TOTAL_RECOVERED").text() + '</td>' +
                                                   '<td style="text-align:right">' + $(this).find("TOTAL_COMMISSION").text() + '</td>' +
                                                   '<td style="text-align:right">' + $(this).find("BILL_AMOUNT_RECOVERED").text() + '</td>' +
                                                   '<td style="text-align:right">' + $(this).find("AMOUNT_LESS_PAID").text() + '</td>' +
                                                   '<td style="text-align:right">' + $(this).find("TDS").text() + '</td>' +
                                                   '<td style="text-align:right">' + $(this).find("BILL_DUE").text() + '</td>' +
                                                   //'<td>' + $(this).find("BILL_DATE").text() + '</td>' +
                                                   '<td style="text-align:center">' + Status + '</td>' +
                                                  '</tr>';
                        });
                        $("#TableBody").append(Rows);
                    }
                    else {
                        $("#TableBody").append('<tr><td colspan="12" style="text-align:center"> No Data To Display</td></tr>');
                        $("#BankBillingCount").empty().text(0);
                    }
                    $('.footable').trigger('footable_initialize');
                }
            });
        }
        function InActiveRecord(ID) {
            $.ajax({
                type: "POST",
                url: "RecoveryStatement.aspx/RECOVERY_STATEMENT_DELETE",
                data: '{"ID":"' + ID + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function () {
                    $("#AlertMessage").finish().removeClass().addClass('alert alert-danger').slideDown(window.OutTimeInMicSec).delay(window.DelayTimeInMicSec).slideUp(window.OutTimeInMicSec).children('strong', this).empty().text('Deleted!').parent().children('span:first', this).empty().html('Record succesfully inactive/deleted.');
                    RECOVERY_STATEMENT_DATA();
                }
            });
        }
        function EditRecord(ID) {
            $.ajax({
                type: "POST",
                url: "RecoveryStatement.aspx/RECOVERY_STATEMENT_GET",
                data: '{"ID":"' + ID + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var xmlDoc = $.parseXML(data.d);
                    var xml = $(xmlDoc);
                    var EDITUSERDATA = xml.find("Table");
                    $.each(EDITUSERDATA, function () {
                        $("#modal-header").empty().text("Edit Bank billing details");
                        $('#SaveBtn').empty().html('<span class="glyphicon glyphicon-ok"></span>&nbsp;Update');
                        $("#RecoveryStatementID").val($(this).find("UserID").text());
                        BankDropDown($(this).find("BANK_ID").text());
                        $("#RecoveredAmount").val($(this).find("RECOVERED_AMOUNT").text());
                        $("#BillAmount").val($(this).find("BILL_AMOUNT").text());
                        $("#BillAmountRecovered").val($(this).find("BILL_AMOUNT_RECOVERED").text());
                        $("#BillsDue").val($(this).find("BILLS_DUE").text());
                        $("#Date").datepicker({
                            dateFormat: 'dd/mm/yy',
                            changeMonth: true,
                            changeYear: true,
                            maxDate: new Date()
                        }).datepicker("setDate", new Date($(this).find("BILL_DATE").text()));
                        //if ($(this).find("Active").text().toLowerCase() == "true") {
                        //    $("#Active").prop('checked', true);
                        //}
                        //else {
                        //    $("#Active").prop('checked', false);
                        //}
                    });

                    $(".page-header").css('left', '0');
                    $('#RecoveryStatementModal').modal({ backdrop: 'static', keyboard: false }).on('shown.bs.modal', function () {
                        $(this).find('#BankName').focus();
                    });
                }
            });

        }
        function BankDropDown(BANK, NPAID) {
            $.ajax({
                type: "POST",
                url: "BankVisitDetails.aspx/BANK_DROPDOWN_GET",
                data: {},
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    $("#BankName").empty();
                    var xmlDoc = $.parseXML(data.d);
                    var xml = $(xmlDoc);
                    var BankDropDownT = xml.find("Table");
                    if (BankDropDownT.length > 0) {
                        $("#BankName").append('<option value="-1">-- Select --</option>');
                        $.each(BankDropDownT, function () {
                            $("#BankName").append('<option value="' + $(this).find("ID").text() + '">' + $(this).find("Name").text() + ' - ' + $(this).find("Zone").text() + ' - ' + $(this).find("Branch").text() + ' - ' + $(this).find("CITY_NAME").text() + '</option>');
                        });
                        if (BANK != null) {
                            $("#BankName").val(BANK);
                        }
                        NPADETAILS_GET(NPAID);
                    }
                    else {
                        $("#BankName").append('<option value="-1">-- No Data --</option>');
                    }
                    var config = { '.chosen-select': {} }
                    for (var selector in config) {
                        if (config.hasOwnProperty(selector)) {
                            if (config.hasOwnProperty(selector)) {
                                $(selector).chosen(config[selector]);
                            }
                        }
                    }
                    $("#BankName").trigger("chosen:updated");
                }
            });
        }
        function NPADETAILS_GET(NPAID) {
            $.ajax({
                type: "POST",
                url: "RecoveryStatement.aspx/NPADETAILS_GET_BY_BANKID",
                data: '{"BankID":"' + $("#BankName").val() + '","REF_ID":"' + $("#RecoveryStatementID").val() + '"}',
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
                        $("#NPADetails").append('<option value="-1">-- No Data --</option>');
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

        function RECOVERED_AMOUNT() {
            $.ajax({
                type: "POST",
                url: "RecoveryStatement.aspx/RECOVERED_AMOUNT_GET",
                data: '{"NPAID":"' + $("#NPADetails").val() + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    $("#RecoveredTable").empty();
                    var BillAmount = 0;
                    var ToltalRecovered = 0;
                    var PreRecovered = 0;
                    var xmlDoc = $.parseXML(data.d);
                    var xml = $(xmlDoc);
                    var BankDropDownT = xml.find("Table");
                    if (BankDropDownT.length > 0) {
                        $("#Rangestable").show();
                        $.each(BankDropDownT, function () {
                            $("#RecoveredTable").append("<tr>"
                                                       + "<td>" + $(this).find("BANKRANGETYPE").text() + "</td>"
                                                       + "<td style='text-align:right'>" + $(this).find("TOTALCOMMISSION").text() + "</td>"
                                                       //+ "<td style='text-align:right'>" + $(this).find("PVE_RECOVERYAMOUNT").text() + "</td>"
                                                       + "</tr>");
                            BillAmount += parseFloat($(this).find("TOTALCOMMISSION").text());
                            PreRecovered = parseFloat($(this).find("PVE_RECOVERYAMOUNT").text());
                            //if ($(this).find("RANGE_TYPE").text().toUpperCase() == "NORMAL") {
                            //    $("#NormalRange").empty().append($(this).find("RECOVERYAMOUNT").text());
                            //    $("#NormalPercentage").empty().append(parseFloat($(this).find("PERCENTAGE").text()));
                            //    $("#NormalAmount").empty().append($(this).find("BILL_AMOUNT").text());
                            //    PreRecovered += parseFloat($(this).find("PREVIOUS_BILL_AMOUNT_RECOVERED").text());
                            //    ToltalRecovered += parseFloat($(this).find("RECOVERYAMOUNT").text());
                            //    BillAmount += parseFloat($(this).find("BILL_AMOUNT").text());
                            //}
                            //if ($(this).find("RANGE_TYPE").text().toUpperCase() == "OTS") {
                            //    $("#OTSRange").empty().append($(this).find("RECOVERYAMOUNT").text());
                            //    $("#OTSPercentage").empty().append(parseFloat($(this).find("PERCENTAGE").text()));
                            //    $("#OTSAmount").empty().append($(this).find("BILL_AMOUNT").text());
                            //    PreRecovered += parseFloat($(this).find("PREVIOUS_BILL_AMOUNT_RECOVERED").text());
                            //    ToltalRecovered += parseFloat($(this).find("RECOVERYAMOUNT").text());
                            //    BillAmount += parseFloat($(this).find("BILL_AMOUNT").text());
                            //}
                            //if(parseFloat($(this).find("PERCENTAGE").text()) <= 0){
                            //    alert("Bank Ranges not created on this amount");
                            //}
                        });
                        $("#PreBillAmountRecovered").empty().val(PreRecovered).attr('disabled', true);
                        $("#RecoveredAmount").empty().val(ToltalRecovered).attr('disabled', true);
                        $("#BillAmount").empty().val(BillAmount).attr('disabled', true);
                        $("#BillsDue").val(parseFloat(BillAmount) - parseFloat(PreRecovered)).attr('disabled', true);
                    }
                    else {
                        $("#Rangestable").hide();
                        $("#PreBillAmountRecovered").empty().val(0).attr('disabled', true);
                        $("#RecoveredAmount").empty().val(0).attr('disabled', true);
                        $("#BillAmount").empty().val(0).attr('disabled', true);
                        $("#BillsDue").empty().val(0).attr('disabled', true);
                    }
                }
            });
        }
        function BillAmountRecoveredCalculation() {
            var TDS = $("#TDS").val();
            var Amountlesspaid = $("#Amountlesspaid").val();
            if (TDS == null || TDS == undefined || TDS == "") {
                TDS = 0;
            }
            if (Amountlesspaid == null || Amountlesspaid == undefined || Amountlesspaid == "") {
                Amountlesspaid = 0;
            }
            if ($("#BillAmountRecovered").val() == null || $("#BillAmountRecovered").val() == undefined || $("#BillAmountRecovered").val() == "") {
                $("#BillsDue").val(parseFloat(($("#BillAmount").val()) - (parseFloat($("#PreBillAmountRecovered").val()))) - parseFloat(TDS) - parseFloat(Amountlesspaid));
            }
            else if ((parseFloat($("#BillAmount").val()) - parseFloat($("#PreBillAmountRecovered").val())) < parseFloat($("#BillAmountRecovered").val()) + parseFloat(TDS) + parseFloat(Amountlesspaid)) {
                $("#BillAmountRecovered").val(parseFloat($("#BillAmount").val()) - (parseFloat($("#PreBillAmountRecovered").val()) + parseFloat(TDS) + parseFloat(Amountlesspaid)));
                $("#BillsDue").val(parseFloat(($("#BillAmount").val()) - (parseFloat($("#PreBillAmountRecovered").val()) + parseFloat($("#BillAmountRecovered").val()))) - parseFloat(TDS) - parseFloat(Amountlesspaid));
            }
            else {
                $("#BillsDue").val(parseFloat(($("#BillAmount").val()) - (parseFloat($("#PreBillAmountRecovered").val()) + parseFloat($("#BillAmountRecovered").val()))) - parseFloat(TDS) - parseFloat(Amountlesspaid));
            }
            $('#RecoveryStatementForm').bootstrapValidator('revalidateField', $('#BillAmountRecovered'));
        }
        function BillAmountRecoveredCalculation1() {
            var TDS = $("#TDS").val();
            var Amountlesspaid = $("#Amountlesspaid").val();
            var BillAmountRecovered = $("#BillAmountRecovered").val();
            if (TDS == null || TDS == undefined || TDS == "" || TDS == "0") {
                TDS = 0;
            }
            if (Amountlesspaid == null || Amountlesspaid == undefined || Amountlesspaid == "" || Amountlesspaid == "0") {
                Amountlesspaid = 0;
            }
            if (BillAmountRecovered == null || BillAmountRecovered == undefined || BillAmountRecovered == "") {
                BillAmountRecovered = 0;
            }
            if ($("#Amountlesspaid").val() == null || $("#Amountlesspaid").val() == undefined || $("#Amountlesspaid").val() == "") {
                $("#BillsDue").val(parseFloat(($("#BillAmount").val()) - (parseFloat($("#PreBillAmountRecovered").val()))) - parseFloat(TDS) - parseFloat(Amountlesspaid));
            }
            else if ((parseFloat($("#BillAmount").val()) - parseFloat($("#PreBillAmountRecovered").val())) < parseFloat(BillAmountRecovered) + parseFloat(TDS) + parseFloat(Amountlesspaid)) {
                $("#Amountlesspaid").val(parseFloat($("#BillAmount").val()) - (parseFloat($("#PreBillAmountRecovered").val()) + parseFloat(TDS) + parseFloat(BillAmountRecovered)));
                $("#BillsDue").val(parseFloat(($("#BillAmount").val()) - (parseFloat($("#PreBillAmountRecovered").val()) + parseFloat(parseFloat($("#BillAmount").val()) - (parseFloat($("#PreBillAmountRecovered").val()) + parseFloat(TDS) + parseFloat(BillAmountRecovered))))) - parseFloat(TDS) - parseFloat(BillAmountRecovered));
            }
            else {
                $("#BillsDue").val(parseFloat(($("#BillAmount").val()) - (parseFloat($("#PreBillAmountRecovered").val()) + parseFloat(BillAmountRecovered))) - parseFloat(TDS) - parseFloat(Amountlesspaid));
            }
            $('#RecoveryStatementForm').bootstrapValidator('revalidateField', $('#BillAmountRecovered'));
        }
        function BillAmountRecoveredCalculation2() {
            var TDS = $("#TDS").val();
            var Amountlesspaid = $("#Amountlesspaid").val();
            var BillAmountRecovered = $("#BillAmountRecovered").val();
            if (TDS == null || TDS == undefined || TDS == "") {
                TDS = 0;
            }
            if (Amountlesspaid == null || Amountlesspaid == undefined || Amountlesspaid == "") {
                Amountlesspaid = 0;
            }
            if (BillAmountRecovered == null || BillAmountRecovered == undefined || BillAmountRecovered == "") {
                BillAmountRecovered = 0;
            }
            if ($("#TDS").val() == null || $("#TDS").val() == undefined || $("#TDS").val() == "") {
                $("#BillsDue").val(parseFloat(($("#BillAmount").val()) - (parseFloat($("#PreBillAmountRecovered").val()))) - parseFloat(TDS) - parseFloat(Amountlesspaid));
            }
            else if ((parseFloat($("#BillAmount").val()) - parseFloat($("#PreBillAmountRecovered").val())) < parseFloat(BillAmountRecovered) + parseFloat(TDS) + parseFloat(Amountlesspaid)) {
                $("#TDS").val(parseFloat($("#BillAmount").val()) - (parseFloat($("#PreBillAmountRecovered").val()) + parseFloat(Amountlesspaid) + parseFloat(BillAmountRecovered)));
                $("#BillsDue").val(parseFloat(($("#BillAmount").val()) - (parseFloat($("#PreBillAmountRecovered").val()) + parseFloat(parseFloat($("#BillAmount").val()) - (parseFloat($("#PreBillAmountRecovered").val()) + parseFloat(Amountlesspaid) + parseFloat(BillAmountRecovered))))) - parseFloat(Amountlesspaid) - parseFloat(BillAmountRecovered));
            }
            else {
                $("#BillsDue").val(parseFloat(($("#BillAmount").val()) - (parseFloat($("#PreBillAmountRecovered").val()) + parseFloat(TDS))) - parseFloat(BillAmountRecovered) - parseFloat(Amountlesspaid));
            }
            $('#RecoveryStatementForm').bootstrapValidator('revalidateField', $('#BillAmountRecovered'));
        }

        //function EXECUTIVEDROPDOWN_FOR_REPORT() {
        //    $.ajax({
        //        type: "POST",
        //        url: "BankVisitDetails.aspx/EXECUTIVE_DROPDOEN_GET",
        //        data: {},
        //        contentType: "application/json; charset=utf-8",
        //        dataType: "json",
        //        success: function (data) {
        //            $("#DROP_DOWN_EXECUTIVE_FOR_REPORT").empty();
        //            var xmlDoc = $.parseXML(data.d);
        //            var xml = $(xmlDoc);
        //            var ExecutiveDropDownT = xml.find("Table");
        //            if (ExecutiveDropDownT.length > 0) {
        //                $("#DROP_DOWN_EXECUTIVE_FOR_REPORT").append('<option value="-1">-- ALL --</option>');
        //                $.each(ExecutiveDropDownT, function () {
        //                    $("#DROP_DOWN_EXECUTIVE_FOR_REPORT").append('<option value="' + $(this).find("USERID").text() + '">' + $(this).find("LOGIN").text() + '</option>');
        //                });
        //                NPADROPDOWN_FOR_REPORT();
        //            }
        //            else {
        //                $("#DROP_DOWN_EXECUTIVE_FOR_REPORT").append('<option value="-1">-- No Data --</option>');
        //            }
        //        }
        //    });
        //}


        function ListOfRecord(ID) {
            $.ajax({
                type: "POST",
                url: "RecoveryStatement.aspx/RECOVERY_STATEMENT_BILLS_GET",
                data: '{"ID":"' + ID + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    $("#RECOVERY_STATEMENT_BILLS_BODY").empty();
                    var xmlDoc = $.parseXML(data.d);
                    var xml = $(xmlDoc);
                    var GetEnquiresUserLevel = xml.find("Table");
                    if (GetEnquiresUserLevel.length > 0) {
                        var Rows = "";
                        $.each(GetEnquiresUserLevel, function () {
                            if ($(this).find("SNO").text() != "TOTAL") {
                                Rows += '<tr>' +
                                            '<td style="text-align:center">' + $(this).find("SNO").text() + '</td>' +
                                            '<td style="text-align:right">' + $(this).find("RECOVERED_AMOUNT").text() + '</td>' +
                                            '<td style="text-align:right">' + $(this).find("AMOUNT_LESS_PAID").text() + '</td>' +
                                            '<td style="text-align:right">' + $(this).find("TDS").text() + '</td>' +
                                            '<td style="text-align:right; font-weight:bold">' + $(this).find("TOTAL").text() + '</td>' +
                                            '<td style="text-align:center">' + $(this).find("BILL_DATE").text() + '</td>' +
                                            '</tr>';
                            }
                            else {
                                Rows += '<tr>' +
                                            '<td style="text-align:center; font-weight:bold">' + $(this).find("SNO").text() + '</td>' +
                                            '<td style="text-align:right; font-weight:bold">' + $(this).find("RECOVERED_AMOUNT").text() + '</td>' +
                                            '<td style="text-align:right; font-weight:bold">' + $(this).find("AMOUNT_LESS_PAID").text() + '</td>' +
                                            '<td style="text-align:right; font-weight:bold">' + $(this).find("TDS").text() + '</td>' +
                                            '<td style="text-align:right; font-weight:bold">' + $(this).find("TOTAL").text() + '</td>' +
                                            '<td style="text-align:right; font-weight:bold">' + $(this).find("BILL_DATE").text() + '</td>' +
                                            '</tr>';
                            }
                        });
                        $("#RECOVERY_STATEMENT_BILLS_BODY").append(Rows);
                    }
                    else {
                        $("#RECOVERY_STATEMENT_BILLS_BODY").append('<tr><td colspan="6" style="text-align:center"> No Data To Display</td></tr>');
                    }
                    $('.footable').trigger('footable_initialize');
                    $('#RECOVERY_STATEMENT_BILLS_MODAL').modal();
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
                        NPADROPDOWN_FOR_REPORT();
                    }
                    else {
                        $("#DROP_DOWN_BRANCH_FOR_REPORT").append('<option value="-1">-- ALL --</option>');
                        NPADROPDOWN_FOR_REPORT();
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
                url: "RecoveryStatement.aspx/NPADETAILS_BY_BANK_BRANCH",
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
