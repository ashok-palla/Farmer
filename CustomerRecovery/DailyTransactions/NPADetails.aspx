<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NPADetails.aspx.cs" Inherits="DailyTransactions.DailyTransactions_NPADetails" MasterPageFile="~/MasterPage/CRMaster.master" Title="NPA Details" %>

<asp:Content ContentPlaceHolderID="CRMasterHead" runat="server"></asp:Content>
<asp:Content ContentPlaceHolderID="CRMasterBody" runat="server">
<script src="../APPRequires/FooTable/js/footable.js"></script>
<script src="../APPRequires/FooTable/js/footable.filter.js"></script>
<script src="../APPRequires/FooTable/js/footable.sort.js"></script>
<script src="../APPRequires/FooTable/js/footable.paginate.js"></script>
<link href="../APPRequires/FooTable/css/footable.core.css" rel="stylesheet" />
<link href="../APPRequires/FooTable/css/footable.metro.css" rel="stylesheet" />
    <div class="page-header">
        <h3>NPA Details <span class="badge" id="NPACount"></span></h3>
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
                    <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; padding-top: 5px; text-align: right">City </label>
                    <div class="col-lg-6" style="padding-bottom: 1%">
                        <select class="form-control form-control col-xs-4 col-md-4 col-lg-2 input-sm " name="DROP_DOWN_CITY_FOR_REPORT" id="DROP_DOWN_CITY_FOR_REPORT" style="width: 100%"></select>
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
        <table class="footable table  toggle-arrow-circle-filled" id="CreateCustomerTable" data-filter="#Create_Customer_Search" data-page-size="50" data-limit-navigation="3">
            <thead>
                <tr>
                    <th data-sort-ignore="true" style="text-align: center; color: white; display: table-cell; vertical-align: middle; -moz-min-width: 92px; -ms-min-width: 92px; -o-min-width: 92px; -webkit-min-width: 92px; min-width: 92px">
                        <input type="button" class="button circle" style="height: 30px;" value="+" onclick="NewRecord();" title="Add NPA Details" /></th>
                    <th style="-moz-min-width: 121px; -ms-min-width: 121px; -o-min-width: 121px; -webkit-min-width: 121px; min-width: 121px" data-hide="phone, tablet">Allotted Executive</th>
                    <th data-hide="phone" style="-moz-min-width: 133px; -ms-min-width: 133px; -o-min-width: 133px; -webkit-min-width: 133px; min-width: 133px">Loan A/C No.</th>
                    <th style="-moz-min-width: 121px; -ms-min-width: 121px; -o-min-width: 121px; -webkit-min-width: 121px; min-width: 121px" data-hide="phone, tablet">Bank Name</th>
                    <th style="-moz-min-width: 121px; -ms-min-width: 121px; -o-min-width: 121px; -webkit-min-width: 121px; min-width: 121px" data-hide="phone, tablet">Branch</th>
                    <th style="-moz-min-width: 121px; -ms-min-width: 121px; -o-min-width: 121px; -webkit-min-width: 121px; min-width: 121px" data-hide="phone, tablet">City</th>
                    <%--<th data-hide="all" style="min-width: 133px">Branch Name</th>--%>
                    <th style="-moz-min-width: 94px; -ms-min-width: 94px; -o-min-width: 94px; -webkit-min-width: 94px; min-width: 94px">Borrower Name</th>
                    <th style="-moz-min-width: 94px; -ms-min-width: 94px; -o-min-width: 94px; -webkit-min-width: 94px; min-width: 94px" data-hide="all">NPA Date(MM/DD/YYYY)</th>
                    <th data-hide="all" style="-moz-min-width: 94px; -ms-min-width: 94px; -o-min-width: 94px; -webkit-min-width: 94px; min-width: 94px">Borrower Address</th>
                    <th style="-moz-min-width: 94px; -ms-min-width: 94px; -o-min-width: 94px; -webkit-min-width: 94px; min-width: 94px">Contact No.</th>
                    <th data-hide="all" style="-moz-min-width: 94px; -ms-min-width: 94px; -o-min-width: 94px; -webkit-min-width: 94px; min-width: 94px">Co Applicant</th>
                    <th data-hide="all" style="-moz-min-width: 94px; -ms-min-width: 94px; -o-min-width: 94px; -webkit-min-width: 94px; min-width: 94px">Guarantor</th>
                    <th data-hide="all" style="-moz-min-width: 94px; -ms-min-width: 94px; -o-min-width: 94px; -webkit-min-width: 94px; min-width: 94px">Guarantor Cell no</th>
                    <th data-hide="all" style="-moz-min-width: 94px; -ms-min-width: 94px; -o-min-width: 94px; -webkit-min-width: 94px; min-width: 94px">Guarantor Address</th>
                    <%--<th data-hide="all" style="min-width: 94px">Guaranty 2</th>
                    <th data-hide="all" style="min-width: 94px">Guaranty Cell no</th>
                    <th data-hide="all" style="min-width: 94px">Guaranty2 Address</th>--%>
                    <th data-hide="all" style="-moz-min-width: 94px; -ms-min-width: 94px; -o-min-width: 94px; -webkit-min-width: 94px; min-width: 94px">Date of Sanction(MM/DD/YYYY)</th>
                    <th data-hide="all" style="-moz-min-width: 94px; -ms-min-width: 94px; -o-min-width: 94px; -webkit-min-width: 94px; min-width: 94px">Type of loan</th>
                    <th data-hide="all" style="-moz-min-width: 94px; -ms-min-width: 94px; -o-min-width: 94px; -webkit-min-width: 94px; min-width: 94px">Purpose of loan Dropdown</th>
                    <th data-hide="all" style="-moz-min-width: 94px; -ms-min-width: 94px; -o-min-width: 94px; -webkit-min-width: 94px; min-width: 94px">Security Details</th>
                    <th data-hide="phone" style="-moz-min-width: 94px; -ms-min-width: 94px; -o-min-width: 94px; -webkit-min-width: 94px; min-width: 94px">Outstanding Balance</th>
                    <th data-hide="all" style="-moz-min-width: 94px; -ms-min-width: 94px; -o-min-width: 94px; -webkit-min-width: 94px; min-width: 94px">Legal/Demand Notice Issued dropdown: yes/No</th>
                    <%--<th data-hide="phone" style="min-width: 81px">Status</th>--%>
                    <th data-hide="phone" style="-moz-min-width: 81px; -ms-min-width: 81px; -o-min-width: 81px; -webkit-min-width: 81px; min-width: 81px">Recovered Amount</th>
                    <th data-hide="phone" style="-moz-min-width: 81px; -ms-min-width: 81px; -o-min-width: 81px; -webkit-min-width: 81px; min-width: 81px">Recovered Status</th>
                    <%--<th data-hide="all" style="min-width: 81px">Serial Number</th>--%>
                </tr>
            </thead>
            <tbody id="NPADetailsData"></tbody>

            <tfoot class="hide-if-no-paging" id="TableFoot"></tfoot>
        </table>
        <form id="NPADetailsForm" class="form-horizontal" method="post">

            <div id="AddNPADetailsModal" class="modal fade bs-example-modal-sm" tabindex="-1" style="top: 106px; overflow: hidden; overflow-y: scroll">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content" style="-ms-border-top-left-radius: 10px; border-top-left-radius: 10px; -ms-border-top-right-radius: 10px; border-top-right-radius: 10px">
                        <div class="modal-header" style="padding: 10px; height: 40px; color: white; background-color: #00a0af; -ms-border-top-left-radius: 5px; border-top-left-radius: 5px; -ms-border-top-right-radius: 5px; border-top-right-radius: 5px">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="margin-top: -10px; -ms-opacity: 10; opacity: 10"><span aria-hidden="true" style="color: #D43F3A">&times;</span></button>
                            <h4 class="modal-title" id="modal-header">New NPA Details</h4>
                        </div>
                        <div class="modal-body container-fluid">

                            <input id="NPADetailsID" name="NPADetailsID" type="hidden" value="0" />

                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right"><span style="color: red">*</span>Allotted Executive</label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <select class="form-control form-control col-xs-4 col-md-4 col-lg-2 input-sm" name="ExecutiveName" id="ExecutiveName" style="width: 100%"></select>
                                </div>
                            </div>

                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right"><span style="color: red">*</span>Bank Name</label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <select class="form-control form-control col-xs-4 col-md-4 col-lg-2 input-sm" name="BankName" id="BankName" style="width: 100%"></select>
                                </div>
                            </div>

                            <%--   <div class="form-group form-group-sm" style="margin-bottom: 0px">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right"><span style="color: red">*</span>Branch Name </label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <select class="form-control form-control col-xs-4 col-md-4 col-lg-2 input-sm PasteDisable" name="BranchName" id="BranchName" onkeypress="return CharectersWithSpace(event,this);"  style="width: 100%"></select>
                                </div>
                            </div>--%>

                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right"><span style="color: red">*</span>Loan Account No.</label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="text" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2 PasteDisable" name="ACNo" id="ACNo" style="width: 100%" />
                                </div>
                            </div>

                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right"><span style="color: red">*</span>Borrower Name</label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="text" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2 PasteDisable" name="BorrowerName" onkeypress="return CharectersWithSpace(event,this);" id="BorrowerName" style="width: 100%" />
                                </div>
                            </div>

                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right">NPA Date(<%=DateFormatForDatePicker.ToUpper()%>)</label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="tel" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2 PasteDisable" name="NPADate" id="NPADate" style="width: 100%" />
                                </div>
                            </div>

                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right"><span style="color: red">*</span>City </label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <div class="input-group input-group-sm">
                                        <select class="form-control" name="City" id="City">
                                        </select>
                                        <span class="input-group-btn">
                                            <button class="btn btn-success btn-sm" type="button" style="-webkit-box-shadow: none; -ms-box-shadow: none; box-shadow: none" data-container="body" id="CityAddPopOver"><span class="glyphicon glyphicon-plus" title="Add New City"></span></button>
                                            <button class="btn btn-primary btn-sm" type="button" style="-webkit-box-shadow: none; -ms-box-shadow: none; box-shadow: none" data-container="body" id="CityEditPopOver"><span class="glyphicon glyphicon-edit" title="Edit City"></span></button>
                                        </span>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right"><span style="color: red">*</span>Location/Area</label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="text" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2 PasteDisable" name="Location" onkeypress="return CharectersWithSpace(event,this);" id="Location" style="width: 100%" />
                                </div>
                            </div>

                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right"><span style="color: red">*</span>Borrower Address </label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <textarea aria-multiline="true" rows="4" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2" name="BorrowerAddress" id="BorrowerAddress" style="width: 100%"></textarea>
                                </div>
                            </div>

                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right">Mobile No.</label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="tel" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2 PasteDisable" onkeypress="return NumberOnly(event,this);" name="PHNumber" id="PHNumber" style="width: 100%" />
                                </div>
                            </div>

                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right">Co-Applicant</label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="text" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2 PasteDisable" name="CoAppicant" onkeypress="return CharectersWithSpace(event,this);" id="CoAppicant" style="width: 100%" />
                                </div>
                            </div>

                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right">Guarantor</label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="text" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2 PasteDisable" name="Guaranty" onkeypress="return CharectersWithSpace(event,this);" id="Guaranty" style="width: 100%" />
                                </div>
                            </div>

                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right">Guarantor Address </label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <textarea aria-multiline="true" rows="4" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2" name="GuarantyAddress" id="GuarantyAddress" style="width: 100%"></textarea>
                                </div>
                            </div>

                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right">Guarantor Mobile No.</label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="tel" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2 PasteDisable" onkeypress="return NumberOnly(event,this);" name="GuarantyPHNumber" id="GuarantyPHNumber" style="width: 100%" />
                                </div>
                            </div>

                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right"><span style="color: red">*</span>Date of Allotment(<%=DateFormatForDatePicker.ToUpper()%>)</label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="tel" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2 PasteDisable" name="DateOfSanction" id="DateOfSanction" style="width: 100%" readonly="readonly" />
                                </div>
                            </div>

                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right"><span style="color: red">*</span>Type Of Loan </label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <select class="form-control form-control col-xs-4 col-md-4 col-lg-2 input-sm PasteDisable" name="TypeOfLoan" id="TypeOfLoan" style="width: 100%">
                                        <option value="-1" selected="selected">-- Select --</option>
                                        <option value="1">Secured</option>
                                        <option value="0">Unsecured</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right"><span style="color: red">*</span>Purpose of loan  </label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <select class="form-control form-control col-xs-4 col-md-4 col-lg-2 input-sm PasteDisable" name="Purposeofloan" id="Purposeofloan" style="width: 100%">
                                    </select>
                                </div>
                            </div>

                            <div class="form-group form-group-sm Expences" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right">Symbolic Position </label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <select class="form-control form-control col-xs-4 col-md-4 col-lg-2 input-sm " name="SymbolicPosition" id="SymbolicPosition" style="width: 100%">
                                        <option value="-1" selected="selected">-- Select --</option>
                                        <option value="1">Yes</option>
                                        <option value="0">No</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group form-group-sm Expences" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right">Date(<%=DateFormatForDatePicker.ToUpper()%>)</label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="tel" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2" name="Date" id="Date" style="width: 100%" />
                                </div>
                            </div>

                            <div class="form-group form-group-sm Expences" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right">CMM Order Applied </label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <select class="form-control form-control col-xs-4 col-md-4 col-lg-2 input-sm" name="CMMOrderApplied" id="CMMOrderApplied" style="width: 100%">
                                        <option value="-1" selected="selected">-- Select --</option>
                                        <option value="1">Yes</option>
                                        <option value="0">No</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group form-group-sm Expences" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right">Advocate Name</label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="text" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2" name="AdvocateName" onkeypress="return CharectersWithSpace(event,this);" id="AdvocateName" style="width: 100%" />
                                </div>
                            </div>

                            <div class="form-group form-group-sm Expences" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right">Contact No.</label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="tel" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2" onkeypress="return NumberOnly(event,this);" name="ADVTContactNo" id="ADVTContactNo" style="width: 100%" />
                                </div>
                            </div>

                            <div class="form-group form-group-sm Expences" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right">Physical Position </label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <select class="form-control form-control col-xs-4 col-md-4 col-lg-2 input-sm" name="PhysicalPosition" id="PhysicalPosition" style="width: 100%">
                                        <option value="-1" selected="selected">-- Select --</option>
                                        <option value="1">Yes</option>
                                        <option value="0">No</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group form-group-sm Expences" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right">Date(<%=DateFormatForDatePicker.ToUpper()%>)</label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="tel" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2" name="PhyPoDate" id="PhyPoDate" style="width: 100%" />
                                </div>
                            </div>

                            <div class="form-group form-group-sm Expences" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right">Identification of Property/Investigation</label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="text" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2" name="IdtofProperty" id="IdtofProperty" style="width: 100%" />
                                </div>
                            </div>

                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right">Security Details </label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <textarea aria-multiline="true" rows="4" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2" name="SecurityDetails" id="SecurityDetails" style="width: 100%"></textarea>
                                </div>
                            </div>

                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right"><span style="color: red">*</span>Outstanding Balance</label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="text" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2 PasteDisable" onkeypress="return NumberOnly(event,this);" name="OutstandingBalance" id="OutstandingBalance" style="width: 100%" />
                                </div>
                            </div>

                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right">Legal/Demand Notice Issued   </label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <select class="form-control form-control col-xs-4 col-md-4 col-lg-2 input-sm PasteDisable" name="DemandNoticeIssued" id="DemandNoticeIssued" style="width: 100%">
                                        <option value="1">Yes</option>
                                        <option value="0" selected="selected">No</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right"><span style="color: red"></span>Document</label>
                                <div class="col-lg-6" style="padding-top: 0">
                                    <input type="file" id="DocUpload" class="file" name="docUpload2" data-buttontext="Find file" style="width: 100%" title="Select Document" />
                                    <span id="EditDocument1" style="font-size: 12px"></span>
                                    <a onclick="UploadedDocUrl($('#NPADetailsID').val())" hidden="hidden" id="downlink4" style="cursor: pointer; color: blue !important;">Download</a>
                                </div>
                            </div>
                            <%-- <div class="form-group form-group-sm" style="margin-bottom: 0px" id="FileUploadDiv">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right"><span style="color: red"></span>Upload Documents</label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="file" id="UploadDocuments" class="filestyle" name="UploadDocuments" data-buttontext="Find file" style="width: 100%">
                                </div>
                            </div>--%>

                            <%-- <div class="form-group form-group-sm" style="margin-bottom: 0px">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right">Status </label>
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
    </div>



    <script>
        function UploadedDocUrl(EditID) {
            window.rownumb = EditID;
            if (EditID != "")
                window.location = "NPADetails.aspx?docurl=" + window.rownumb;
            else
                return "";
            return "";
        }
        $(function () {
            if ('<%= Request.QueryString.AllKeys.Contains("Error")%>' == "True") {
                alert(<%=Request.QueryString["Error"]%>);
                window.location = "NPADetails.aspx";
            }
            $('#TableFoot').append(TableFoot(21));
            $(".footable").footable();
            //window.onkeyup = function (e) {
            //    if (e.keyCode == 17 && !$("div.modal").hasClass('in')) {
            //        NewRecord();
            //    };
            //}
            NPADETAILS_GET();
            $("#DROP_DOWN_EXECUTIVE_FOR_REPORT, #DROP_DOWN_BANK_FOR_REPORT, #DROP_DOWN_BRANCH_FOR_REPORT, #DROP_DOWN_CITY_FOR_REPORT, #TEXT_BOX_FROMDATE_FOR_REPORT, #TEXT_BOX_TODATE_FOR_REPORT").change(function () {
                NPADETAILS_GET();
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
            $('#ExportMethod').click(function () {
                var EXID = $("#DROP_DOWN_EXECUTIVE_FOR_REPORT").val();
                var BankID = $("#DROP_DOWN_BANK_FOR_REPORT").val();
                var Branch = $("#DROP_DOWN_BRANCH_FOR_REPORT").val();
                var CityID = $("#DROP_DOWN_CITY_FOR_REPORT").val();
                var FDATE = $("#TEXT_BOX_FROMDATE_FOR_REPORT").val();
                var TDATE = $("#TEXT_BOX_TODATE_FOR_REPORT").val();
                var URL = window.location + '?ReportType=' + $("#Report").val() + '&EXID=' + EXID + '&BankID=' + BankID + '&Branch=' + Branch + '&CityID=' + CityID + '&FDATE=' + FDATE + '&TDATE=' + TDATE;
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
            $("#TypeOfLoan").change(function () {
                if ($("#TypeOfLoan").val() == "1") {
                    $('.Expences').show();
                }
                else {
                    $('.Expences').hide();
                }
                PurposeOfloanDropDown('');
            });
            $('#NPADetailsForm').bootstrapValidator({
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
                    BankName: {
                        validators: {
                            callback: {
                                message: 'Please select Bank',
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
                    BorrowerName: {
                        validators: {
                            notEmpty: {
                                message: 'Please Enter Borrower Name'
                            },
                            stringLength: {
                                message: 'Borrower Name Must Contain Minimum 4 Characters and should not Exceed 120 Characters.',
                                max: function (value) {
                                    return 120 - (value.match(/\r/g) || []).length;
                                }
                            }
                        }
                    },
                    City: {
                        validators: {
                            callback: {
                                message: 'Please Select City',
                                callback: function (value, validator) {
                                    var options = validator.getFieldElements('City').val();
                                    return (options != "-1");
                                }
                            }
                        }
                    },
                    BorrowerAddress: {
                        validators: {
                            notEmpty: {
                                message: 'Please Enter Borrower Address'
                            },
                            stringLength: {
                                message: 'Borrower Address Must Contain Minimum 4 Characters and should not Exceed 250 Characters.',
                                max: function (value) {
                                    return 120 - (value.match(/\r/g) || []).length;
                                }
                            }
                        }
                    },
                    TypeOfLoan: {
                        validators: {
                            callback: {
                                message: 'Please select Type Of Loan',
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
                    Purposeofloan: {
                        validators: {
                            callback: {
                                message: 'Please select Purpose of loan',
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
                    PHNumber: {
                        validators: {
                            digits: {
                                message: 'Enter NUMERIC Values Only'
                            },
                            stringLength: {
                                message: 'Please Enter Valid Mobile Number',
                                min: 10,
                                max: function (value) {
                                    return 10 - (value.match(/\r/g) || []).length;
                                }
                            }
                        }
                    },
                    Location: {
                        validators: {
                            notEmpty: {
                                message: 'Please Enter Location'
                            }
                        }
                    },
                    ACNo: {
                        validators: {
                            notEmpty: {
                                message: 'Please Enter Account No'
                            }
                        }
                    },
                    OutstandingBalance: {
                        validators: {
                            notEmpty: {
                                message: 'Please Enter Outstanding Balance'
                            }
                        }
                    },
                    DemandNoticeIssued: {
                        validators: {
                            callback: {
                                message: 'Please select Demand Notice Issued',
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
                    docUpload2: {
                        message: '',
                        validators: {
                            callback: {
                                callback: function (value, validator, $field) {
                                    if ($field[0].value != "") {
                                        $('#downlink4').hide();
                                        $('#EditDocument1').empty();
                                    }
                                    return true;
                                }
                            },
                            file: {
                                extension: 'doc,docx,pdf,zip,rar',
                                type: 'application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document,application/x-zip-compressed,application/octet-stream,application/pdf',
                                maxSize: 5000000,
                                message: 'File is not in valid Format(doc,docx,pdf,zip,rar)/File size exceeds maximum limit 5MB'
                            }
                        }
                    }
                }
            }).on('success.form.bv', function (e) {
                e.preventDefault();
                var fileUpload = $("#DocUpload").get(0);
                var files = fileUpload.files;
                var data = new FormData();
                if (files.length != 0) {
                    data.append(files[0].name, files[0]);
                }
                var FileData = "NPA" + "^"
                             + $('#NPADetailsID').val() + "^"
                             + $('#ExecutiveName').val() + "^"
                             + $("#ACNo").val() + "^"
                             + $("#BankName").val() + "^"
                             + $('#BorrowerName').val() + "^"
                             + $("#BorrowerAddress").val() + "^"
                             + $("#PHNumber").val() + "^"
                             + $("#CoAppicant").val() + "^"
                             + $("#Guaranty").val() + "^"
                             + $("#GuarantyAddress").val() + "^"
                             + $("#GuarantyPHNumber").val() + "^"
                             + $("#DateOfSanction").val() + "^"
                             + $("#TypeOfLoan").val() + "^"
                             + $("#Purposeofloan").val() + "^"
                             + $("#SecurityDetails").val() + "^"
                             + $("#OutstandingBalance").val() + "^"
                             + $("#DemandNoticeIssued").val() + "^"
                             + $("#NPADate").val() + "^"
                             + $("#City").val() + "^"
                             + $("#Location").val() + "^"
                             + $("#SymbolicPosition").val() + "^"
                             + $("#Date").val() + "^"
                             + $("#CMMOrderApplied").val() + "^"
                             + $("#AdvocateName").val() + "^"
                             + $("#ADVTContactNo").val() + "^"
                             + $("#PhysicalPosition").val() + "^"
                             + $("#PhyPoDate").val() + "^"
                             + $("#IdtofProperty").val() + "^"
                             + "true";
                if (files.length != 0) {
                    $.ajax({
                        url: "../FileUploadHandler.ashx/Enquiry?value=" + FileData,
                        type: "POST",
                        data: data,
                        contentType: false,
                        processData: false,
                        async: false,
                        success: function () {
                            if ($("#NPADetailsID").val() == "0") {
                                $("#NPADetailsID").finish().removeClass().addClass('alert alert-success').slideDown(window.InTimeinMicSec).delay(window.DelayTimeInMicSec).slideUp(window.OutTimeInMicSec).children('strong', this).empty().text('Success!').parent().children('span:first', this).empty().html('Succesfully New NPA Details Saved.');
                            }
                            else {
                                $("#AlertMessage").finish().removeClass().addClass('alert alert-success').slideDown(window.InTimeinMicSec).delay(window.DelayTimeInMicSec).slideUp(window.OutTimeInMicSec).children('strong', this).empty().text('Success!').parent().children('span:first', this).empty().html('Succesfully <a href="#" onclick="EditRecord(' + $("#NPADetailsID").val() + ')">NPA Details</a> Updated.');
                            }
                            $('.modal').modal('hide');
                            NPADETAILS_GET();
                        },
                        error: function (err) {

                            alert(err.statusText);
                        },
                        failure: function (err) {

                            alert(err.statusText);
                        }
                    });

                }
                else {
                    var DataCollection = {};
                    DataCollection.NPADetailsID = $("#NPADetailsID").val();
                    DataCollection.ExecutiveID = $("#ExecutiveName").val();
                    DataCollection.ACNo = $("#ACNo").val();
                    DataCollection.BankName = $("#BankName").val();
                    DataCollection.BorrowerName = $("#BorrowerName").val();
                    DataCollection.BorrowerAddress = $("#BorrowerAddress").val();
                    DataCollection.PHNumber = $("#PHNumber").val();
                    DataCollection.CoAppicant = $("#CoAppicant").val();
                    DataCollection.Guaranty = $("#Guaranty").val();
                    DataCollection.GuarantyAddress = $("#GuarantyAddress").val();
                    DataCollection.GuarantyPHNumber = $("#GuarantyPHNumber").val();
                    DataCollection.DateOfSanction = $("#DateOfSanction").val();
                    DataCollection.TypeOfLoan = $("#TypeOfLoan").val();
                    DataCollection.Purposeofloan = $("#Purposeofloan").val();
                    DataCollection.SecurityDetails = $("#SecurityDetails").val();
                    DataCollection.OutstandingBalance = $("#OutstandingBalance").val();
                    DataCollection.DemandNoticeIssued = $("#DemandNoticeIssued").val();
                    DataCollection.Active = "true";//$("#Active").is(':checked');
                    DataCollection.NPADate = $("#NPADate").val();
                    DataCollection.City = $("#City").val();
                    DataCollection.Location = $("#Location").val();
                    DataCollection.SymbolicPosition = $("#SymbolicPosition").val();
                    DataCollection.Date = $("#Date").val();
                    DataCollection.CMMOrderApplied = $("#CMMOrderApplied").val();
                    DataCollection.AdvocateName = $("#AdvocateName").val();
                    DataCollection.ADVTContactNo = $("#ADVTContactNo").val();
                    DataCollection.PhysicalPosition = $("#PhysicalPosition").val();
                    DataCollection.PhyPoDate = $("#PhyPoDate").val();
                    DataCollection.IdtofProperty = $("#IdtofProperty").val();
                    $.ajax({
                        url: "NPADetails.aspx/NPADETAILS_INSERT_UPDATE",
                        data: JSON.stringify(DataCollection),
                        type: "POST",
                        async: false,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function () {
                            if ($("#NPADetailsID").val() != "0") {
                                $("#AlertMessage").finish().removeClass().addClass('alert alert-success').slideDown(window.InTimeinMicSec).delay(window.DelayTimeInMicSec).slideUp(window.OutTimeInMicSec).children('strong', this).empty().text('Success!').parent().children('span:first', this).empty().html('Succesfully <a href="#" onclick="EditRecord(' + $("#NPADetailsID").val() + ')">NPA Details</a> Updated.');
                            }
                            else {
                                $("#AlertMessage").finish().removeClass().addClass('alert alert-success').slideDown(window.InTimeinMicSec).delay(window.DelayTimeInMicSec).slideUp(window.OutTimeInMicSec).children('strong', this).empty().text('Success!').parent().children('span:first', this).empty().html('Succesfully New NPA Details Saved.');
                            }
                            $('.modal').modal('hide');
                            NPADETAILS_GET();
                        }
                    });
                }
            });
        });
        function NPADETAILS_GET() {
            var DataCollection = {};
            DataCollection.ID = null;
            DataCollection.EXID = $("#DROP_DOWN_EXECUTIVE_FOR_REPORT").val();
            DataCollection.BankID = $("#DROP_DOWN_BANK_FOR_REPORT").val();
            DataCollection.Branch = $("#DROP_DOWN_BRANCH_FOR_REPORT").val();
            DataCollection.CityID = $("#DROP_DOWN_CITY_FOR_REPORT").val();
            DataCollection.FDATE = $("#TEXT_BOX_FROMDATE_FOR_REPORT").val();
            DataCollection.TDATE = $("#TEXT_BOX_TODATE_FOR_REPORT").val();
            $.ajax({
                type: "POST",
                url: "NPADetails.aspx/NPADETAILS_GET",
                data: JSON.stringify(DataCollection),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    $("#NPADetailsData").empty();
                    var xmlDoc = $.parseXML(data.d);
                    var xml = $(xmlDoc);
                    var GetEnquiresUserLevel = xml.find("Table");
                    var ROWS;
                    if (GetEnquiresUserLevel.length > 0) {
                        $("#NPACount").empty().text(GetEnquiresUserLevel.length);
                        $('#ReportCollasseButton').show();
                        ROWS = "";
                        $.each(GetEnquiresUserLevel, function () {
                                var EditRecord = '<a onclick="javascript:EditRecord(' + $(this).find("ID").text() + ')" style="cursor:pointer;"><span class="glyphicon glyphicon glyphicon-edit EDIT-ICON" style="color:black" title="Edit This Record"></span></a>';
                                var ReportRecord = '<a onclick="javascript:NPAREPORTLETTER(' + $(this).find("ID").text() + ')" style="cursor:pointer;"><span class="glyphicon glyphicon-file" style="padding-right:5px" title="PDF Generate"></span></a>';

                                var Status = "";
                                if ($(this).find("Active").text().toLowerCase() == "true") {
                                    Status = '<span class="label label-success LBLACTIVE">Active</span>';
                                } else {
                                    Status = '<span class="label label-warning LBLINACTIVE">Inactive</span>';
                                }
                                var RStatus = "";
                                if ($(this).find("STATUS").text().toLowerCase() == "close") {
                                    RStatus = '<span class="label label-success LBLACTIVE">CLOSE</span>';
                                } else {
                                    RStatus = '<span class="label label-warning LBLINACTIVE">PENDING</span>';
                                }
                                var DemandNotice = "NO";
                                if ($(this).find("DemandNotice").text().toLowerCase() == "true") {
                                    DemandNotice = "YES";
                                }
                                var TOL = "Unsecure";
                                if ($(this).find("TypeOfLoan").text().toLowerCase() == "true") {
                                    TOL = "secure";
                                }
                                ROWS += '<tr>' +
                                    '<td style="text-align:center">' + ReportRecord + EditRecord + '</td>' +
                                    '<td>' + $(this).find("EXECUTIVE_ANME").text() + '</td>' +
                                    '<td>' + $(this).find("LoanAccountNo").text() + '</td>' +
                                    '<td>' + $(this).find("BANK_NAME").text() + '</td>' +
                                    '<td>' + $(this).find("BRANCH_NAME").text() + '</td>' +
                                    '<td>' + $(this).find("City_Name").text() + '</td>' +
                                    '<td>' + $(this).find("BorrowerName").text() + '</td>' +
                                    '<td>' + $(this).find("NPADate").text().split('T')[0] + '</td>' +
                                    '<td>' + $(this).find("BorrowerAddress").text() + '</td>' +
                                    '<td>' + $(this).find("ContactNo").text() + '</td>' +
                                    '<td>' + $(this).find("CoApplicant").text() + '</td>' +
                                    '<td>' + $(this).find("Guaranty").text() + '</td>' +
                                    '<td>' + $(this).find("GuarantyCellNo").text() + '</td>' +
                                    '<td>' + $(this).find("GaurantyAddress").text() + '</td>' +
                                    '<td>' + $(this).find("DOS").text() + '</td>' +
                                    '<td>' + TOL + '</td>' +
                                    '<td>' + $(this).find("PURPOSEOFLOANNAME").text() + '</td>' +
                                    '<td>' + $(this).find("SecurityDetails").text() + '</td>' +
                                    '<td style="text-align:right">' + $(this).find("OutstandingBalance").text() + '</td>' +
                                    '<td>' + DemandNotice + '</td>' +
                                    //'<td style="text-align:center">' + Status + '</td>' +
                                    '<td style="text-align:right">' + $(this).find("RECOVRED_AMOUNT").text() + '</td>' +
                                    '<td style="text-align:center">' + RStatus + '</td>' +
                                    //'<td>' + $(this).find("SERIALNUMBER").text() + '</td>' +
                                    '</tr>';
                        });
                    }
                    else {
                        ROWS = '<tr><td colspan="21" style="text-align:center"> No Data To Display</td></tr>';
                        $("#NPACount").empty().text(0);
                        //$('#ReportCollasseButton').hide();
                        //$("#ReportCollassePanel").removeClass("in");
                    }

                    $("#NPADetailsData").append(ROWS);
                    $('.footable').trigger('footable_initialize');
                }
            });
        }
        function EditRecord(NPAID) {
            var DataCollection = {};
            DataCollection.ID = NPAID;
            DataCollection.EXID = null;
            DataCollection.BankID = null;
            DataCollection.Branch = null;
            DataCollection.CityID = null;
            DataCollection.FDATE = "";
            DataCollection.TDATE = "";
            $.ajax({
                type: "POST",
                url: "NPADetails.aspx/NPADETAILS_GET",
                data: JSON.stringify(DataCollection),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var xmlDoc = $.parseXML(data.d);
                    var xml = $(xmlDoc);
                    var GetEnquiresUserLevel = xml.find("Table");
                    $.each(GetEnquiresUserLevel, function () {
                        $("#modal-header").empty().text("Edit NPA Details");
                        $('#SaveBtn').empty().html('<span class="glyphicon glyphicon-ok"></span>&nbsp;Update');
                        $("#NPADetailsID").val($(this).find("ID").text());
                        ExecutiveDropDown($(this).find("ExecutiveID").text());
                        $("#ACNo").val($(this).find("LoanAccountNo").text());
                        BankDropDown($(this).find("BankID").text());
                        $("#BorrowerName").val($(this).find("BorrowerName").text());
                        $("#NPADate").datepicker({
                            
                            changeMonth: true,
                            changeYear: true
                        }).datepicker("setDate", new Date($(this).find("NPADate").text()));
                        if ($(this).find("NPADate").text() == "") {
                            $("#NPADate").val("");
                        }
                        window.CITY_GET($(this).find("City").text());
                        $("#Location").val($(this).find("Location").text());
                        $("#BorrowerAddress").val($(this).find("BorrowerAddress").text());
                        $("#PHNumber").val($(this).find("ContactNo").text());
                        $("#CoAppicant").val($(this).find("CoApplicant").text());
                        $("#Guaranty").val($(this).find("Guaranty").text());
                        $("#GuarantyAddress").val($(this).find("GaurantyAddress").text());
                        $("#GuarantyPHNumber").val($(this).find("GuarantyCellNo").text());
                        $("#DateOfSanction").datepicker({
                            
                            changeMonth: true,
                            changeYear: true
                        }).datepicker("setDate", new Date($(this).find("DOS").text()));
                        if ($(this).find("TypeOfLoan").text().toLowerCase() == "true") {
                            $("#TypeOfLoan").val(1);
                            $('.Expences').show();
                            PurposeOfloanDropDown($(this).find("PurposeOfLoan").text());
                        }
                        else {
                            $("#TypeOfLoan").val(0);
                            $('.Expences').hide();
                            PurposeOfloanDropDown($(this).find("PurposeOfLoan").text());
                        }
                        $("#SymbolicPosition").val($(this).find("SymbolicPosition").text());
                        $("#Date").datepicker({
                            
                            changeMonth: true,
                            changeYear: true
                        }).datepicker("setDate", new Date($(this).find("Date1").text()));
                        if ($(this).find("Date1").text() == "") {
                            $("#Date").val("");
                        }
                        $("#SymbolicPosition").val($(this).find("SymbolicPosition").text());
                        if ($(this).find("CMMOrderApplied").text() == "") {
                            $("#SymbolicPosition").val(-1);
                        }
                        $("#CMMOrderApplied").val($(this).find("CMMOrderApplied").text());
                        if ($(this).find("CMMOrderApplied").text() == "") {
                            $("#CMMOrderApplied").val(-1);
                        }
                        $("#AdvocateName").val($(this).find("AdvocateName").text());
                        $("#ADVTContactNo").val($(this).find("AdvContactNo").text());
                        $("#PhysicalPosition").val($(this).find("PhysicalPosition").text());
                        if ($(this).find("PhysicalPosition").text() == "") {
                            $("#PhysicalPosition").val(-1);
                        }
                        $("#PhyPoDate").datepicker({
                            
                            changeMonth: true,
                            changeYear: true
                        }).datepicker("setDate", new Date($(this).find("Date2").text()));
                        if ($(this).find("Date2").text() == "") {
                            $("#PhyPoDate").val("");
                        }
                        $("#IdtofProperty").val($(this).find("Investigation").text());
                        $("#SecurityDetails").val($(this).find("SecurityDetails").text());
                        $("#OutstandingBalance").val($(this).find("OutstandingBalance").text());
                        if ($(this).find("DemandNotice").text().toLowerCase() == "true") {
                            $("#DemandNoticeIssued").val(1);
                        }
                        else {
                            $("#DemandNoticeIssued").val(0);
                        }
                        //if ($(this).find("Active").text().toLowerCase() == "true") {
                        //    $("#Active").prop('checked', true);
                        //}
                        //else {
                        //    $("#Active").prop('checked', false);
                        //}
                        $("#downlink4").val($(this).find("UFILE_NAME").text());
                        if ($(this).find("UFILE_NAME").text() != "") {
                            $('#downlink4').show();
                            $('#EditDocument1').empty().text($(this).find("UFILE_NAME").text());
                        }
                        else {
                            $('#downlink4').hide();
                            $('#EditDocument1').empty().text('No Document Uploaded');
                        }
                    });
                    $('#AddNPADetailsModal').modal({ backdrop: 'static', keyboard: false }).on('shown.bs.modal', function () {
                        $(this).find('select#ExecutiveName').focus();
                    });;
                }
            });
        }
        function InActiveRecord(NPAID) {
            $.ajax({
                type: "POST",
                url: "NPADetails.aspx/DELETENPADetails",
                data: '{"NPAID":"' + NPAID + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function () {
                    $("#AlertMessage").finish().removeClass().addClass('alert alert-danger').slideDown(window.InTimeinMicSec).delay(window.DelayTimeInMicSec).slideUp(window.OutTimeInMicSec).children('strong', this).empty().text('Deleted!').parent().children('span:first', this).empty().html('Record succesfully inactive/deleted.');
                    NPADETAILS_GET();
                }
            });
        }
        function NewRecord() {
            $("#modal-header").empty().text("New NPA Details");
            $('#SaveBtn').empty().html('<span class="glyphicon glyphicon-ok"></span>&nbsp;Save');
            $('.Expences').hide();
            $("#NPADetailsID").val(0);
            $("#DateOfSanction, #Date, #PhyPoDate, #NPADate").datepicker({
                
                changeMonth: true,
                changeYear: true
            }).datepicker("setDate", new Date());
                $("#Date,#NPADate,#PhyPoDate").val("");
                ExecutiveDropDown();
                BankDropDown();
                $("#Active").attr('checked', true);
                $('select').val(-1);
                $('.Expences>div>select').val(-1);
                $("input type[text]").val("");
                $('#OutstandingBalance,#BorrowerName,#ACNo,#CoAppicant,#Guaranty,#PHNumber,textarea').val("");
                $("#DemandNoticeIssued").val(0);
                window.CITY_GET();
                $("#Report").val(1);
                $('#AddNPADetailsModal').modal({ backdrop: 'static', keyboard: false }).on('shown.bs.modal', function () {
                    $(this).find('select#ExecutiveName').focus();
                });
                $('#downlink4').hide();
                $('#EditDocument1').empty().text('');
                $("#DemandNoticeIssued").val(0);
            }
            function ExecutiveDropDown(ID) {
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
                        }
                        else {
                            $("#ExecutiveName").append('<option value="-1">-- No Data --</option>');
                        }
                    }
                });
            }
            function BankDropDown(BANK) {
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
                    }
                });
            }
            function PurposeOfloanDropDown(VA) {
                $.ajax({
                    type: "POST",
                    url: "NPADetails.aspx/NPADETAILS_PURPOSEOFLOAN_GET",
                    data: '{"Type":"' + parseInt($("#TypeOfLoan").val()) + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        var rows = "";
                        $("#Purposeofloan").empty();
                        var xmlDoc = $.parseXML(data.d);
                        var xml = $(xmlDoc);
                        var ExecutiveDropDownT = xml.find("Table");
                        if (ExecutiveDropDownT.length > 0) {
                            rows += '<option value="-1" selected="selected">-- Select --</option>';
                            $.each(ExecutiveDropDownT, function () {
                                rows += '<option value="' + $(this).find("ID").text() + '">' + $(this).find("PurposeOfLoan").text() + '</option>';
                            });
                            $("#Purposeofloan").append(rows);
                            if (VA != "") {
                                $("#Purposeofloan").val(VA);
                            }
                        }
                        else {
                            $("#Purposeofloan").append('<option value="-1">-- No Data --</option>');
                        }
                    }
                });
            }
            function NPAREPORTLETTER(ID) {
                var URL = window.location + '?NPAID=' + ID;
                window.location = URL;
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
