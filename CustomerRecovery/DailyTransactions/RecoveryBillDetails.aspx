<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RecoveryBillDetails.aspx.cs" Inherits="DailyTransactions_RecoveryBillDetails" MasterPageFile="~/MasterPage/CRMaster.master" Title="Recovery Bills Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CRMasterHead" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CRMasterBody" runat="server">
<script src="../APPRequires/FooTable/js/footable.js"></script>
<script src="../APPRequires/FooTable/js/footable.filter.js"></script>
<script src="../APPRequires/FooTable/js/footable.sort.js"></script>
<script src="../APPRequires/FooTable/js/footable.paginate.js"></script>
<link href="../APPRequires/FooTable/css/footable.core.css" rel="stylesheet" />
<link href="../APPRequires/FooTable/css/footable.metro.css" rel="stylesheet" />
    <div class="page-header">
        <h3>Recovery details <span class="badge" id="RecoveryDetailsCount"></span></h3>
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
                        <%--<select class="form-control form-control col-xs-4 col-md-4 col-lg-2 input-sm " name="DROP_DOWN_NPA_FOR_REPORT" id="DROP_DOWN_NPA_FOR_REPORT" style="width: 100%"></select>--%>
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
        <input type="button" class="btn btn-primary" value="Bill Generate" style="background-color: #337ab7; border-color: #204d74; color: white" id="Bill_Generate"/>
        <input type="button" class="btn btn-primary" value="Bill Check" style="background-color: #337ab7; border-color: #204d74; color: white" id="Bill_Check"/>
        <table class="footable table  toggle-arrow-circle-filled" id="RECOVERY_BILL_DETAILS_TABLE" data-filter="#Create_Customer_Search" data-page-size="10" data-limit-navigation="1">
            <thead>
                <tr>
                    <th data-sort-ignore="true" style="text-align: center; color: white; display: table-cell; vertical-align: middle; -moz-min-width: 80px; -ms-min-width: 80px; -o-min-width: 80px; -webkit-min-width: 80px; min-width: 80px"><input type="button" class="button circle" style="height: 30px;" value="+" onclick="NewRecord();" title="Add New Record" /></th>
                    <th style="-moz-min-width: 121px; -ms-min-width: 121px; -o-min-width: 121px; -webkit-min-width: 121px; min-width: 121px" data-hide="phone, tablet">Borrower Name</th>
                    <th data-hide="phone" style="-moz-min-width: 133px; -ms-min-width: 133px; -o-min-width: 133px; -webkit-min-width: 133px; min-width: 133px">A/C No.</th>
                    <th data-hide="phone" style="-moz-min-width: 133px; -ms-min-width: 133px; -o-min-width: 133px; -webkit-min-width: 133px; min-width: 133px">Bank</th>
                    <th data-hide="phone" style="-moz-min-width: 133px; -ms-min-width: 133px; -o-min-width: 133px; -webkit-min-width: 133px; min-width: 133px">Branch</th>
                    <th data-hide="phone, tablet" style="-moz-min-width: 94px; -ms-min-width: 94px; -o-min-width: 94px; -webkit-min-width: 94px; min-width: 94px">Loan Amount</th>
                    <th data-hide="phone, tablet" style="-moz-min-width: 94px; -ms-min-width: 94px; -o-min-width: 94px; -webkit-min-width: 94px; min-width: 94px">Recovered Amount</th>
                    <th data-hide="phone, tablet" style="-moz-min-width: 94px; -ms-min-width: 94px; -o-min-width: 94px; -webkit-min-width: 94px; min-width: 94px">Balance Amount</th>
                    <th data-hide="phone, tablet" style="-moz-min-width: 94px; -ms-min-width: 94px; -o-min-width: 94px; -webkit-min-width: 94px; min-width: 94px">Total Commission </th>
                    <th data-hide="phone, tablet" style="-moz-min-width: 94px; -ms-min-width: 94px; -o-min-width: 94px; -webkit-min-width: 94px; min-width: 94px">Status </th>
                    <th data-hide="phone" style="-moz-min-width: 81px; -ms-min-width: 81px; -o-min-width: 81px; -webkit-min-width: 81px; min-width: 81px">Bill Status</th>
                </tr>
            </thead>
            <tbody id="RecoveryBillDetailsData"></tbody>

            <tfoot class="hide-if-no-paging" id="TableFoot"></tfoot>
        </table>

        <form id="RecoveryBillDetailsMAINForm" class="form-horizontal" method="post">
            <div id="AddRecoveryBillModal" class="modal fade bs-example-modal-sm" tabindex="-1" style="top: 15%; overflow: hidden; overflow-y: scroll">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content" style="-ms-border-top-left-radius: 10px; border-top-left-radius: 10px; -ms-border-top-right-radius: 10px; border-top-right-radius: 10px">
                        <div class="modal-header" style="padding: 10px; height: 40px; color: white; background-color: #00a0af; -ms-border-top-left-radius: 5px; border-top-left-radius: 5px; -ms-border-top-right-radius: 5px; border-top-right-radius: 5px">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="margin-top: -9px; -ms-opacity: 10; opacity: 10"><span aria-hidden="true" style="color: #D43F3A">&times;</span></button>
                            <h4 class="modal-title" id="modal-header">New Recovery Bill</h4>
                        </div>
                        <div class="modal-body container-fluid">

                            <input id="RecoveryBillID" name="RecoveryBillID" type="hidden" value="0" />

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

                            <div class="form-group form-group-sm Expences" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right"><span style="color: red">*</span>Bank Range Type </label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <select class="form-control form-control col-xs-4 col-md-4 col-lg-2 input-sm " name="BankRangeType" id="BankRangeType" style="width: 100%" required="required">
                                        <option value="-1" selected="selected">-- Select --</option>
                                        <option value="1">NORMAL</option>
                                        <option value="2">OTS</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group form-group-sm" style="margin-bottom: 0" id="LoanAmountGroup">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right"><span style="color: red">*</span>Loan Amount</label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="text" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2 PasteDisable" onkeypress="return Percentage(event,this);" name="LoanAmount" id="LoanAmount" style="width: 100%" readonly="readonly"/>
                                </div>
                            </div>

                            <div class="form-group form-group-sm" style="margin-bottom: 0" id="PreRecoveredAmtGroup">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right"><span style="color: red">*</span>Previous Recovered Amount</label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="text" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2 PasteDisable" onkeypress="return Percentage(event,this);" onkeyup="CalculateExtraCharges();" onchange="CalculateExtraCharges();" name="PreviuosRecoveredAmount" id="PreviuosRecoveredAmount" style="width: 100%" readonly="readonly"/>
                                </div>
                            </div>

                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right"><span style="color: red">*</span>Recovered Amount</label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="text" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2 PasteDisable" onkeypress="return Percentage(event,this);" onkeyup="CalculateExtraCharges();" onchange="CalculateExtraCharges();" name="RecoveredAmount" id="RecoveredAmount" style="width: 100%" />
                                </div>
                            </div>


                            <div class="form-group form-group-sm" style="margin-bottom: 0" id="BalAmountGroup">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right"><span style="color: red">*</span>Balance Amount</label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="text" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2 PasteDisable" onkeypress="return Percentage(event,this);" onkeyup="CalculateExtraCharges();" onchange="CalculateExtraCharges();" name="BalanceAmount" id="BalanceAmount" style="width: 100%" readonly="readonly"/>
                                </div>
                            </div>
                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right"><span style="color: red">*</span>Recovered Date(<%=DateFormatForDatePicker.ToUpper()%>)</label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="text" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2 PasteDisable" name="RecoveredDate" id="RecoveredDate" style="width: 100%" readonly="readonly"/>
                                </div>
                            </div>

                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right"><span style="color: red">*</span>Recovered Amount Commission(%)</label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="text" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2 PasteDisable" onkeypress="return Percentage(event,this);" onkeyup="CalculateExtraCharges();" onchange="CalculateExtraCharges();" name="RecoveredAmountCommission" id="RecoveredAmountCommission" style="width: 100%" />
                                </div>
                            </div>

                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right">Service Tax(%)</label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="text" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2 PasteDisable" onkeypress="return Percentage(event,this);" onkeyup="CalculateExtraCharges();" onchange="CalculateExtraCharges();" name="ServiceTax" id="ServiceTax" style="width: 100%" />
                                </div>
                            </div>

                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right">Board Charges</label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="text" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2 PasteDisable" onkeypress="return Percentage(event,this);" onkeyup="CalculateExtraCharges();" onchange="CalculateExtraCharges();" name="BoardCharges" id="BoardCharges" style="width: 100%" />
                                </div>

                            </div>
                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right">Transport Charges</label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="text" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2 PasteDisable" onkeypress="return Percentage(event,this);" onkeyup="CalculateExtraCharges();" onchange="CalculateExtraCharges();" name="TransportCharges" id="TransportCharges" style="width: 100%" />
                                </div>

                            </div>
                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right">Valuation Charges</label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="text" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2 PasteDisable" onkeypress="return Percentage(event,this);" onkeyup="CalculateExtraCharges();" onchange="CalculateExtraCharges();" name="ValuationCharges" id="ValuationCharges" style="width: 100%" />
                                </div>

                            </div>
                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right">Surveyor charges</label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="text" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2 PasteDisable" onkeypress="return Percentage(event,this);" onkeyup="CalculateExtraCharges();" onchange="CalculateExtraCharges();" name="Surveyorcharges" id="Surveyorcharges" style="width: 100%" />
                                </div>

                            </div>
                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right">Property Identification charges</label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="text" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2 PasteDisable" onkeypress="return Percentage(event,this);" onkeyup="CalculateExtraCharges();" onchange="CalculateExtraCharges();" name="PropertyIdentificationcharges" id="PropertyIdentificationcharges" style="width: 100%" />
                                </div>

                            </div>
                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right">Investigation Charges</label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="text" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2 PasteDisable" onkeypress="return Percentage(event,this);" onkeyup="CalculateExtraCharges();" onchange="CalculateExtraCharges();" name="InvestigationCharges" id="InvestigationCharges" style="width: 100%" />
                                </div>

                            </div>
                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right">Miscellaneous Charges</label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="text" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2 PasteDisable" onkeypress="return Percentage(event,this);" onkeyup="CalculateExtraCharges();" onchange="CalculateExtraCharges();" name="MiscellaneousCharges" id="MiscellaneousCharges" style="width: 100%" />
                                </div>
                            </div>

                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right"><span style="color: red">*</span>Total Commission</label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="text" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2 PasteDisable" onkeypress="return Percentage(event,this);" name="TotalCommission" id="TotalCommission" style="width: 100%" readonly="readonly"/>
                                </div>
                            </div>

                           <%-- <div class="form-group form-group-sm" style="margin-bottom: 0px">
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

        <form id="EditAuthForm" class="form-horizontal" method="post">
            <div id="EditAuthModal" class="modal fade bs-example-modal-sm" tabindex="-1" style="top: 15% !important; overflow: hidden; overflow-y: scroll">
                <div class="modal-dialog modal-sm">
                    <div class="modal-content" style="-ms-border-top-left-radius: 10px; border-top-left-radius: 10px; -ms-border-top-right-radius: 10px; border-top-right-radius: 10px">
                        <div class="modal-header" style="padding: 10px; height: 40px; color: white; background-color: #00a0af; -ms-border-top-left-radius: 5px; border-top-left-radius: 5px; -ms-border-top-right-radius: 5px; border-top-right-radius: 5px">Authenticate</div>
                        <div class="modal-body container-fluid" style="padding-bottom: 0">
                            <input type="hidden" name="REDID" id="RBDID" value="0" />
                            <div class="row form-group form-group-sm" style="margin-bottom:5px">
                                <div class="col-lg-12">
                                    <input type="text" class="form-control input-sm" id="UserName" name="UserName" style="text-align: center" disabled />
                                </div>
                            </div>
                            <div class="form-group form-group-sm" style="margin-bottom:5px">
                                <div class="col-lg-12" style="padding-bottom: 1%">
                                    <input type="password" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2 PasteDisable" name="UserPass" id="UserPass" style="width: 100%" />
                                </div>
                            </div>
                            <div class="row" style="padding: 0 10px 5px 10px; text-align: center">
                                <div id="LoginError" class="label label-danger">Error</div>
                            </div>
                            <div class="modal-footer" style="padding: 5px">
                                <button type="submit" class="btn btn-default btn-sm" style="margin-top: 2px">&nbsp;Login</button>
                                <button type="button" data-dismiss="modal" class="btn btn-default btn-sm">&nbsp;Close</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        
        <div id="RECOVERYBILLS_LIST_MODAL" class="modal fade bs-example-modal-sm" tabindex="-1" style="top: 15%; overflow: hidden; overflow-y: scroll">
            <div class="modal-dialog modal-lg" style="width: 100%">
                <div class="modal-content" style="-ms-border-top-left-radius: 10px; border-top-left-radius: 10px; -ms-border-top-right-radius: 10px; border-top-right-radius: 10px">
                    <div class="modal-header" style="padding: 10px; height: 40px; color: white; background-color: #00a0af; -ms-border-top-left-radius: 5px; border-top-left-radius: 5px; -ms-border-top-right-radius: 5px; border-top-right-radius: 5px">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="margin-top: -9px; -ms-opacity: 10; opacity: 10"><span aria-hidden="true" style="color: #D43F3A">&times;</span></button>
                            <h4 class="modal-title">Recovery Bill(s) <span class="badge" id="RecoveryDetailsListCount"></span></h4></div>
                    <div class="modal-body container-fluid">
                        <table class="footable table  toggle-arrow-circle-filled" data-page-size="50" id="RECOVERY_BILLS" data-limit-navigation="1">
                            <thead>
                                <tr>
                                    <th style="-moz-min-width: 135px; -ms-min-width: 135px; -o-min-width: 135px; -webkit-min-width: 135px; min-width: 135px; text-align: left">S.No. </th>
                                    <th style="-moz-min-width: 135px; -ms-min-width: 135px; -o-min-width: 135px; -webkit-min-width: 135px; min-width: 135px; text-align: right">Executive Name </th>
                                    <th data-hide="phone" style="-moz-min-width: 110px; -ms-min-width: 110px; -o-min-width: 110px; -webkit-min-width: 110px; min-width: 110px; text-align: right">Bank Range Type</th>
                                    <th data-hide="phone" style="-moz-min-width: 110px; -ms-min-width: 110px; -o-min-width: 110px; -webkit-min-width: 110px; min-width: 110px; text-align: right">Recovered Amount</th>
                                    <th data-hide="phone, tablet" style="-moz-min-width: 94px; -ms-min-width: 94px; -o-min-width: 94px; -webkit-min-width: 94px; min-width: 94px; text-align: center">Commission(%)</th>
                                    <th data-hide="phone, tablet" style="-moz-min-width: 94px; -ms-min-width: 94px; -o-min-width: 94px; -webkit-min-width: 94px; min-width: 94px; text-align: center">Service Tax(%)</th>
                                    <th data-hide="all" style="-moz-min-width: 94px; -ms-min-width: 94px; -o-min-width: 94px; -webkit-min-width: 94px; min-width: 94px; text-align: center">Board Charges</th>
                                    <th data-hide="all" style="-moz-min-width: 94px; -ms-min-width: 94px; -o-min-width: 94px; -webkit-min-width: 94px; min-width: 94px; text-align: center">Transport Charges</th>
                                    <th data-hide="all" style="-moz-min-width: 94px; -ms-min-width: 94px; -o-min-width: 94px; -webkit-min-width: 94px; min-width: 94px; text-align: center">Valuation Charges</th>
                                    <th data-hide="all" style="-moz-min-width: 94px; -ms-min-width: 94px; -o-min-width: 94px; -webkit-min-width: 94px; min-width: 94px; text-align: center">Survey Charges</th>
                                    <th data-hide="all" style="-moz-min-width: 94px; -ms-min-width: 94px; -o-min-width: 94px; -webkit-min-width: 94px; min-width: 94px; text-align: center">Property Identification Charges</th>
                                    <th data-hide="all" style="-moz-min-width: 94px; -ms-min-width: 94px; -o-min-width: 94px; -webkit-min-width: 94px; min-width: 94px; text-align: center">Investigation Charges</th>
                                    <th data-hide="all" style="-moz-min-width: 94px; -ms-min-width: 94px; -o-min-width: 94px; -webkit-min-width: 94px; min-width: 94px; text-align: center">Miscellaneous Charges</th>
                                    <th style="-moz-min-width: 94px; -ms-min-width: 94px; -o-min-width: 94px; -webkit-min-width: 94px; min-width: 94px; text-align: center">Total Commission</th>
                                    <th style="-moz-min-width: 94px; -ms-min-width: 94px; -o-min-width: 94px; -webkit-min-width: 94px; min-width: 94px; text-align: center">Recover Date</th>
                                </tr>
                            </thead>
                            <tbody id="RECOVERYBILLS_LIST_BODY"></tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <form id="BillGenerateForm" class="form-horizontal" method="post">
            <div id="AddBillmodal" class="modal fade bs-example-modal-sm" tabindex="-1" style="top: 15%; overflow: hidden; overflow-y: scroll">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content" style="-ms-border-top-left-radius: 10px; border-top-left-radius: 10px; -ms-border-top-right-radius: 10px; border-top-right-radius: 10px">
                        <div class="modal-header" style="padding: 10px; height: 40px; color: white; background-color: #00a0af; -ms-border-top-left-radius: 5px; border-top-left-radius: 5px; -ms-border-top-right-radius: 5px; border-top-right-radius: 5px">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="margin-top: -9px; -ms-opacity: 10; opacity: 10"><span aria-hidden="true" style="color: #D43F3A">&times;</span></button>
                            <h4 class="modal-title" id="H1">Bill Generate</h4>
                        </div>
                        <div class="modal-body container-fluid">

                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right"><span style="color: red">*</span>Bank Name</label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <select class="form-control form-control col-xs-4 col-md-4 col-lg-2 input-sm" name="BankName" id="BankName" style="width: 100%"></select>
                                </div>
                            </div>

                            <div class="form-group form-group-sm DualListBoxOfNPA" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right"><span style="color: red">*</span>NPA Details</label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <select multiple="multiple" size="10" name="NPADETAILSFORBILL" id="NPADETAILSFORBILL" class="NPADETAILSFORBILL"></select>
                                </div>
                            </div>
                            
                            <div class="form-group form-group-sm DualListBoxOfRB" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right"><span style="color: red">*</span>Recovery Bills</label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <select multiple="multiple" size="10" name="RECOVERY_DETAILS" id="RECOVERY_DETAILS" class="RECOVERY_DETAILS"></select>
                                </div>
                            </div>
                            
                            <%--<div class="form-group form-group-sm " style="margin-bottom: 0px">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right"><span style="color: red">*</span>Date(<%=DateFormatForDatePicker.ToUpper()%>)</label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="text" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2 PasteDisable" name="BillGDate" id="BillGDate" style="width: 100%" readonly="true" />
                                </div>
                            </div>--%>
                        </div>
                        <div class="row" style="padding-left: 20px">
                            Asterisk(<span style="color: Red">*</span>) Fields are Required
                        </div>
                        <div class="modal-footer" style="padding: 5px">
                            <button type="submit" class="btn btn-default Save" style="margin-top: 2px" id="Button1"><span class="glyphicon glyphicon-ok"></span>&nbsp;Save</button>
                            <button type="button" data-dismiss="modal" class="btn btn-default Cancel"><span class="glyphicon glyphicon-remove"></span>&nbsp;Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>

        <form id="BillCheckForm" class="form-horizontal" method="post">
            <div id="AddBillCheckModal" class="modal fade bs-example-modal-sm" tabindex="-1" style="top: 15%; overflow: hidden; overflow-y: scroll">
                <div class="modal-dialog modal-md">
                    <div class="modal-content" style="-ms-border-top-left-radius: 10px; border-top-left-radius: 10px; -ms-border-top-right-radius: 10px; border-top-right-radius: 10px">
                        <div class="modal-header" style="padding: 10px; height: 40px; color: white; background-color: #00a0af; -ms-border-top-left-radius: 5px; border-top-left-radius: 5px; -ms-border-top-right-radius: 5px; border-top-right-radius: 5px">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="margin-top: -9px; -ms-opacity: 10; opacity: 10"><span aria-hidden="true" style="color: #D43F3A">&times;</span></button>
                            <h4 class="modal-title" id="H2">Bill Check</h4>
                        </div>
                        <div class="modal-body container-fluid">

                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-3 control-label" style="font-weight: normal; padding-right: 1%; text-align: right"></label>
                                <div class="col-lg-6">
                                    <div class="input-group input-group-sm">
                                        <input type="text" class="form-control" placeholder="* Serial Number" id="SerialNumber">
                                        <span class="input-group-btn">
                                            <button class="btn btn-primary btn-sm" type="button" onclick="Bill_Check_G()">Check</button>
                                        </span>
                                    </div>
                                    <!-- /input-group -->
                                </div>
                                <!-- /.col-lg-6 -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>

  <%--  <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.3/css/bootstrapValidator.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.3/js/bootstrapValidator.js" type="text/javascript"></script>--%>
    <link href="../APPRequires/CascadingStyleSheet/chosen.css" rel="stylesheet" />
    <script src="../APPRequires/JavaScript/chosen.jquery.js"></script>
    <script>
        jQuery(function () {
            if ('<%= Request.QueryString.AllKeys.Contains("Error")%>' == "True") {
                alert(<%=Request.QueryString["Error"]%>);
                window.location = "RecoveryBillDetails.aspx";
            }
            $('#TableFoot').append(TableFoot(11));
            $('#RECOVERY_BILL_DETAILS_TABLE').footable();
            $('#RECOVERY_BILLS').footable();
            RECOVERYBILLDETAILS_GET();
            $("#RecoveredAmount").keypress(function () {
                if ($("#BankRangeType").val() == "-1") {
                    alert("Please select bank range");
                    $("#BankRangeType").focus();
                }
            });
            $("#RecoveredAmount").focusout(function () {
                $.ajax({
                    type: "POST",
                    url: "RecoveryBillDetails.aspx/BANK_RANGE_PERCENTAGE",
                    data: '{"NPAID":"' + $("#NPADetails").val() + '","RANGETYPE":"' + $("#BankRangeType").val() + '","AMOUNT":"' + $("#RecoveredAmount").val() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        $("#RecoveredAmountCommission").empty();
                        var xmlDoc = $.parseXML(data.d);
                        var xml = $(xmlDoc);
                        var BankDropDownT = xml.find("Table");
                        if (BankDropDownT.length > 0) {
                            $.each(BankDropDownT, function () {
                                if ($("#RecoveryBillID").val() == 0) {
                                    $("#RecoveredAmountCommission").val($(this).find("PERCENTAGE").text()).attr('disabled', true);
                                }
                                else {
                                    $("#RecoveredAmountCommission").val($(this).find("PERCENTAGE").text());
                                }
                            });
                        }
                        else {
                            $("#RecoveredAmountCommission").val("0");
                        }
                        ReCalculation();
                    }
                });
            });
            $("#DROP_DOWN_EXECUTIVE_FOR_REPORT").change(function () {
                NPADROPDOWN_FOR_REPORT();
                RECOVERYBILLDETAILS_GET();
            });
            $("#DROP_DOWN_BANK_FOR_REPORT").change(function () {
                DROP_DOWN_BRANCH_FOR_REPORT();
            });
            $("#DROP_DOWN_BRANCH_FOR_REPORT").change(function () {
                NPADROPDOWN_FOR_REPORT();
            });
            $("#DROP_DOWN_BANK_FOR_REPORT, #DROP_DOWN_BRANCH_FOR_REPORT, #DROP_DOWN_NPA_FOR_REPORT, #TEXT_BOX_FROMDATE_FOR_REPORT, #TEXT_BOX_TODATE_FOR_REPORT").change(function () {
                RECOVERYBILLDETAILS_GET();
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
            $('#AddRecoveryBillModal').on('hidden.bs.modal', function () {
                $("#RecoveryBillID").val(0);
                $("#Active").prop('checked', true);
                $('select').val(-1);
                $('textarea').val("");
                $("#RecoveryBillDetailsMAINForm").bootstrapValidator('resetForm', true);
                $("#Report").val(1);
            });
            $("#NPADetails").change(function () {
                ReCalculation();
            });
            $("#ExecutiveName").change(function () {
                NPADETAILS_GET(null);
            });
            $('input.PasteDisable').on('paste', function () {
                alert("paste not allowed.");
                return false;
            });
            //$("#RecoveredAmount,#RecoveredAmountCommission").keyup(function () {
            //    if (parseFloat($("#RecoveredAmountCommission").val()) > 100) {
            //        $("#RecoveredAmountCommission").val(100);
            //    }
            //    else if ($("#RecoveredAmount").val() != "" && $("#RecoveredAmountCommission").val() != "") {
            //        var RAMOUNT = parseFloat($("#RecoveredAmount").val());
            //        var RCOMMISSION = parseFloat($("#RecoveredAmountCommission").val());
            //        $("#TotalCommission").val((RAMOUNT / 100) * RCOMMISSION);
            //    }
            //    else {
            //        $("#TotalCommission").val(0);
            //    }
            //});
            $("#UserPass").on('focus', function () {
                $("#LoginError").hide();
            });

            $('#AddRecoveryBillModal').on('hidden.bs.modal', function () {
                $("#RecoveryBillDetailsMAINForm").bootstrapValidator('resetForm', true);
            });
            $('#EditAuthModal').on('hidden.bs.modal', function () {
                $("#EditAuthForm").bootstrapValidator('resetForm', true);
            });
            $('#EditAuthForm').bootstrapValidator({
                message: 'This value is not valid',
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                excluded: ':disabled',
                fields: {
                    UserPass: {
                        validators: {
                            notEmpty: {
                                message: 'Please Enter Password'
                            }
                        }
                    }
                }
            }).on('success.form.bv', function (e) {
                e.preventDefault();
                var DataCollection = {};
                DataCollection.UserPass = $("#UserPass").val();
                $.ajax({
                    url: "RecoveryBillDetails.aspx/ATHENTICATE_FOR_RECORD",
                    data: JSON.stringify(DataCollection),
                    type: "POST",
                    async: false,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        if (data.d != "") {
                            $('#EditAuthModal').modal('hide');
                            $("#RecoveryBillDetailsMAINForm").bootstrapValidator('resetForm', true);
                            AuthEditRecord($("#RBDID").val());
                        }
                        else {
                            $("#LoginError").text("Invalid password").show();
                        }
                    }
                });
            });
            $('#RecoveryBillDetailsMAINForm').bootstrapValidator({
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
                                    return (value != -1);
                                }
                            }
                        }
                    },
                    NPADetails: {
                        validators: {
                            callback: {
                                message: 'Please select NPA Details',
                                callback: function (value) {
                                    return (value != -1);
                                }
                            }
                        }
                    },
                    RecoveredAmount: {
                        validators: {
                            notEmpty: {
                                message: 'Please Enter Recovered Amount'
                            },
                            callback: {
                                message: 'Please Enter Valid Amount',
                                callback: function (value) {
                                    return (value >= 0);
                                }
                            }
                        }
                    },
                    BankRangeType: {
                        validators: {
                            callback: {
                                message: 'Please Select Bank Range Type',
                                callback: function (value) {
                                    return (value != -1);
                                }
                            }
                        }
                    },
                    RecoveredAmountCommission: {
                        validators: {
                            notEmpty: {
                                message: 'Please Enter Recovered Amount Commission'
                            }
                        }
                    }
                }
            }).on('success.form.bv', function (e) {
                e.preventDefault();
                var DataCollection = {};
                DataCollection.RecoveryBillID = $("#RecoveryBillID").val();
                DataCollection.ExecutiveName = $("#ExecutiveName").val();
                DataCollection.NPADetails = $("#NPADetails").val();
                DataCollection.RecoveredAmount = $("#RecoveredAmount").val();
                DataCollection.BalanceAmount = $("#BalanceAmount").val();
                DataCollection.RecoveredDate = $("#RecoveredDate").val();
                DataCollection.BankRangeType = $("#BankRangeType").val();
                DataCollection.RecoveredAmountCommission = $("#RecoveredAmountCommission").val();
                DataCollection.ServiceTax = $("#ServiceTax").val();
                DataCollection.TotalCommission = $("#TotalCommission").val();
                DataCollection.BoardCharges = $("#BoardCharges").val();
                DataCollection.TransportCharges = $("#TransportCharges").val();
                DataCollection.ValuationCharges = $("#ValuationCharges").val();
                DataCollection.Surveyorcharges = $("#Surveyorcharges").val();
                DataCollection.PropertyIdentificationcharges = $("#PropertyIdentificationcharges").val();
                DataCollection.InvestigationCharges = $("#InvestigationCharges").val();
                DataCollection.MiscellaneousCharges = $("#MiscellaneousCharges").val();
                DataCollection.Active = "true";//$("#Active").is(':checked');

                $.ajax({
                    url: "RecoveryBillDetails.aspx/RECOVERYBILLDETAILS_INSERT_UPDATE",
                    data: JSON.stringify(DataCollection),
                    type: "POST",
                    async: false,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        if ($("#RecoveryBillID").val() != "0") {
                            $("#AlertMessage").finish().removeClass().addClass('alert alert-success').slideDown(window.InTimeinMicSec).delay(window.DelayTimeInMicSec).slideUp(window.OutTimeInMicSec).children('strong', this).empty().text('Success!').parent().children('span:first', this).empty().html('Succesfully <a href="#" onclick="EditRecord(' + $("#RecoveryBillID").val() + ')">Recovery Bill Details</a> Updated.');
                        }
                        else {
                            $("#AlertMessage").finish().removeClass().addClass('alert alert-success').slideDown(window.InTimeinMicSec).delay(window.DelayTimeInMicSec).slideUp(window.OutTimeInMicSec).children('strong', this).empty().text('Success!').parent().children('span:first', this).empty().html('Succesfully New Recovery Bill Details Saved.');
                        }
                        ListOfRecord($("#NPADetails").val());
                        $('.modal').modal('hide');
                        RECOVERYBILLDETAILS_GET();
                    }
                });
            });

            $('#ExportMethod').click(function () {
                var EXECUTIVE = -1;//$("#DROP_DOWN_EXECUTIVE_FOR_REPORT").val();
                var BANK = $("#DROP_DOWN_BANK_FOR_REPORT").val();
                var BRANCH = $("#DROP_DOWN_BRANCH_FOR_REPORT").val();
                var NPAID = $("#DROP_DOWN_NPA_FOR_REPORT").val();
                var FDATE = $("#TEXT_BOX_FROMDATE_FOR_REPORT").val();
                var TDATE = $("#TEXT_BOX_TODATE_FOR_REPORT").val();
                var URL = window.location + '?ReportType=' + $("#Report").val() + '&EXECUTIVE=' + EXECUTIVE + '&BANK=' + BANK + '&BRANCH=' + BRANCH + '&NPAID=' + NPAID + '&FDATE=' + FDATE + '&TDATE=' + TDATE;
                window.location = URL;
            });
            $.ajaxPrefilter(function (options, originaloptions) {
                if (originaloptions.url != "RecoveryBillDetails.aspx/PREVIOUS_RECOVERED_AMOUNT") {
                    if ($("#RecoveryBillID").val() == 0) {
                        CalculateExtraCharges();
                    }
                }

            });
        });
        function NewRecord() {
            $("#modal-header").empty().text("New Recovery Bill");
            $('#SaveBtn').empty().html('<span class="glyphicon glyphicon-ok"></span>&nbsp;Save');
            ExecutiveDropDown(null, null);
            $("#LoanAmountGroup, #PreRecoveredAmtGroup, #BalAmountGroup").show();
            $("#RecoveredDate").datepicker({
                
                changeMonth: true,
                changeYear: true,
                maxDate: new Date()
            }).datepicker("setDate", new Date());
                $('#RecoveryBillDetailsMAINForm').bootstrapValidator('enableFieldValidators', 'ExecutiveName', true);
                $('#RecoveryBillDetailsMAINForm').bootstrapValidator('enableFieldValidators', 'NPADetails', true);
                $("#Active").attr('checked', true);
                $("#ServiceTax").val("");
                $("#BankRangeType").val(-1);
                $("#ExecutiveName, #NPADetails").prop('disabled', false);
                $('#AddRecoveryBillModal').modal({ backdrop: 'static', keyboard: false }).on('shown.bs.modal', function () {
                    $(this).find('select#ExecutiveName').focus();
                });
            }
            function RECOVERYBILLDETAILS_GET() {
                var DataCollection = {};
                DataCollection.ID = null;
                DataCollection.EXECUTIVE = null;//$("#DROP_DOWN_EXECUTIVE_FOR_REPORT").val();
                DataCollection.BANK = $("#DROP_DOWN_BANK_FOR_REPORT").val();
                DataCollection.BRANCH = $("#DROP_DOWN_BRANCH_FOR_REPORT").val();
                DataCollection.NPAID = $("#DROP_DOWN_NPA_FOR_REPORT").val();
                DataCollection.FDATE = $("#TEXT_BOX_FROMDATE_FOR_REPORT").val();
                DataCollection.TDATE = $("#TEXT_BOX_TODATE_FOR_REPORT").val();
                $.ajax({
                    type: "POST",
                    url: "RecoveryBillDetails.aspx/RECOVERYBILLDETAILS_GET",
                    data: JSON.stringify(DataCollection),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        $("#RecoveryBillDetailsData").empty();
                        var xmlDoc = $.parseXML(data.d);
                        var xml = $(xmlDoc);
                        var GetEnquiresUserLevel = xml.find("Table");
                        if (GetEnquiresUserLevel.length > 0) {
                            $("#RecoveryDetailsCount").empty().text(GetEnquiresUserLevel.length);
                            $('#ReportCollasseButton').show();
                            $.each(GetEnquiresUserLevel, function () {
                                var ListOfRecord = '<a onclick="javascript:ListOfRecord(' + $(this).find("NPAID").text() + ')" style="cursor:pointer;"><span class="glyphicon glyphicon-th-list" style="color:black" title="List Of Records"></span></a>';

                                var RStatus = "";
                                if ($(this).find("RSTATUS").text().toLowerCase() == "close") {
                                    RStatus = '<span class="label label-success LBLACTIVE">CLOSE</span>';
                                }
                                else {
                                    RStatus = '<span class="label label-warning LBLINACTIVE">PENDING</span>';
                                }

                                var Status = "";
                                if ($(this).find("STATUS").text().toLowerCase() == "close") {
                                    Status = '<span class="label label-success LBLACTIVE">CLOSE</span>';
                                }
                                else {
                                    Status = '<span class="label label-warning LBLINACTIVE">PENDING</span>';
                                }
                                $("#RecoveryBillDetailsData").append('<tr>' +
                                                       '<td style="text-align:center">' + ListOfRecord + '</td>' +
                                                       '<td>' + $(this).find("BORROWERNAME").text() + '</td>' +
                                                       '<td>' + $(this).find("LOANACCOUNTNO").text() + '</td>' +
                                                       '<td>' + $(this).find("BANK_NAME").text() + '</td>' +
                                                       '<td>' + $(this).find("BRANCH_NAME").text() + '</td>' +
                                                       '<td style="text-align:right">' + $(this).find("OUTSTANDINGBALANCE").text() + '</td>' +
                                                       '<td style="text-align:right">' + $(this).find("RECOVERYAMOUNT").text() + '</td>' +
                                                       '<td style="text-align:right">' + $(this).find("BALANCEAMOUNT").text() + '</td>' +
                                                       '<td style="text-align:right">' + $(this).find("TOTALCOMMISSION").text() + '</td>' +
                                                       '<td style="text-align:center">' + RStatus + '</td>' +
                                                       '<td style="text-align:center">' + Status + '</td>' +
                                                      '</tr>');

                            });
                        }
                        else {
                            $("#RecoveryDetailsCount").empty().text(0);
                            $("#RecoveryBillDetailsData").append('<tr><td colspan="11" style="text-align:center"> No Data To Display</td></tr>');
                        }
                        $('#RECOVERY_BILL_DETAILS_TABLE').trigger('footable_initialize');
                    }
                });
            }
            function EditRecord(RBDID) {
                $('#RECOVERYBILLS_LIST_MODAL').modal('hide');
                $("#RBDID").empty().val(RBDID);
                $("#EditAuthModal").modal({ backdrop: 'static', keyboard: false }).on('shown.bs.modal', function () {
                    $(this).find('input#UserPass').focus();
                });;
                $("#UserName").val($("#LBL_UserName").text());
                $("#LoginError").hide();
            }
            function AuthEditRecord(RBDID) {
                var DataCollection = {};
                DataCollection.ID = RBDID;
                DataCollection.EXECUTIVE = null;
                DataCollection.BANK = null;
                DataCollection.BRANCH = null;
                DataCollection.NPAID = null;
                DataCollection.FDATE = null;
                DataCollection.TDATE = null;
                $.ajax({
                    type: "POST",
                    url: "RecoveryBillDetails.aspx/EDIT_RECOVERYBILLDETAILS_GET",
                    data: JSON.stringify(DataCollection),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        var xmlDoc = $.parseXML(data.d);
                        var xml = $(xmlDoc);
                        var GetEnquiresUserLevel = xml.find("Table");
                        $.each(GetEnquiresUserLevel, function () {
                            $("#modal-header").empty().text("Edit Recovery Bill");
                            $('#SaveBtn').empty().html('<span class="glyphicon glyphicon-ok"></span>&nbsp;Save');
                            $("#RecoveryBillID").val($(this).find("ID").text());
                            ExecutiveDropDown($(this).find("EXECUTIVEID").text(), $(this).find("NPAID").text());
                            $("#RecoveredAmount").val($(this).find("RECOVERYAMOUNT").text());
                            $("#BalanceAmount").val($(this).find("BALANCEAMOUNT").text());
                            $("#RecoveredDate").datepicker({
                                
                            changeMonth: true,
                            changeYear: true,
                            maxDate: new Date()
                        }).datepicker("setDate", new Date($(this).find("RECOVERDATE").text()));
                        $("#BankRangeType").val($(this).find("BANKRANGETYPE").text());
                        $("#RecoveredAmountCommission").val($(this).find("RECOVERYAMOUNTCOMMISSION").text());
                        $("#BoardCharges").val($(this).find("BOARDCHARGES").text());
                        $("#TransportCharges").val($(this).find("TRANSPORTCHARGES").text());
                        $("#ValuationCharges").val($(this).find("VALUATIONCHARGES").text());
                        $("#Surveyorcharges").val($(this).find("SURVEYORCHARGES").text());
                        $("#PropertyIdentificationcharges").val($(this).find("PROPERTYIDENTIFICATIONCHARGES").text());
                        $("#InvestigationCharges").val($(this).find("INVESTIGATIONCHARGES").text());
                        $("#MiscellaneousCharges").val($(this).find("MISCELLANEOUSCHARGES").text());
                        $("#ServiceTax").val($(this).find("SERVICETAXPER").text());
                        $("#TotalCommission").val($(this).find("TOTALCOMMISSION").text());
                        //if ($(this).find("ACTIVE").text().toLowerCase() == "true") {
                        //    $("#Active").prop('checked', true);
                        //}
                        //else {
                        //    $("#Active").prop('checked', false);
                        //}
                        $('#RecoveryBillDetailsMAINForm').bootstrapValidator('enableFieldValidators', 'ExecutiveName', false);
                        $('#RecoveryBillDetailsMAINForm').bootstrapValidator('enableFieldValidators', 'NPADetails', false);
                        $("#ExecutiveName, #NPADetails").prop('disabled', true);
                        $("#RecoveredAmountCommission").prop('disabled', false);
                        $("#LoanAmountGroup, #PreRecoveredAmtGroup, #BalAmountGroup").hide();
                        //ReCalculation();
                    });
                    $('#AddRecoveryBillModal').modal({ backdrop: 'static', keyboard: false });
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
                        NPADETAILS_GET(NPAID);
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
        function NPADETAILS_GET(NPAID) {
            $.ajax({
                type: "POST",
                url: "RecoveryBillDetails.aspx/NPADETAILS_GET_EXID",
                data: '{"EXID":"' + $("#ExecutiveName").val() + '","REF_ID":"' + $("#RecoveryBillID").val() + '"}',
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
                            $("#NPADetails").append('<option value="' + $(this).find("ID").text() + '">' + $(this).find("LoanAccountNo").text() + '</option>');
                        });
                        if (NPAID != null) {
                            $("#NPADetails").val(NPAID);
                        }
                    }
                    else {
                        if ($("#ExecutiveName").val() == "-1") {
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
                    if ($("#RecoveryBillID").val() == 0) {
                        ReCalculation();
                    }
                }
            });
        }
        function ReCalculation() {
            $.ajax({
                type: "POST",
                url: "RecoveryBillDetails.aspx/PREVIOUS_RECOVERED_AMOUNT",
                data: '{"ID":"' + $("#NPADetails").val() + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                asyn: false,
                success: function (data) {
                    var xmlDoc = $.parseXML(data.d);
                    var xml = $(xmlDoc);
                    var GetEnquiresUserLevel = xml.find("Table");
                    if (GetEnquiresUserLevel.length > 0) {
                        $.each(GetEnquiresUserLevel, function () {
                            $("#LoanAmount").empty().val($(this).find("OUTSTANDINGBALANCE").text()).attr('disabled', true);
                            $("#PreviuosRecoveredAmount").empty().val($(this).find("RECOVERYAMOUNT").text()).attr('disabled', true);
                            if ($("#RecoveredAmountCommission").val() == "" || $("#RecoveredAmountCommission").val() == undefined || $("#RecoveredAmountCommission").val() == "0" || $("#RecoveredAmountCommission").val() == null) {
                                $("#BalanceAmount").empty().val($(this).find("BALANCEAMOUNT").text()).attr('disabled', true);
                            }
                        });
                    }
                    else {
                        $("#LoanAmount").empty().val('0.00').attr('disabled', true);
                        $("#PreviuosRecoveredAmount").empty().val('0.00').attr('disabled', true);
                        $("#BalanceAmount").empty().val("0.00").attr('disabled', true);
                    }
                    CalculateExtraCharges();
                }
            });
        }
        function EditReCalculation(NPAID, RECOVERYAMOUNT) {
            $.ajax({
                type: "POST",
                url: "RecoveryBillDetails.aspx/PREVIOUS_RECOVERED_AMOUNT",
                data: '{"ID":"' + NPAID + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                asyn: false,
                success: function (data) {
                    var xmlDoc = $.parseXML(data.d);
                    var xml = $(xmlDoc);
                    var GetEnquiresUserLevel = xml.find("Table");
                    if (GetEnquiresUserLevel.length > 0) {
                        $.each(GetEnquiresUserLevel, function () {
                            $("#LoanAmount").empty().val($(this).find("OUTSTANDINGBALANCE").text()).attr('disabled', true);
                            $("#PreviuosRecoveredAmount").empty().val(parseFloat($(this).find("RECOVERYAMOUNT").text()) - parseFloat(RECOVERYAMOUNT)).attr('disabled', true);
                            if ($("#RecoveredAmountCommission").val() == "" || $("#RecoveredAmountCommission").val() == undefined || $("#RecoveredAmountCommission").val() == "0" || $("#RecoveredAmountCommission").val() == null) {
                                $("#BalanceAmount").empty().val(parseFloat((this).find("BALANCEAMOUNT").text()) - parseFloat(RECOVERYAMOUNT)).attr('disabled', true);
                            }
                        });
                    }
                    else {
                        $("#LoanAmount").empty().val('0.00').attr('disabled', true);
                        $("#PreviuosRecoveredAmount").empty().val('0.00').attr('disabled', true);
                        $("#BalanceAmount").empty().val("0.00").attr('disabled', true);
                    }
                },
                error: function () {
                    debugger;
                },
                failure: function () {
                    debugger;
                }
            });
        }
        function BillReportLetter(ID) {
            var URL = window.location + '?RecoveryBillID=' + ID;
            window.location = URL;
        }
        function CalculateExtraCharges() {
            var RecoveredAmount;
            var ServiceTax;
            var BoardCharges;
            var TransportCharges;
            var ValuationCharges;
            var Surveyorcharges;
            var PropertyIdentificationcharges;
            var InvestigationCharges;
            var MiscellaneousCharges;
            var RAMOUNT;
            var RCOMMISSION;
            if ($("#RecoveryBillID").val() == 0) {
                var LoanAmount = $("#LoanAmount").val();
                var PreviuosRecoveredAmount = $("#PreviuosRecoveredAmount").val();
                RecoveredAmount = $("#RecoveredAmount").val();
                if (LoanAmount == "" || LoanAmount == null || LoanAmount == undefined) {
                    LoanAmount = parseInt(0);
                }
                if (PreviuosRecoveredAmount == "" || PreviuosRecoveredAmount == null || PreviuosRecoveredAmount == undefined) {
                    PreviuosRecoveredAmount = parseInt(0);
                }
                if (RecoveredAmount == "" || RecoveredAmount == null || RecoveredAmount == undefined) {
                    RecoveredAmount = parseInt(0);
                }
                if (parseInt(LoanAmount) <= (parseInt(PreviuosRecoveredAmount) + parseInt(RecoveredAmount)) && parseInt(LoanAmount) >= 0) {
                    $("#RecoveredAmount").val(parseInt(LoanAmount) - parseInt(PreviuosRecoveredAmount));
                    $("#BalanceAmount").empty().val((parseInt(LoanAmount) - parseInt(PreviuosRecoveredAmount)) - parseInt($("#RecoveredAmount").val()));
                }
                else {
                    $("#BalanceAmount").empty().val((parseInt(LoanAmount) - parseInt(PreviuosRecoveredAmount)) - parseInt(RecoveredAmount));
                }
                ServiceTax = $("#ServiceTax").val();
                BoardCharges = $("#BoardCharges").val();
                TransportCharges = $("#TransportCharges").val();
                ValuationCharges = $("#ValuationCharges").val();
                Surveyorcharges = $("#Surveyorcharges").val();
                PropertyIdentificationcharges = $("#PropertyIdentificationcharges").val();
                InvestigationCharges = $("#InvestigationCharges").val();
                MiscellaneousCharges = $("#MiscellaneousCharges").val();
                if ($("#ServiceTax").val() == "" || $("#ServiceTax").val() == null || $("#ServiceTax").val() == undefined) {
                    ServiceTax = parseFloat(0);
                }
                if ($("#BoardCharges").val() == "" || $("#BoardCharges").val() == null || $("#BoardCharges").val() == undefined) {
                    BoardCharges = parseFloat(0);
                }
                if ($("#TransportCharges").val() == "" || $("#TransportCharges").val() == null || $("#TransportCharges").val() == undefined) {
                    TransportCharges = parseFloat(0);
                }
                if ($("#ValuationCharges").val() == "" || $("#ValuationCharges").val() == null || $("#ValuationCharges").val() == undefined) {
                    ValuationCharges = parseFloat(0);
                }
                if ($("#Surveyorcharges").val() == "" || $("#Surveyorcharges").val() == null || $("#Surveyorcharges").val() == undefined) {
                    Surveyorcharges = parseFloat(0);
                }
                if ($("#PropertyIdentificationcharges").val() == "" || $("#PropertyIdentificationcharges").val() == null || $("#PropertyIdentificationcharges").val() == undefined) {
                    PropertyIdentificationcharges = parseFloat(0);
                }
                if ($("#InvestigationCharges").val() == "" || $("#InvestigationCharges").val() == null || $("#InvestigationCharges").val() == undefined) {
                    InvestigationCharges = parseFloat(0);
                }
                if ($("#MiscellaneousCharges").val() == "" || $("#MiscellaneousCharges").val() == null || $("#MiscellaneousCharges").val() == undefined) {
                    MiscellaneousCharges = parseFloat(0);
                }
                RAMOUNT = 0;
                RCOMMISSION = 0;
                if (parseFloat($("#RecoveredAmountCommission").val()) > 100) {
                    $("#RecoveredAmountCommission").val(100);
                }
                else if ($("#RecoveredAmount").val() != "" && $("#RecoveredAmountCommission").val() != "") {
                    RAMOUNT = parseFloat($("#RecoveredAmount").val());
                    RCOMMISSION = parseFloat($("#RecoveredAmountCommission").val());
                }

                if (parseFloat(ServiceTax) > 100) {
                    $("#ServiceTax").val(100);
                }
                $("#TotalCommission").val(((parseFloat(RAMOUNT) / parseFloat(100)) * parseFloat(RCOMMISSION)) + (((parseFloat(RAMOUNT) / parseFloat(100)) * parseFloat(RCOMMISSION)) / 100 * ServiceTax) + parseFloat(BoardCharges) + parseFloat(TransportCharges) + parseFloat(ValuationCharges) + parseFloat(Surveyorcharges) + parseFloat(PropertyIdentificationcharges) + parseFloat(InvestigationCharges) + parseFloat(MiscellaneousCharges));
            }
            else {
                RecoveredAmount = $("#RecoveredAmount").val();
                if (RecoveredAmount == "" || RecoveredAmount == null || RecoveredAmount == undefined) {
                    RecoveredAmount = parseInt(0);
                }
                ServiceTax = $("#ServiceTax").val();
                BoardCharges = $("#BoardCharges").val();
                TransportCharges = $("#TransportCharges").val();
                ValuationCharges = $("#ValuationCharges").val();
                Surveyorcharges = $("#Surveyorcharges").val();
                PropertyIdentificationcharges = $("#PropertyIdentificationcharges").val();
                InvestigationCharges = $("#InvestigationCharges").val();
                MiscellaneousCharges = $("#MiscellaneousCharges").val();
                if ($("#ServiceTax").val() == "" || $("#ServiceTax").val() == null || $("#ServiceTax").val() == undefined) {
                    ServiceTax = parseFloat(0);
                }
                if ($("#BoardCharges").val() == "" || $("#BoardCharges").val() == null || $("#BoardCharges").val() == undefined) {
                    BoardCharges = parseFloat(0);
                }
                if ($("#TransportCharges").val() == "" || $("#TransportCharges").val() == null || $("#TransportCharges").val() == undefined) {
                    TransportCharges = parseFloat(0);
                }
                if ($("#ValuationCharges").val() == "" || $("#ValuationCharges").val() == null || $("#ValuationCharges").val() == undefined) {
                    ValuationCharges = parseFloat(0);
                }
                if ($("#Surveyorcharges").val() == "" || $("#Surveyorcharges").val() == null || $("#Surveyorcharges").val() == undefined) {
                    Surveyorcharges = parseFloat(0);
                }
                if ($("#PropertyIdentificationcharges").val() == "" || $("#PropertyIdentificationcharges").val() == null || $("#PropertyIdentificationcharges").val() == undefined) {
                    PropertyIdentificationcharges = parseFloat(0);
                }
                if ($("#InvestigationCharges").val() == "" || $("#InvestigationCharges").val() == null || $("#InvestigationCharges").val() == undefined) {
                    InvestigationCharges = parseFloat(0);
                }
                if ($("#MiscellaneousCharges").val() == "" || $("#MiscellaneousCharges").val() == null || $("#MiscellaneousCharges").val() == undefined) {
                    MiscellaneousCharges = parseFloat(0);
                }
                RAMOUNT = 0;
                RCOMMISSION = 0;
                if (parseFloat($("#RecoveredAmountCommission").val()) > 100) {
                    $("#RecoveredAmountCommission").val(100);
                }
                else if ($("#RecoveredAmount").val() != "" && $("#RecoveredAmountCommission").val() != "") {
                    RAMOUNT = parseFloat($("#RecoveredAmount").val());
                    RCOMMISSION = parseFloat($("#RecoveredAmountCommission").val());
                }

                if (parseFloat(ServiceTax) > 100) {
                    $("#ServiceTax").val(100);
                }
                $("#TotalCommission").val(((parseFloat(RAMOUNT) / parseFloat(100)) * parseFloat(RCOMMISSION)) + (((parseFloat(RAMOUNT) / parseFloat(100)) * parseFloat(RCOMMISSION)) / 100 * ServiceTax) + parseFloat(BoardCharges) + parseFloat(TransportCharges) + parseFloat(ValuationCharges) + parseFloat(Surveyorcharges) + parseFloat(PropertyIdentificationcharges) + parseFloat(InvestigationCharges) + parseFloat(MiscellaneousCharges));

            }
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
                        NPADROPDOWN_FOR_REPORT();
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
        function ListOfRecord(NPAID) {
            $.ajax({
                type: "POST",
                url: "RecoveryBillDetails.aspx/RECOVERYBILLS_LIST_GET",
                data: '{"NPAID":"' + NPAID + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    $("#RECOVERYBILLS_LIST_BODY").empty();
                    var xmlDoc = $.parseXML(data.d);
                    var xml = $(xmlDoc);
                    var GetEnquiresUserLevel = xml.find("Table");
                    if (GetEnquiresUserLevel.length > 0) {
                        var Rows = "";
                        $.each(GetEnquiresUserLevel, function () {
                            $("#RecoveryDetailsListCount").empty().text(GetEnquiresUserLevel.length - 1);
                            if ($(this).find("BANKRANGETYPE").text() != "TOTAL") {
                                Rows += '<tr>' +
                                            '<td style="text-align:left; text-decoration:underline; cursor:pointer; color:blue" onclick="EditRecord(' + $(this).find("ID").text() + ')">' + $(this).find("SNO").text() + '</td>' +
                                            '<td style="text-align:left">' + $(this).find("EXECUTIVE_NAME").text() + '</td>' +
                                            '<td style="text-align:left">' + $(this).find("BANKRANGETYPE").text() + '</td>' +
                                            '<td style="text-align:right">' + $(this).find("RECOVERYAMOUNT").text() + '</td>' +
                                            '<td style="text-align:right">' + $(this).find("RECOVERYAMOUNTCOMMISSION").text() + '</td>' +
                                            '<td style="text-align:right">' + $(this).find("SERVICETAXPER").text() + '</td>' +
                                            '<td style="text-align:right">' + $(this).find("BOARDCHARGES").text() + '</td>' +
                                            '<td style="text-align:right">' + $(this).find("TRANSPORTCHARGES").text() + '</td>' +
                                            '<td style="text-align:right">' + $(this).find("VALUATIONCHARGES").text() + '</td>' +
                                            '<td style="text-align:right">' + $(this).find("SURVEYORCHARGES").text() + '</td>' +
                                            '<td style="text-align:right">' + $(this).find("PROPERTYIDENTIFICATIONCHARGES").text() + '</td>' +
                                            '<td style="text-align:right">' + $(this).find("INVESTIGATIONCHARGES").text() + '</td>' +
                                            '<td style="text-align:right">' + $(this).find("MISCELLANEOUSCHARGES").text() + '</td>' +
                                            '<td style="text-align:right">' + $(this).find("TOTALCOMMISSION").text() + '</td>' +
                                            '<td style="text-align:left">' + $(this).find("RECOVERDATE").text() + '</td>' +
                                            '</tr>';
                            }
                            else {
                                Rows += '<tr>' +
                                            '<td style="text-align:center"></td>' +
                                            '<td style="text-align:left"></td>' +
                                            '<td style="text-align:left"></td>' +
                                            '<td style="text-align:right; font-weight:bold">' + $(this).find("RECOVERYAMOUNT").text() + '</td>' +
                                            '<td style="text-align:right; font-weight:bold">' + $(this).find("RECOVERYAMOUNTCOMMISSION").text() + '</td>' +
                                            '<td style="text-align:right; font-weight:bold">' + $(this).find("SERVICETAXPER").text() + '</td>' +
                                            '<td style="text-align:right; font-weight:bold">' + $(this).find("BOARDCHARGES").text() + '</td>' +
                                            '<td style="text-align:right; font-weight:bold">' + $(this).find("TRANSPORTCHARGES").text() + '</td>' +
                                            '<td style="text-align:right; font-weight:bold">' + $(this).find("VALUATIONCHARGES").text() + '</td>' +
                                            '<td style="text-align:right; font-weight:bold">' + $(this).find("SURVEYORCHARGES").text() + '</td>' +
                                            '<td style="text-align:right; font-weight:bold">' + $(this).find("PROPERTYIDENTIFICATIONCHARGES").text() + '</td>' +
                                            '<td style="text-align:right; font-weight:bold">' + $(this).find("INVESTIGATIONCHARGES").text() + '</td>' +
                                            '<td style="text-align:right; font-weight:bold">' + $(this).find("MISCELLANEOUSCHARGES").text() + '</td>' +
                                            '<td style="text-align:right; font-weight:bold">' + $(this).find("TOTALCOMMISSION").text() + '</td>' +
                                            '<td style="text-align:center; font-weight:bold">' + $(this).find("RECOVERDATE").text() + '</td>' +
                                            '</tr>';
                            }
                        });
                        $("#RECOVERYBILLS_LIST_BODY").append(Rows);
                    }
                    else {
                        $("#RECOVERYBILLS_LIST_BODY").append('<tr><td colspan="15" style="text-align:center"> No Data To Display</td></tr>');
                        $("#RecoveryDetailsListCount").empty().text(0);
                    }
                    $('#RECOVERY_BILLS').trigger('footable_initialize');
                    $('#RECOVERYBILLS_LIST_MODAL').modal();
                }
            });
        }
    </script>
    <link href="../APPRequires/CascadingStyleSheet/bootstrap-duallistbox.css" rel="stylesheet" />
    <script src="../APPRequires/JavaScript/jquery.bootstrap-duallistbox.js"></script>
    <script>
        var NPA_DETAILS;
        var RECOVERY_DETAILS;
        $(document).ready(function () {

            $('#AddBillmodal').on('hidden.bs.modal', function () {
                $("#BillGenerateForm").bootstrapValidator('resetForm', true);
                $('select').val(-1);
            });
            $('#BillGenerateForm').bootstrapValidator({
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
                                message: 'Please select Bank',
                                callback: function (value) {
                                    if (value == -1) {
                                        $(".DualListBoxOfNPA, .DualListBoxOfRB").hide();
                                        NPA_DETAILS.bootstrapDualListbox('refresh', true);
                                        RECOVERY_DETAILS.bootstrapDualListbox('refresh', true);
                                        return false;
                                    }
                                    else {
                                        $(".DualListBoxOfRB").hide();
                                        $(".DualListBoxOfNPA").show();
                                        NPA_DETAILS.bootstrapDualListbox('refresh', true);
                                        RECOVERY_DETAILS.bootstrapDualListbox('refresh', true);
                                        return true;
                                    }
                                }
                            }
                        }
                    }
                }
            }).on('success.form.bv', function (e) {
                e.preventDefault();
                var DataCollection = {};
                DataCollection.BankName = $("#BankName").val();
                var NPAIDS = [];
                $('#bootstrap-duallistbox-selected-list_NPADETAILSFORBILL option').each(function () {
                    NPAIDS.push($(this).val());
                });
                DataCollection.NPAIDS = NPAIDS;

                var RBIDS = [];
                $('#bootstrap-duallistbox-selected-list_RECOVERY_DETAILS option').each(function () {
                    RBIDS.push($(this).val());
                });
                DataCollection.RBIDS = RBIDS;
                if (NPAIDS != "" && RBIDS != "") {
                    if (confirm("Are you sure, Do you want to generate bill?")) {
                        $.ajax({
                            url: "RecoveryBillDetails.aspx/SERIALNUMBER_INSERT",
                            data: '{"RBIDS":"' + RBIDS + '"}',
                            type: "POST",
                            async: false,
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (data) {
                                var s = data.d;
                                if (s.indexOf("SN_") > -1) {
                                    BillReportLetter((data.d).replace("SN_", ""));
                                    $('#AddBillmodal').modal('hide');
                                    $("#BillGenerateForm").bootstrapValidator('resetForm', true);
                                }
                                else {
                                    alert(data.d);
                                }
                            }
                        });
                    }
                    else {
                        $('#BillGenerateForm').bootstrapValidator('revalidateField', $('#BankName'));
                        $("#NPADETAILSFORBILL").trigger('change');
                    }
                }
                else {
                    if (NPAIDS == "") {
                        alert('Please select atleast one NPA and Recovery Bill');
                    }
                    else {
                        alert('Please select atleast one Recovery Bill');
                    }
                    $('#BillGenerateForm').bootstrapValidator('revalidateField', $('#BankName'));
                    $("#NPADETAILSFORBILL").trigger('change');
                }
            });

            NPA_DETAILS = $('#NPADETAILSFORBILL').bootstrapDualListbox({
                nonSelectedListLabel: 'Non-selected NPA(s)',
                selectedListLabel: 'Selected NPA(s)',
                preserveSelectionOnMove: 'moved',
                moveOnSelect: true
                //nonSelectedFilter: 'ion ([7-9]|[1][0-2])'
            });
            RECOVERY_DETAILS = $('#RECOVERY_DETAILS').bootstrapDualListbox({
                nonSelectedListLabel: 'Non-selected Recovery Bill(s)',
                selectedListLabel: 'Selected Recovery Bill(s)',
                preserveSelectionOnMove: 'moved',
                moveOnSelect: true
                //nonSelectedFilter: 'ion ([7-9]|[1][0-2])'
            });
            $("#Bill_Generate").click(function () {
                $(".DualListBoxOfNPA, .DualListBoxOfRB").hide();
                $("#BillGDate").datepicker({
                    
                    changeMonth: true,
                    changeYear: true
                    //onClose: function (selectedDate) {
                    //    $("#TEXT_BOX_FROMDATE_FOR_REPORT").datepicker("option", "minDate", selectedDate);
                    //}
                }).datepicker("setDate", new Date());
                BankDropDownForBill(null);
                $('#AddBillmodal').modal({ backdrop: 'static', keyboard: false }).on('shown.bs.modal', function () {
                    $(this).find('select#BankName').focus();
                });
            });
            $("#Bill_Check").click(function () {
                $('#AddBillCheckModal').modal({ backdrop: 'static', keyboard: false }).on('shown.bs.modal', function () {
                    $('#SerialNumber').val("");
                    $(this).find('input#SerialNumber').focus();
                });
            });
            $("#BankName").change(function () {
                NPADETAILS_GET_SN(null);
            });
            $("#NPADETAILSFORBILL").change(function () {
                var optionValues = [];
                $('#bootstrap-duallistbox-selected-list_NPADETAILSFORBILL option').each(function () {
                    optionValues.push($(this).val());
                });
                $.ajax({
                    type: "POST",
                    url: "RecoveryBillDetails.aspx/RECOVERY_BILLS_FOR_SN",
                    data: '{"IDS":"' + optionValues + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        $("#RECOVERY_DETAILS").empty();
                        var xmlDoc = $.parseXML(data.d);
                        var xml = $(xmlDoc);
                        var BankDropDownT = xml.find("Table");
                        if (BankDropDownT.length > 0) {
                            $(".DualListBoxOfRB").show();
                            $.each(BankDropDownT, function () {
                                $("#RECOVERY_DETAILS").append('<option value="' + $(this).find("ID").text() + '">' + $(this).find("LOAN_ACCOUNT").text() + ' - ' + $(this).find("RECOVERYAMOUNT").text() + '</option>');
                            });
                            RECOVERY_DETAILS.bootstrapDualListbox('refresh', true);
                        }
                        else {
                            $(".DualListBoxOfRB").hide();
                            RECOVERY_DETAILS.bootstrapDualListbox('refresh', true);
                        }
                    }
                });
            });
        });

            function BankDropDownForBill(BANK) {
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
                                $("#BankName").append('<option value="' + $(this).find("ID").text() + '">' + $(this).find("Name").text() + ' - ' + $(this).find("Zone").text() + ' - ' + $(this).find("Branch").text() + '</option>');
                            });
                            if (BANK != null) {
                                $("#BankName").val(BANK);
                            }
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
            function NPADETAILS_GET_SN(NPAID) {
                $.ajax({
                    type: "POST",
                    url: "RecoveryBillDetails.aspx/NPADETAILS_FOR_SN",
                    data: '{"BankID":"' + $("#BankName").val() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        $("#NPADETAILSFORBILL").empty();
                        var xmlDoc = $.parseXML(data.d);
                        var xml = $(xmlDoc);
                        var BankDropDownT = xml.find("Table");
                        if (BankDropDownT.length > 0) {
                            $.each(BankDropDownT, function () {
                                $("#NPADETAILSFORBILL").append('<option value="' + $(this).find("ID").text() + '">' + $(this).find("LOANACCOUNTNO").text() + '</option>');
                            });

                            if (NPAID != null) {
                                $("#NPADETAILSFORBILL").val(NPAID);
                            }
                            NPA_DETAILS.bootstrapDualListbox('refresh', true);
                        }
                        else {
                            NPA_DETAILS.bootstrapDualListbox('refresh', true);
                        }
                        var config = { '.chosen-select': {} }
                        for (var selector in config) {
                            if (config.hasOwnProperty(selector)) {
                                if (config.hasOwnProperty(selector)) {
                                    $(selector).chosen(config[selector]);
                                }
                            }
                        }
                        $("#NPADETAILSFORBILL").trigger("chosen:updated");
                    }
                });
            }
            function Bill_Check_G() {
                if ($("#SerialNumber").val().length > 0) {
                    BillReportLetter($("#SerialNumber").val());
                }
                else {
                    alert("Please enter serial number.");
                }
            }
    </script>
</asp:Content>
