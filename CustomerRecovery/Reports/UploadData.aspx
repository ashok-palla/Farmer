<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UploadData.aspx.cs" Inherits="Reports.Reports_UploadData" MasterPageFile="~/MasterPage/CRMaster.master" %>

<asp:Content ContentPlaceHolderID="CRMasterHead" runat="server"></asp:Content>

<asp:Content ContentPlaceHolderID="CRMasterBody" runat="server">
<script src="../APPRequires/FooTable/js/footable.js"></script>
<script src="../APPRequires/FooTable/js/footable.filter.js"></script>
<script src="../APPRequires/FooTable/js/footable.sort.js"></script>
<script src="../APPRequires/FooTable/js/footable.paginate.js"></script>
<link href="../APPRequires/FooTable/css/footable.core.css" rel="stylesheet" />
<link href="../APPRequires/FooTable/css/footable.metro.css" rel="stylesheet" />
    <div class="page-header">
        <h3>Excel Upload </h3>
    </div>

    <form id="ExcelUploadformControls" class="form-horizontal" method="post">
        <div class="panel-body PagePanelBody">
            <div class="form-group form-group-sm" style="margin-bottom: 0">
                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right">Download Excel Template</label>
                <div class="col-lg-6" style="padding-bottom: 1%">
                    <button class="btn btn-primary btn-sm" type="button" id="ButtonDonload">DOWNLOAD TEMPLATE</button>
                </div>
            </div>
            <div class="form-group form-group-sm" style="margin-bottom: 0">
                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right">Sample Excel Template</label>
                <div class="col-lg-6" style="padding-bottom: 1%">
                    <button class="btn btn-primary btn-sm" type="button" id="ButtonDataDonload">SAMPLE</button>
                </div>
            </div>
            <%--    <div class="form-group form-group-sm" style="margin-bottom: 0px">
            <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right"><span style="color: red">*</span>Executive Name </label>
            <div class="col-lg-6" style="padding-bottom: 1%">
                <select class="form-control form-control col-xs-4 col-md-4 col-lg-2 input-sm" name="ExecutiveName" id="ExecutiveName" style="width: 100%"></select>
            </div>
        </div>--%>
            <div class="form-group form-group-sm" style="margin-bottom: 0">
                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right"><span style="color: red">*</span>City </label>
                <div class="col-lg-6" style="padding-bottom: 1%">
                    <div class="input-group input-group-sm">
                        <select class="form-control" name="City" id="City"></select>
                        <span class="input-group-btn">
                            <button class="btn btn-success btn-sm" type="button" style="-webkit-box-shadow: none; -ms-box-shadow: none; box-shadow: none" data-container="body" id="CityAddPopOver"><span class="glyphicon glyphicon-plus" title="Add New City"></span></button>
                            <button class="btn btn-primary btn-sm" type="button" style="-webkit-box-shadow: none; -ms-box-shadow: none; box-shadow: none" data-container="body" id="CityEditPopOver"><span class="glyphicon glyphicon-edit" title="Edit City"></span></button>
                        </span>
                    </div>
                </div>
            </div>
            <div class="form-group" style="margin-bottom: 0">
                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right"><span style="color: red">*</span>Excel Upload</label>
                <div class="col-lg-6" style="padding-bottom: 1%">
                    <input type="file" id="ExcelUpload" class="form-control col-xs-4 col-md-4 col-lg-2" name="ExcelUpload"/>
                </div>
            </div>
            <div class="form-group" style="margin-bottom: 0">
                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right"></label>
                <div class="col-lg-6" style="padding-bottom: 1%">
                    <button class="btn btn-default btn-primary" id="fjdhbsj" type="submit">Upload</button>
                </div>
            </div>
        </div>
    </form>
    <form id="ExcelUploadform" class="form-horizontal" method="post">
        <div id="ExcelUploadModal" class="modal fade bs-example-modal-sm" tabindex="-1" style="top: 106px; overflow: hidden; overflow-y: scroll">
            <div class="modal-dialog modal-lg" style="width: 100%">
                <div class="modal-content" style="-ms-border-top-left-radius: 10px; border-top-left-radius: 10px; -ms-border-top-right-radius: 10px; border-top-right-radius: 10px">
                    <div class="modal-header" style="padding: 10px; height: 40px; color: white; background-color: #00a0af; -ms-border-top-left-radius: 5px; border-top-left-radius: 5px; -ms-border-top-right-radius: 5px; border-top-right-radius: 5px" id="modal-header">Excel Upload Data</div>
                    <div class="modal-body container-fluid">
                        <div>

                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs" role="tablist">
                                <li role="presentation" class="active"><a href="#NPADetails" aria-controls="NPADetails" role="tab" data-toggle="tab">NPA <span class="badge" id="UploadCount"></span></a></li>
                                <li role="presentation"><a href="#Bank" aria-controls="Bank" role="tab" data-toggle="tab">Bank <span class="badge" id="BankDetailsCount"></span></a></li>
                                <li role="presentation"><a href="#LoanAccountType" aria-controls="LoanAccountType" role="tab" data-toggle="tab">Loan Account Details <span class="badge" id="LoanAccountDetailsCount"></span></a></li>
                            </ul>

                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div role="tabpanel" class="tab-pane active" id="NPADetails">
                                    <input type="text" class="form-control SEARCH_BOX" placeholder="Search Here" id="CreateCustomerTable_Search" style="margin-bottom: 3px">
                                   Total Records: <label class="label" id="TotalExcelNPACount" style="color:black"></label>
                                   Duplicate Records: <label class="label" id="DuplicateExcelNPACount" style="color:black"></label>
                                   Invalid Records: <label class="label" id="InValidExcelNPACount" style="color:black"></label>
                                   Valid Records: <label class="label" id="ValidExcelNPACount" style="color:black"></label>
                                    <input type="button" class="btn btn-xs btn-primary pull-right" value="Download Excel" id="ErrorExcelDownload"/>
                                    <table class="footable table  toggle-arrow-circle-filled" id="CreateCustomerTable" data-filter="#CreateCustomerTable_Search" data-page-size="20" data-limit-navigation="3">
                                        <thead>
                                            <tr>
                                                <th style="-moz-min-width: 121px; -ms-min-width: 121px; -o-min-width: 121px; -webkit-min-width: 121px; min-width: 121px" data-hide="phone, tablet">DATE_OF_ALLOTMENT</th>
                                                <th style="-moz-min-width: 121px; -ms-min-width: 121px; -o-min-width: 121px; -webkit-min-width: 121px; min-width: 121px" data-hide="phone, tablet">EXECUTIVE_NAME</th>
                                                <th style="-moz-min-width: 121px; -ms-min-width: 121px; -o-min-width: 121px; -webkit-min-width: 121px; min-width: 121px" data-hide="phone, tablet">BANK</th>
                                                <th style="-moz-min-width: 133px; -ms-min-width: 133px; -o-min-width: 133px; -webkit-min-width: 133px; min-width: 133px">BRANCH</th>
                                                <th style="-moz-min-width: 94px; -ms-min-width: 94px; -o-min-width: 94px; -webkit-min-width: 94px; min-width: 94px">ACCOUNT_NO</th>
                                                <th style="-moz-min-width: 94px; -ms-min-width: 94px; -o-min-width: 94px; -webkit-min-width: 94px; min-width: 94px">BORROWER_NAME</th>
                                                <th style="-moz-min-width: 94px; -ms-min-width: 94px; -o-min-width: 94px; -webkit-min-width: 94px; min-width: 94px">ACCOUNT_CATEGORY</th>
                                                <th style="-moz-min-width: 94px; -ms-min-width: 94px; -o-min-width: 94px; -webkit-min-width: 94px; min-width: 94px">ACCOUNT_TYPE</th>
                                                <th style="-moz-min-width: 94px; -ms-min-width: 94px; -o-min-width: 94px; -webkit-min-width: 94px; min-width: 94px">DATE_OF_NPA</th>
                                                <th style="-moz-min-width: 94px; -ms-min-width: 94px; -o-min-width: 94px; -webkit-min-width: 94px; min-width: 94px">AMT_OS</th>
                                                <th style="-moz-min-width: 94px; -ms-min-width: 94px; -o-min-width: 94px; -webkit-min-width: 94px; min-width: 94px">ERROR</th>
                                            </tr>
                                        </thead>
                                        <tbody id="ExcelUploadData"></tbody>

                                        <tfoot class="hide-if-no-paging" id="TableFoot"></tfoot>
                                    </table>
                                </div>
                                <div role="tabpanel" class="tab-pane" id="Bank">
                                    <input type="text" class="form-control SEARCH_BOX" placeholder="Search Here" id="BankDetails_Search" style="margin-bottom: 3px">
                                    <table class="footable table  toggle-arrow-circle-filled" id="BankDetails" data-filter="#BankDetails_Search" data-page-size="20" data-limit-navigation="3">
                                        <thead>
                                            <tr>
                                                <th style="-moz-min-width: 121px; -ms-min-width: 121px; -o-min-width: 121px; -webkit-min-width: 121px; min-width: 121px" data-hide="phone, tablet">BANK</th>
                                                <th style="-moz-min-width: 121px; -ms-min-width: 121px; -o-min-width: 121px; -webkit-min-width: 121px; min-width: 121px" data-hide="phone, tablet">BRANCH</th>
                                                <th style="-moz-min-width: 121px; -ms-min-width: 121px; -o-min-width: 121px; -webkit-min-width: 121px; min-width: 121px" data-hide="phone, tablet">CITY</th>
                                                <th style="-moz-min-width: 133px; -ms-min-width: 133px; -o-min-width: 133px; -webkit-min-width: 133px; min-width: 133px">ERROR</th>
                                            </tr>
                                        </thead>
                                        <tbody id="Tbody1"></tbody>

                                        <tfoot class="hide-if-no-paging" id="BankDetailsfoot"></tfoot>
                                    </table>
                                </div>
                                <div role="tabpanel" class="tab-pane" id="LoanAccountType">
                                    <input type="text" class="form-control SEARCH_BOX" placeholder="Search Here" id="LoanAccountType_Search" style="margin-bottom: 3px">
                                    <table class="footable table  toggle-arrow-circle-filled" data-filter="#LoanAccountType_Search" data-page-size="20" data-limit-navigation="3">
                                        <thead>
                                            <tr>
                                                <th style="-moz-min-width: 121px; -ms-min-width: 121px; -o-min-width: 121px; -webkit-min-width: 121px; min-width: 121px" data-hide="phone, tablet">ACCOUNT CATEGORY</th>
                                                <th style="-moz-min-width: 121px; -ms-min-width: 121px; -o-min-width: 121px; -webkit-min-width: 121px; min-width: 121px" data-hide="phone, tablet">ACCOUNT TYPE</th>
                                                <th style="-moz-min-width: 121px; -ms-min-width: 121px; -o-min-width: 121px; -webkit-min-width: 121px; min-width: 121px" data-hide="phone, tablet">DESCRIPTION</th>
                                                <th style="-moz-min-width: 133px; -ms-min-width: 133px; -o-min-width: 133px; -webkit-min-width: 133px; min-width: 133px">ERROR</th>
                                            </tr>
                                        </thead>
                                        <tbody id="LoanAccountDetails"></tbody>

                                        <tfoot class="hide-if-no-paging" id="LoanAccountTypefoot"></tfoot>
                                    </table>
                                </div>
                            </div>

                        </div>
                        
                    </div>
                    <div class="modal-footer" style="padding: 5px">
                        <button type="submit" class="btn btn-default Save" style="margin-top: 2px" onclick="EXCELUPLOAD();"><span class="glyphicon glyphicon-ok"></span>&nbsp;Upload</button>
                        <button type="button" data-dismiss="modal" class="btn btn-default Cancel"><span class="glyphicon glyphicon-remove"></span>&nbsp;Close</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script>
        jQuery(function () {
            $('#TableFoot').append(TableFoot(11));
            $('#BankDetailsfoot').append(TableFoot(4));
            $('#LoanAccountTypefoot').append(TableFoot(4));
            $(".footable").footable();
            //ExecutiveDropDown();
            window.CITY_GET();
            $('#ErrorExcelDownload').click(function () {
                var URL = window.location + '?City=' + $("#City").val() + '';
                window.location = URL;
            });
            $('.spinner').hide();
            $('#ButtonDataDonload').click(function () {
                window.location = "UploadData.aspx?DTemp=2";
            });
            $('#ButtonDonload').click(function () {
                window.location = "UploadData.aspx?DTemp=1";
            });

            $('#ExcelUploadModal').on('hidden.bs.modal', function () {
                $("#ExcelUploadformControls").bootstrapValidator('resetForm', true);
                $("#City").val(-1);
            });
            $('#ExcelUploadformControls').bootstrapValidator({
                message: 'This value is not valid',
                feedbackIcons: {
                    valid: 'glyphicon glyphicon',
                    invalid: 'glyphicon glyphicon',
                    validating: 'glyphicon glyphicon-refresh'
                },
                excluded: ':disabled',
                fields: {
                    City: {
                        validators: {
                            callback: {
                                message: 'Please select city',
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
                    ExcelUpload: {
                        message: '',
                        validators: {
                            callback: {
                                callback: function (value) {
                                    if (value.length == 0) {
                                        return {
                                            valid: false,
                                            message: 'please choose an Excel file as source'
                                        };
                                    }
                                    var found = value.lastIndexOf('.') + 1;
                                    var ext = value.substr(found);
                                    if (value != "") {
                                        if (ext != "xls" && ext != "xlsx") {
                                            return {
                                                valid: false,
                                                message: 'Please select only .xls or .xlsx files'
                                            };
                                        }
                                    }
                                    return true;
                                }
                            }
                        }
                    }
                }
            }).one('success.form.bv', function (e) {
                e.preventDefault();
                var fileUpload = $("#ExcelUpload").get(0);
                var files = fileUpload.files;

                var data = new FormData();
                for (var i = 0; i < files.length; i++) {
                    data.append(files[i].name, files[i]);
                }

                $.ajax({
                    url: "FileUploadHandler.ashx",
                    type: "POST",
                    data: data,
                    contentType: false,
                    processData: false,
                    success: function () { NPADETAILS_GET() },
                    error: function (err) {
                        alert(err.statusText);
                    }
                });
            });
        });


            $("#btnUpload").click(function () {
        });
        function NPADETAILS_GET() {
            $.ajax({
                type: "POST",
                url: "UploadData.aspx/EXCELGET",
                data: "{'CITYID':'" + $("#City").val() + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    $("#ExcelUploadData").empty();
                    var xmlDoc = $.parseXML(data.d);
                    var xml = $(xmlDoc);
                    var GetEnquiresUserLevel = xml.find("Table2");
                    var BankDetails = xml.find("Table");
                    var LoanAccountDetails = xml.find("Table1");
                    $("#UploadCount").empty().text(GetEnquiresUserLevel.length);
                    var NPAROWS = "";
                    var TotalExcelNPACount = 0;
                    var DuplicateExcelNPACount = 0;
                    var ValidExcelNPACount = 0;
                    var InValidExcelNPACount = 0;
                    if (GetEnquiresUserLevel.length > 0) {
                        $.each(GetEnquiresUserLevel, function () {
                    TotalExcelNPACount += 1;
                            if (parseFloat($(this).find("COUNT").text()) >= 2) {
                                DuplicateExcelNPACount += 1;
                            }
                            var error = $(this).find("ERROR").text();
                            NPAROWS += '<tr">' +
                                            '<td>' + $(this).find("DATE_OF_ALLOTMENT").text().split('T')[0] + '</td>' +
                                            '<td>' + $(this).find("EXECUTIVE_NAME").text() + '</td>' +
                                            '<td>' + $(this).find("BANK").text() + '</td>' +
                                            '<td>' + $(this).find("BRANCH").text() + '</td>' +
                                            '<td>' + $(this).find("ACCOUNT_NO").text() + '</td>' +
                                            '<td>' + $(this).find("BORROWER_NAME").text() + '</td>' +
                                            '<td>' + $(this).find("ACCOUNT_CATEGORY").text() + '</td>' +
                                            '<td>' + $(this).find("ACCOUNT_TYPE").text() + '</td>' +
                                            '<td>' + $(this).find("DATE_OF_NPA").text().split('T')[0] + '</td>' +
                                            '<td>' + $(this).find("OUT_STANDING_AMOUNT").text() + '</td>' +
                                            '<td>' + error + '</td>' +
                                            '</tr>'
                            if (error == "") {
                                ValidExcelNPACount += 1;
                            }
                        });
                        $("#ExcelUploadData").append(NPAROWS);
                        $("#TotalExcelNPACount").empty().text(TotalExcelNPACount);
                        $("#DuplicateExcelNPACount").empty().text(DuplicateExcelNPACount);
                        $("#ValidExcelNPACount").empty().text(ValidExcelNPACount);
                        $("#InValidExcelNPACount").empty().text(TotalExcelNPACount - DuplicateExcelNPACount - ValidExcelNPACount);
                    }
                    else {
                        $("#ExcelUploadData").append('<tr><td colspan="10" style="text-align:center"> No Data To Display</td></tr>');
                    }

                    $("#BankDetailsCount").empty().text(BankDetails.length);
                    if (BankDetails.length > 0) {
                        $.each(BankDetails, function () {
                            $("#BankDetails").append('<tr>' +
                                                   '<td>' + $(this).find("BANK").text().split('T')[0] + '</td>' +
                                                   '<td>' + $(this).find("BRANCH").text() + '</td>' +
                                                   '<td>' + $(this).find("CITY_NAME").text() + '</td>' +
                                                   '<td>' + $(this).find("ERROR").text() + '</td>' +
                                                  '</tr>');
                        });
                    }
                    else {
                        $("#BankDetails").append('<tr><td colspan="4" style="text-align:center"> No Data To Display</td></tr>');
                    }

                    $("#LoanAccountDetailsCount").empty().text(LoanAccountDetails.length);
                    if (LoanAccountDetails.length > 0) {
                        $.each(LoanAccountDetails, function () {
                            $("#LoanAccountDetails").append('<tr>' +
                                                   '<td>' + $(this).find("ACCOUNT_CATEGORY").text().split('T')[0] + '</td>' +
                                                   '<td>' + $(this).find("ACCOUNT_TYPE").text() + '</td>' +
                                                   '<td>' + $(this).find("DESCRIPTION").text() + '</td>' +
                                                   '<td>' + $(this).find("ERROR").text() + '</td>' +
                                                  '</tr>');
                        });
                    }
                    else {
                        $("#LoanAccountDetails").append('<tr><td colspan="4" style="text-align:center"> No Data To Display</td></tr>');
                    }
                    $('.footable').trigger('footable_initialize');
                    $("#ExcelUploadModal").modal();
                }
            });
        }
        function EXCELUPLOAD() {
            $.ajax({
                type: "POST",
                url: "UploadData.aspx/EXCELUPLOAD",
                data: "{'CITYID':'" + $("#City").val() + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    alert(data.d);
                }
            });
        }

        function ExecutiveDropDown() {
            $.ajax({
                type: "POST",
                url: "UploadData.aspx/EXECUTIVE_DROPDOEN_GET",
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
                    }
                    else {
                        $("#ExecutiveName").append('<option value="-1">-- No Data --</option>');
                    }
                }
            });
        }
    </script>
</asp:Content>
