<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LoanAccountDetails.aspx.cs" Inherits="Masters.Masters_LoanAccountDetails" MasterPageFile="~/MasterPage/CRMaster.master" Title="Loan Account Details" %>

<asp:Content ContentPlaceHolderID="CRMasterHead" runat="server"></asp:Content>
<asp:Content ContentPlaceHolderID="CRMasterBody" runat="server">
<script src="../APPRequires/FooTable/js/footable.js"></script>
<script src="../APPRequires/FooTable/js/footable.filter.js"></script>
<script src="../APPRequires/FooTable/js/footable.sort.js"></script>
<script src="../APPRequires/FooTable/js/footable.paginate.js"></script>
<link href="../APPRequires/FooTable/css/footable.core.css" rel="stylesheet" />
<link href="../APPRequires/FooTable/css/footable.metro.css" rel="stylesheet" />
    <div class="page-header">
        <h3>Loan Account Details <span class="badge" id="LoanAccountCount"></span></h3>
    </div>
    <div class="panel-body PagePanelBody">
        <input type="text" class="form-control SEARCH_BOX" placeholder="Search Here" id="Create_Customer_Search" style="margin-bottom: 3px">
        
        <%--REPORT COLLAPSE PANEL START--%>
        <a class="btn btn-warning pull-right" role="button" id="ReportCollasseButton" data-toggle="collapse" href="#ReportCollassePanel" aria-expanded="false" aria-controls="ReportCollassePanel" title="Filters/Export/Reports" style="height: 16px; -ms-border-radius: 0; border-radius: 0; -ms-border-bottom-left-radius: 4px; border-bottom-left-radius: 4px; -ms-border-bottom-right-radius: 4px; border-bottom-right-radius: 4px; padding-top: 0; padding-bottom: 0; margin-bottom: 2px; color: white"><span class="glyphicon glyphicon-chevron-down"></span></a>
        <div class="collapse" id="ReportCollassePanel">
            <div class="panel-body" style="border: 1px solid #ebebeb">
                <div class="input-group input-group-sm col-lg-12 col-md-12" style="padding: 0">
                    <select class="form-control" id="Report">
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

        <table class="footable table  toggle-arrow-circle-filled" id="CreateCustomerTable" data-filter="#Create_Customer_Search" data-page-size="50" data-limit-navigation="1">
            <thead>
                <tr>
                    <th data-sort-ignore="true" style="text-align: center; color: white; display: table-cell; vertical-align: middle; -moz-min-width: 72px; -ms-min-width: 72px; -o-min-width: 72px; -webkit-min-width: 72px; min-width: 72px">
                        <input type="button" class="button circle" style="height: 30px;" value="+" onclick="NewRecord();" title="Add New Record" /></th>
                    <th style="-moz-min-width: 193px; -ms-min-width: 193px; -o-min-width: 193px; -webkit-min-width: 193px; min-width: 193px">Loan Account Type</th>
                    <th data-hide="phone, tablet" style="-moz-min-width: 193px; -ms-min-width: 193px; -o-min-width: 193px; -webkit-min-width: 193px; min-width: 193px">Purpose Of Loan</th>
                    <th data-hide="phone, tablet" style="-moz-min-width: 193px; -ms-min-width: 193px; -o-min-width: 193px; -webkit-min-width: 193px; min-width: 193px">Description</th>
                    <th data-hide="phone" style="-moz-min-width: 81px; -ms-min-width: 81px; -o-min-width: 81px; -webkit-min-width: 81px; min-width: 81px">Status</th>
                </tr>
            </thead>
            <tbody id="LoanAccountData"></tbody>

            <tfoot class="hide-if-no-paging" id="TableFoot"></tfoot>
        </table>
        <form id="LoanAccountDetailsForm" class="form-horizontal" method="post">

            <div id="AddLocalAccountModal" class="modal fade bs-example-modal-sm" tabindex="-1" style="top: 15%; overflow: hidden; overflow-y: scroll">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content" style="-ms-border-top-left-radius: 10px; border-top-left-radius: 10px; -ms-border-top-right-radius: 10px; border-top-right-radius: 10px">
                        <div class="modal-header" style="padding: 10px; height: 40px; color: white; background-color: #00a0af; -ms-border-top-left-radius: 5px; border-top-left-radius: 5px; -ms-border-top-right-radius: 5px; border-top-right-radius: 5px">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="margin-top: -9px; -ms-opacity: 10; opacity: 10"><span aria-hidden="true" style="color: #D43F3A">&times;</span></button>
                            <h4 class="modal-title" id="modal-header">New Loan Account</h4>
                        </div>
                        <div class="modal-body container-fluid">

                            <input id="LoanAccountID" name="LoanAccountID" type="hidden" value="0" />

                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right"><span style="color: red">*</span>Loan Type </label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <select class="form-control form-control col-xs-4 col-md-4 col-lg-2 input-sm PasteDisable" name="LoanAccountDetails" id="LoanAccountDetails" style="width: 100%">
                                        <option value="-1" selected="selected">-- Select --</option>
                                        <option value="1">Secured</option>
                                        <option value="0">Unsecured</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right"><span style="color: red">*</span>Purpose Of Loan </label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="text" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2 PasteDisable" name="PurposeOfLoan" id="PurposeOfLoan" style="width: 100%" />
                                </div>
                            </div>
                            
                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right">&nbsp;Description </label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <textarea aria-multiline="true" rows="4" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2" name="Description" id="Description" style="width: 100%"></textarea>
                                </div>
                            </div>
                            
                            <div class="form-group form-group-sm" style="margin-bottom: 0">
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
            $('#TableFoot').append(TableFoot(5));
            $('.footable').footable();
            GET_LOAN_ACCOUNT_RELATED_DATA();
            //window.onkeyup = function (e) {
            //    if (e.keyCode == 17) {
            //        $('#AddLocalAccountModal').modal({ backdrop: 'static', keyboard: false, });
            //    };
            //}

            if ('<%=Convert.ToInt32(Request.Cookies["UserRole"].Value)%>' == 2) {
                $(".circle").remove();
            }
            $('#ExportMethod').click(function () {
                var url = window.location + '?ReportType=' + $("#Report").val();
                window.location = url;
            });
            $('#AddLocalAccountModal').on('hidden.bs.modal', function () {
                $("#modal-header").empty().text("New Loan Account");
                $("#LoanAccountDetailsForm").bootstrapValidator('resetForm', true);
                $("#LoanAccountID").val(0);
                $("#Active").prop('checked', true);
                $('select').val(-1);
                $('textarea').val("");
                $("#Report").val(1);
            });
            $('input.PasteDisable').on('paste', function () {
                alert("paste not allowed.");
                return false;
            });

            $('#LoanAccountDetailsForm').bootstrapValidator({
                message: 'This value is not valid',
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                excluded: ':disabled',
                fields: {
                    LoanAccountDetails: {
                        validators: {
                            callback: {
                                message: 'Please select Loan Type',
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
                    PurposeOfLoan: {
                        validators: {
                            notEmpty: {
                                message: 'Please Enter Purpose Of Loan'
                            }
                        }
                    }
                }
            }).on('success.form.bv', function (e) {
                e.preventDefault();
                var dataCollection = {};
                dataCollection.LoanAccountID = $("#LoanAccountID").val();
                dataCollection.LoanAccountDetails = $("#LoanAccountDetails").val();
                dataCollection.PurposeOfLoan = $("#PurposeOfLoan").val();
                dataCollection.Description = $("#Description").val();
                dataCollection.Active = $("#Active").is(':checked');

                $.ajax({
                    url: "LoanAccountDetails.aspx/INSERTANDUPDATELOANACCOUNTDETAILS",
                    data: JSON.stringify(dataCollection),
                    type: "POST",
                    async: false,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        if ($("#LoanAccountID").val() != "0") {
                            $("#AlertMessage").finish().removeClass().addClass('alert alert-success').slideDown(window.InTimeinMicSec).delay(window.DelayTimeInMicSec).slideUp(window.OutTimeInMicSec).children('strong', this).empty().text('Success!').parent().children('span:first', this).empty().html('Succesfully <a href="#" onclick="EditRecord(' + $("#LoanAccountID").val() + ')">Loan Account</a> Updated.');
                        }
                        else {
                            $("#AlertMessage").finish().removeClass().addClass('alert alert-success').slideDown(window.InTimeinMicSec).delay(window.DelayTimeInMicSec).slideUp(window.OutTimeInMicSec).children('strong', this).empty().text('Success!').parent().children('span:first', this).empty().html('Succesfully Loan Account Saved.');
                        }
                        $('.modal').modal('hide');
                        GET_LOAN_ACCOUNT_RELATED_DATA();
                    }
                });
            });
        });
        function NewRecord() {
            $('#SaveBtn').empty().html('<span class="glyphicon glyphicon-ok"></span>&nbsp;Save');
            $('#AddLocalAccountModal').modal({ backdrop: 'static', keyboard: false }).on('shown.bs.modal', function () {
                $(this).find('#LoanAccountDetails').focus();
            });
            $("#Report").val(1);
        }
        function GET_LOAN_ACCOUNT_RELATED_DATA() {
            $.ajax({
                type: "POST",
                url: "LoanAccountDetails.aspx/GET_LOAN_ACCOUNT_RELATED_DATA",
                data: {},
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var rows = "";
                    $("#LoanAccountData").empty();
                    var xmlDoc = $.parseXML(data.d);
                    var xml = $(xmlDoc);
                    var getEnquiresUserLevel = xml.find("Table");
                    if (getEnquiresUserLevel.length > 0) {
                        $("#LoanAccountCount").empty().text(getEnquiresUserLevel.length);
                        $('#ReportCollasseButton').show();
                        $.each(getEnquiresUserLevel, function () {
                            var editRecord = '<a onclick="javascript:EditRecord(' + $(this).find("ID").text() + ')" style="cursor:pointer;"><span class="glyphicon glyphicon glyphicon-edit EDIT-ICON" style="color:black" title="Edit This Record"></span></a>';
                            var deleteRecord = '<a onclick="javascript:InActiveRecord(' + $(this).find("ID").text() + ')" style="cursor:pointer;"><span class="glyphicon glyphicon glyphicon-remove REMOVE-ICON" style="color:red;padding-left:5px" title="Remove This Record"></span></a>';
                            if ('<%=Convert.ToInt32(Request.Cookies["UserRole"].Value)%>' == 2) {
                                editRecord = "";
                                deleteRecord = "";
                            }
                            var status = "";
                            if ($(this).find("Active").text().toLowerCase() == "true") {
                                status = '<span class="label label-success LBLACTIVE ' + $(this).find("ID").text() + 'STA">Active</span>';
                            }
                            else {
                                status = '<span class="label label-warning LBLINACTIVE ' + $(this).find("ID").text() + 'STA">Inactive</span>';
                            }
                            var loanAccountDetails = "Unsecured";
                            if ($(this).find("LoanAccountDetails").text().toLowerCase() == "true") { loanAccountDetails = "Secured" }
                            rows += '<tr>' +
                                    '<td style="text-align:center">' + editRecord + deleteRecord + '</td>' +
                                    '<td>' + loanAccountDetails + '</td>' +
                                    '<td>' + $(this).find("PurposeOfLoan").text() + '</td>' +
                                    '<td>' + $(this).find("Description").text() + '</td>' +
                                    '<td style="text-align:center">' + status + '</td>' +
                                    '</tr>';
                        });
                        $("#LoanAccountData").append(rows);
                    }
                    else {
                        $("#LoanAccountData").append('<tr><td colspan="5" style="text-align:center"> No Data To Display</td></tr>');
                        $('#ReportCollasseButton').hide();
                        $("#ReportCollassePanel").removeClass("in");
                        $("#LoanAccountCount").empty().text(0);
                    }
                    $('.footable').trigger('footable_initialize');
                }
            });
        }

        function EditRecord(loanAccountId) {
            $.ajax({
                type: "POST",
                url: "LoanAccountDetails.aspx/LOAN_ACCOUNT_GET_EDIT",
                data: '{"LoanAccountID":"' + loanAccountId + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var xmlDoc = $.parseXML(data.d);
                    var xml = $(xmlDoc);
                    var getEnquiresUserLevel = xml.find("Table");
                    $.each(getEnquiresUserLevel, function () {
                        $("#modal-header").empty().text("Edit Loan Account");
                        $('#SaveBtn').empty().html('<span class="glyphicon glyphicon-ok"></span>&nbsp;Update');
                        $("#LoanAccountID").val($(this).find("ID").text());
                        if ($(this).find("LoanAccountDetails").text().toLowerCase() == "true") { $("#LoanAccountDetails").val(1); } else { $("#LoanAccountDetails").val(0); }
                        $("#PurposeOfLoan").val($(this).find("PurposeOfLoan").text());
                        $("#Description").val($(this).find("Description").text());
                        if ($(this).find("Active").text().toLowerCase() == "true") {
                            $("#Active").prop('checked', true);
                        }
                        else {
                            $("#Active").prop('checked', false);
                        }
                    });
                    $('#AddLocalAccountModal').modal({ backdrop: 'static', keyboard: false });
                }
            });
        }
        function InActiveRecord(loanAccountId) {
            var delStatus = $("." + loanAccountId + "STA").text();
            if (delStatus == "Inactive") {
                delStatus = "delete";
            }
            else {
                delStatus = "inactive";
            }
            if (confirm("Are you sure, do you want to " + delStatus + " this record? ")) {
                $.ajax({
                    type: "POST",
                    url: "LoanAccountDetails.aspx/DELETE_LOANACCOUNT",
                    data: '{"LoanAccountID":"' + loanAccountId + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        if (data.d == "") {
                            $("#AlertMessage").finish().removeClass().addClass('alert alert-danger').slideDown(window.InTimeinMicSec).delay(window.DelayTimeInMicSec).slideUp(window.OutTimeInMicSec).children('strong', this).empty().text('Deleted!').parent().children('span:first', this).empty().html('Record succesfully inactive/deleted.');
                            GET_LOAN_ACCOUNT_RELATED_DATA();
                        }
                        else {
                            alert(data.d);
                        }
                    }
                });
            }
        }
    </script>
</asp:Content>
