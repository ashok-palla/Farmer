<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BankVisitDetails.aspx.cs" Inherits="DailyTransactions_BankVisitDetails" MasterPageFile="~/MasterPage/CRMaster.master" Title="Bank Visit Details" %>

<asp:Content ContentPlaceHolderID="CRMasterHead" runat="server"> </asp:Content>
<asp:Content ContentPlaceHolderID="CRMasterBody" runat="server">
      <div class="page-header">
<script src="../APPRequires/FooTable/js/footable.js"></script>
<script src="../APPRequires/FooTable/js/footable.filter.js"></script>
<script src="../APPRequires/FooTable/js/footable.sort.js"></script>
<script src="../APPRequires/FooTable/js/footable.paginate.js"></script>
<link href="../APPRequires/FooTable/css/footable.core.css" rel="stylesheet" />
<link href="../APPRequires/FooTable/css/footable.metro.css" rel="stylesheet" />
        <h3>Bank visit Details <span class="badge" id="BVCount"></span></h3>
    </div>
    <div class="panel-body PagePanelBody">
        <input type="text" class="form-control SEARCH_BOX" placeholder="Search Here" id="Create_Customer_Search" style="margin-bottom: 3px"/>
        <%--REPORT COLLAPSE PANEL START--%>
        <a class="btn btn-warning pull-right" role="button" id="ReportCollasseButton" data-toggle="collapse" href="#ReportCollassePanel" aria-expanded="false" aria-controls="ReportCollassePanel" title="Filters/Export/Reports" style="height: 16px; border-radius: 0px; border-bottom-left-radius: 4px; border-bottom-right-radius: 4px; padding-top: 0px; padding-bottom: 0px; margin-bottom: 2px; color: white"><span class="glyphicon glyphicon-chevron-down"></span></a>
        <div class="collapse" id="ReportCollassePanel">
            <div class="panel-body" style="border: 1px solid #ebebeb">

                <div class="form-group form-group-sm" style="margin-bottom: 0px">
                    <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; padding-top: 5px; text-align: right">Eexecutive </label>
                    <div class="col-lg-6" style="padding-bottom: 1%">
                        <select class="chosen-select form-control form-control col-xs-4 col-md-4 col-lg-2 input-sm " name="DROP_DOWN_EXECUTIVE_FOR_REPORT" id="DROP_DOWN_EXECUTIVE_FOR_REPORT" style="width: 100%"></select>
                    </div>
                </div>

                <div class="form-group form-group-sm" style="margin-bottom: 0px">
                    <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; padding-top: 5px; text-align: right">Bank </label>
                    <div class="col-lg-6" style="padding-bottom: 1%">
                        <select class="chosen-select form-control form-control col-xs-4 col-md-4 col-lg-2 input-sm " name="DROP_DOWN_BANK_FOR_REPORT" id="DROP_DOWN_BANK_FOR_REPORT" style="width: 100%"></select>
                    </div>
                </div>
                
                <div class="form-group form-group-sm" style="margin-bottom: 0px">
                    <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right">From Date(<%=DateFormatForDatePicker%>)</label>
                    <div class="col-lg-6" style="padding-bottom: 1%">
                        <input type="text" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2" name="TEXT_BOX_FROMDATE_FOR_REPORT" id="TEXT_BOX_FROMDATE_FOR_REPORT" style="width: 100%" />
                    </div>
                </div>
                
                <div class="form-group form-group-sm" style="margin-bottom: 0px">
                    <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right">To Date(<%=DateFormatForDatePicker%>)</label>
                    <div class="col-lg-6" style="padding-bottom: 1%">
                        <input type="tel" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2" name="TEXT_BOX_TODATE_FOR_REPORT" id="TEXT_BOX_TODATE_FOR_REPORT" style="width: 100%" />
                    </div>
                </div>
                
                <div class="input-group input-group-sm col-lg-12 col-md-12" style="padding: 0%; padding-top: 10px">
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
                    <th data-sort-ignore="true" style="text-align: center; color: white; display: table-cell; vertical-align: middle; min-width: 55px">
                        <input type="button" class="button circle" style="height: 30px;" value="+" onclick="NewRecord();" title="Add New Record" /></th>
                    <th style="min-width: 120px">Executive</th>
                    <th style="min-width: 121px" data-hide="phone, tablet">Bank Name</th>
                    <th style="min-width: 121px" data-hide="phone, tablet">Branch Name</th>
                    <th style="min-width: 121px" data-hide="phone, tablet">City</th>
                    <th data-hide="phone, tablet" style="min-width: 94px">Followup Action</th>
                    <th data-hide="phone, tablet" style="min-width: 94px">Date</th>
                    <th data-hide="phone" style="min-width: 81px">Status</th>
                </tr>
            </thead>
            <tbody id="BankVisitData"></tbody>

            <tfoot class="hide-if-no-paging" id="TableFoot"></tfoot>
        </table>
        <form id="BankVisitDetailsForm" class="form-horizontal" method="post">

            <div id="AddBankVisitModal" class="modal fade bs-example-modal-sm" tabindex="-1" style="top: 15%; overflow: hidden; overflow-y: scroll">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content" style="border-top-left-radius: 10px; border-top-right-radius: 10px">
                        <div class="modal-header" style="padding: 10px; height: 40px; color: white; background-color: #00a0af; border-top-left-radius: 5px; border-top-right-radius: 5px">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="margin-top: -8px; opacity: 10"><span aria-hidden="true" style="color: #D43F3A">&times;</span></button>
                            <h4 class="modal-title" id="modal-header">New Bank Visit</h4></div>
                        <div class="modal-body container-fluid">

                            <input id="BankVisitID" name="BankVisitID" type="hidden" value="0" />

                            <div class="form-group form-group-sm" style="margin-bottom: 0px">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right"><span style="color: red">*</span>Executive Name </label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <select  class="chosen-select form-control form-control col-xs-4 col-md-4 col-lg-2 input-sm"  name="ExecutiveName" id="ExecutiveName" style="width: 100%" ></select>
                                </div>
                            </div>
                            
                            <div class="form-group form-group-sm" style="margin-bottom: 0px">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right"><span style="color: red">*</span>Bank Name </label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <select  class="chosen-select form-control form-control col-xs-4 col-md-4 col-lg-2 input-sm"  name="BankName" id="BankName" style="width: 100%" ></select>
                                </div>
                            </div>
                            
                            <div class="form-group form-group-sm" style="margin-bottom: 0px">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right"><span style="color: red">*</span>Follow-Up Action </label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <textarea aria-multiline="true" rows="4" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2" name="PurposeOfVisit" id="PurposeOfVisit" style="width: 100%"></textarea>
                                </div>
                            </div>
                            
                            <div class="form-group form-group-sm" style="margin-bottom: 0px">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right"><span style="color: red">*</span>Date</label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="tel" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2 PasteDisable" name="Date" id="Date" style="width: 100%" readonly="true" />
                                </div>
                            </div>

                            <div class="form-group form-group-sm" style="margin-bottom: 0px">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right">Active </label>
                                <div class="col-lg-6" style="padding-top: 1%">
                                    <input type="checkbox" id="Active" name="Active" checked="checked" />
                                </div>
                            </div>

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
    
<link href="https://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.3/css/bootstrapValidator.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.3/js/bootstrapValidator.js" type="text/javascript"></script>
    <script>
        jQuery(function () {
            jQuery('#TableFoot').append(TableFoot(6));
            jQuery('.footable').footable();
            GET_BANK_VISIT_RELATED_DATA();
            //window.onkeyup = function (e) {
            //    if (e.keyCode == 17) {
            //        NewRecord();
            //    };
            //}

            $("#DROP_DOWN_EXECUTIVE_FOR_REPORT, #DROP_DOWN_BANK_FOR_REPORT, #TEXT_BOX_FROMDATE_FOR_REPORT, #TEXT_BOX_TODATE_FOR_REPORT").change(function () {
                GET_BANK_VISIT_RELATED_DATA();
            });
            $("#ReportCollasseButton").click(function () {
                if (!$("#ReportCollassePanel").hasClass('in')) {
                    EXECUTIVEDROPDOWN_FOR_REPORT();
                    BANKDROPDOWN_FOR_REPORT();
                    $("#TEXT_BOX_FROMDATE_FOR_REPORT,#TEXT_BOX_TODATE_FOR_REPORT").datepicker({
                        changeMonth: true,
                        changeYear: true
                    }).datepicker("setDate", new Date());
                    $("#TEXT_BOX_FROMDATE_FOR_REPORT,#TEXT_BOX_TODATE_FOR_REPORT").val("");
                }
            });
            $('#AddBankVisitModal').on('hidden.bs.modal', function () {
                $("#BankVisitID").val(0);
                $("#Active").prop('checked', true);
                $('select').val(-1);
                $('textarea').val("");
                $("#BankVisitDetailsForm").bootstrapValidator('resetForm', true);
                $("#Report").val(1);
            });

            $('#ExportMethod').click(function () {
                var EXID = $("#DROP_DOWN_EXECUTIVE_FOR_REPORT").val();
                var BankID = $("#DROP_DOWN_BANK_FOR_REPORT").val();
                var FDATE = $("#TEXT_BOX_FROMDATE_FOR_REPORT").val();
                var TDATE = $("#TEXT_BOX_TODATE_FOR_REPORT").val();
                var URL = window.location + '?ReportType=' + $("#Report").val() + '&EXID=' + EXID + '&BankID=' + BankID + '&FDATE=' + FDATE + '&TDATE=' + TDATE;
                window.location = URL;
            });
            $('input.PasteDisable').on('paste', function () {
                alert("paste not allowed.")
                return false;
            });

            $('#BankVisitDetailsForm').bootstrapValidator({
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
                                callback: function (value, validator, $field) {
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
                                message: 'Please select bank',
                                callback: function (value, validator, $field) {
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
                    PurposeOfVisit: {
                        validators: {
                            notEmpty: {
                                message: 'Please Enter Follow-Up Action'
                            }
                        }
                    },
                }
            }).on('success.form.bv', function (e) {
                e.preventDefault();
                var DataCollection = {};
                DataCollection.BankVisitID = $("#BankVisitID").val();
                DataCollection.ExecutiveName = $("#ExecutiveName").val();
                DataCollection.BankName = $("#BankName").val();
                DataCollection.PurposeOfVisit = $("#PurposeOfVisit").val();
                DataCollection.Date = $("#Date").val();
                DataCollection.Active = $("#Active").is(':checked');

                $.ajax({
                    url: "BankVisitDetails.aspx/BANK_VISIT_INSERT_UPDATE",
                    data: JSON.stringify(DataCollection),
                    type: "POST",
                    async: false,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        if ($("#BankVisitID").val() != "0") {
                            $("#AlertMessage").finish().removeClass().addClass('alert alert-success').slideDown(InTimeinMicSec).delay(DelayTimeInMicSec).slideUp(OutTimeInMicSec).children('strong', this).empty().text('Success!').parent().children('span:first', this).empty().html('Succesfully <a href="#" onclick="EditRecord(' + $("#BankVisitID").val() + ')">Bank Visit Details</a> Updated.');

                        }
                        else {
                            $("#AlertMessage").finish().removeClass().addClass('alert alert-success').slideDown(InTimeinMicSec).delay(DelayTimeInMicSec).slideUp(OutTimeInMicSec).children('strong', this).empty().text('Success!').parent().children('span:first', this).empty().html('Succesfully New Bank Visit Details Saved.');
                        }
                        $('.modal').modal('hide');
                        GET_BANK_VISIT_RELATED_DATA();
                    }
                });
            });
        });
        function NewRecord() {
            $("#modal-header").empty().text("New Bank Visit");
            $('#SaveBtn').empty().html('<span class="glyphicon glyphicon-ok"></span>&nbsp;Save');
            ExecutiveDropDown();
            BankDropDown();
            $("#Date").datepicker({
                changeMonth: true,
                changeYear: true
            }).datepicker("setDate", new Date());
            $("#Active").attr('checked', true);
            $('#AddBankVisitModal').modal({ backdrop: 'static', keyboard: false, }).on('shown.bs.modal', function () {
                $(this).find('select#ExecutiveName').focus();
            });
        }
        function GET_BANK_VISIT_RELATED_DATA() {
            var DataCollection = {};
            DataCollection.EXID = $("#DROP_DOWN_EXECUTIVE_FOR_REPORT").val();
            DataCollection.BankID = $("#DROP_DOWN_BANK_FOR_REPORT").val();
            DataCollection.FDATE = $("#TEXT_BOX_FROMDATE_FOR_REPORT").val();
            DataCollection.TDATE = $("#TEXT_BOX_TODATE_FOR_REPORT").val();
            $.ajax({
                type: "POST",
                url: "BankVisitDetails.aspx/GET_BANK_VISIT_RELATED_DATA",
                data: JSON.stringify(DataCollection),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    $("#BankVisitData").empty();
                    var xmlDoc = $.parseXML(data.d);
                    var xml = $(xmlDoc);
                    var GetEnquiresUserLevel = xml.find("Table");
                    if (GetEnquiresUserLevel.length > 0) {
                        $("#BVCount").empty().text(GetEnquiresUserLevel.length);
                        $('#ReportCollasseButton').show();
                        $.each(GetEnquiresUserLevel, function () {
                            var EditRecord = '<a onclick="javascript:EditRecord(' + $(this).find("ID").text() + ')" style="cursor:pointer;"><span class="glyphicon glyphicon glyphicon-edit EDIT-ICON" style="color:black" title="Edit This Record"></span></a>';
                            var DeleteRecord = '<a onclick="javascript:InActiveRecord(' + $(this).find("ID").text() + ')" style="cursor:pointer;"><span class="glyphicon glyphicon glyphicon-remove REMOVE-ICON" style="color:red;padding-left:5px" title="Remove This Record"></span></a>';

                            var Status = "";
                            if ($(this).find("ACTIVE").text().toLowerCase() == "true") {
                                Status = '<span class="label label-success LBLACTIVE">Active</span>';
                            }
                            else {
                                Status = '<span class="label label-warning LBLINACTIVE">Inactive</span>';
                            }
                            $("#BankVisitData").append('<tr>' +
                                                   '<td style="text-align:center">' + EditRecord + '</td>' +
                                                   '<td>' + $(this).find("EXECUTIVENAME").text() + '</td>' +
                                                   '<td>' + $(this).find("BANKNAME").text() + '</td>' +
                                                   '<td>' + $(this).find("BRANCHNAME").text() + '</td>' +
                                                   '<td>' + $(this).find("CITY").text() + '</td>' +
                                                   '<td>' + $(this).find("PURPOSE").text() + '</td>' +
                                                   '<td>' + $(this).find("DATE").text() + '</td>' +
                                                   '<td style="text-align:center">' + Status + '</td>' +
                                                  '</tr>');
                        });
                    }
                    else {
                        $("#BankVisitData").append('<tr><td colspan="8" style="text-align:center"> No Data To Display</td></tr>');
                    }
                    $('.footable').trigger('footable_initialize');
                }
            });
        }

        function EditRecord(BankVisitID) {
            $.ajax({
                type: "POST",
                url: "BankVisitDetails.aspx/BANKVISIT_GET_BY_BANKVISITID",
                data: '{"BankVisitID":"' + BankVisitID + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var xmlDoc = $.parseXML(data.d);
                    var xml = $(xmlDoc);
                    var GetEnquiresUserLevel = xml.find("Table");
                    $.each(GetEnquiresUserLevel, function () {
                        $("#modal-header").empty().text("Edit Bank Visit");
                        $('#SaveBtn').empty().html('<span class="glyphicon glyphicon-ok"></span>&nbsp;Update');
                        $("#BankVisitID").val($(this).find("ID").text());
                        ExecutiveDropDown($(this).find("ExecutiveID").text());
                        BankDropDown($(this).find("VisitingBankID").text());
                        $("#PurposeOfVisit").val($(this).find("Purpose").text());
                        $("#Date").datepicker({
                            dateFormat: 'dd/mm/yy',
                            changeMonth: true,
                            changeYear: true
                        }).datepicker("setDate", new Date($(this).find("Date").text()));
                        if ($(this).find("Active").text().toLowerCase() == "true") {
                            $("#Active").prop('checked', true);
                        }
                        else {
                            $("#Active").prop('checked', false);
                        }
                    });
                    $('#AddBankVisitModal').modal({ backdrop: 'static', keyboard: false, });
                }
            });
        }
        function InActiveRecord(BankVisitID) {
            $.ajax({
                type: "POST",
                url: "BankVisitDetails.aspx/BANKVISIT_DELETE",
                data: '{"BankVisitID":"' + BankVisitID + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    $("#AlertMessage").finish().removeClass().addClass('alert alert-danger').slideDown(InTimeinMicSec).delay(DelayTimeInMicSec).slideUp(OutTimeInMicSec).children('strong', this).empty().text('Deleted!').parent().children('span:first', this).empty().html('Record succesfully inactive/deleted.');
                    GET_BANK_VISIT_RELATED_DATA();
                }
            });
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
                            $("#BankName").append('<option value="' + $(this).find("ID").text() + '">' + $(this).find("Name").text() + ' - ' + $(this).find("Zone").text() + ' - ' + $(this).find("Branch").text() + ' - ' + $(this).find("CITY_NAME").text() + '</option>');
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
                url: "BankVisitDetails.aspx/BANK_DROPDOWN_GET",
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
                            $("#DROP_DOWN_BANK_FOR_REPORT").append('<option value="' + $(this).find("ID").text() + '">' + $(this).find("Name").text() + ' - ' + $(this).find("Zone").text() + ' - ' + $(this).find("Branch").text() + '</option>');
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
    </script>
</asp:Content>
