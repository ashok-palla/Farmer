<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Target.aspx.cs" Inherits="Masters.Masters_Target" MasterPageFile="~/MasterPage/CRMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CRMasterHead" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CRMasterBody" runat="server">
<script src="../APPRequires/FooTable/js/footable.js"></script>
<script src="../APPRequires/FooTable/js/footable.filter.js"></script>
<script src="../APPRequires/FooTable/js/footable.sort.js"></script>
<script src="../APPRequires/FooTable/js/footable.paginate.js"></script>
<link href="../APPRequires/FooTable/css/footable.core.css" rel="stylesheet" />
<link href="../APPRequires/FooTable/css/footable.metro.css" rel="stylesheet" />
    <div class="page-header">
        <h3>Target Details <span class="badge" id="TargetCount"></span></h3>
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
                    <th data-sort-ignore="true" style="text-align: center; color: white; display: table-cell; vertical-align: middle; -moz-min-width: 73px; -ms-min-width: 73px; -o-min-width: 73px; -webkit-min-width: 73px; min-width: 73px">
                        <input type="button" class="button circle" style="height: 30px;" value="+" onclick="NewRecord();" title="Add New Record"/></th>
                    <th style="-moz-min-width: 120px; -ms-min-width: 120px; -o-min-width: 120px; -webkit-min-width: 120px; min-width: 120px">Executive</th>
                    <th style="-moz-min-width: 121px; -ms-min-width: 121px; -o-min-width: 121px; -webkit-min-width: 121px; min-width: 121px">Outstanding amount</th>
                    <th style="-moz-min-width: 110px; -ms-min-width: 110px; -o-min-width: 110px; -webkit-min-width: 110px; min-width: 110px">From Date(MM/DD/YYYY)</th>
                    <th style="-moz-min-width: 110px; -ms-min-width: 110px; -o-min-width: 110px; -webkit-min-width: 110px; min-width: 110px">To Date(MM/DD/YYYY)</th>
                    <th style="-moz-min-width: 121px; -ms-min-width: 121px; -o-min-width: 121px; -webkit-min-width: 121px; min-width: 121px">Recovered Amount</th>
                    <th style="-moz-min-width: 121px; -ms-min-width: 121px; -o-min-width: 121px; -webkit-min-width: 121px; min-width: 121px">Percentage</th>
                </tr>
            </thead>
            <tbody id="TargetData"></tbody>

            <tfoot class="hide-if-no-paging" id="TableFoot"></tfoot>
        </table>
        <form id="TargetDetailsForm" class="form-horizontal" method="post">

            <div id="AddTargetModal" class="modal fade bs-example-modal-sm" tabindex="-1" style="top: 15%; overflow: hidden; overflow-y: scroll">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content" style="-ms-border-top-left-radius: 10px; border-top-left-radius: 10px; -ms-border-top-right-radius: 10px; border-top-right-radius: 10px">
                        <div class="modal-header" style="padding: 10px; height: 40px; color: white; background-color: #00a0af; -ms-border-top-left-radius: 5px; border-top-left-radius: 5px; -ms-border-top-right-radius: 5px; border-top-right-radius: 5px">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="margin-top: -9px; -ms-opacity: 10; opacity: 10"><span aria-hidden="true" style="color: #D43F3A">&times;</span></button>
                            <h4 class="modal-title" id="modal-header">New Target</h4>
                        </div>
                        <div class="modal-body container-fluid">

                            <input id="TargetID" name="TargetID" type="hidden" value="0" />
                            
                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right"><span style="color: red">*</span>Executive</label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <select  class="chosen-select form-control form-control col-xs-4 col-md-4 col-lg-2 input-sm"  name="ExecutiveName" id="ExecutiveName" style="width: 100%" ></select>
                                </div>
                            </div>
                            
                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right"><span style="color: red">*</span>Target</label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="text" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2 PasteDisable" onkeypress="return NumberOnly(event,this);" name="Target" id="Target" style="width: 100%" />
                                </div>
                            </div>
                            
                            <div class="form-group form-group-sm Expences" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right">From Date(<%=DateFormatForDatePicker.ToUpper()%>)</label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="tel" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2" name="FromDate" id="FromDate" style="width: 100%" readonly="readonly"/>
                                </div>
                            </div>
                            
                            <div class="form-group form-group-sm Expences" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right">To Date(<%=DateFormatForDatePicker.ToUpper()%>)</label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="tel" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2" name="ToDate" id="ToDate" style="width: 100%" readonly="readonly"/>
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

        <div id="TARGET_LIST_MODAL" class="modal fade bs-example-modal-sm" tabindex="-1" style="top: 15%; overflow: hidden; overflow-y: scroll">
            <div class="modal-dialog modal-lg" style="width:60%">
                <div class="modal-content" style="-ms-border-top-left-radius: 10px; border-top-left-radius: 10px; -ms-border-top-right-radius: 10px; border-top-right-radius: 10px">
                    <div class="modal-header" style="padding: 10px; height: 40px; color: white; background-color: #00a0af; -ms-border-top-left-radius: 5px; border-top-left-radius: 5px; -ms-border-top-right-radius: 5px; border-top-right-radius: 5px">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="margin-top: -9px; -ms-opacity: 10; opacity: 10"><span aria-hidden="true" style="color: #D43F3A">&times;</span></button>
                            <h4 class="modal-title">Target(s)</h4></div>
                    <div class="modal-body container-fluid">
                        <input type="hidden" name="EXEID" id="EXEID" value="0"/>
                        <table class="footable table  toggle-arrow-circle-filled" data-page-size="50" id="TARGET_LIST" data-limit-navigation="1">
                            <thead>
                                <tr>
                                    <th style="-moz-min-width: 55px; -ms-min-width: 55px; -o-min-width: 55px; -webkit-min-width: 55px; min-width: 55px; text-align: left" data-sort-ignore="true"></th>
                                    <th style="-moz-min-width: 140px; -ms-min-width: 140px; -o-min-width: 140px; -webkit-min-width: 140px; min-width: 140px">Executive Name</th>
                                    <th style="-moz-min-width: 121px; -ms-min-width: 121px; -o-min-width: 121px; -webkit-min-width: 121px; min-width: 121px">Target</th>
                                    <th style="-moz-min-width: 110px; -ms-min-width: 110px; -o-min-width: 110px; -webkit-min-width: 110px; min-width: 110px">From Date(MM/DD/YYYY)</th>
                                    <th style="-moz-min-width: 110px; -ms-min-width: 110px; -o-min-width: 110px; -webkit-min-width: 110px; min-width: 110px">To Date(MM/DD/YYYY)</th>
                                    <th style="-moz-min-width: 121px; -ms-min-width: 121px; -o-min-width: 121px; -webkit-min-width: 121px; min-width: 121px">Active</th>
                                </tr>
                            </thead>
                            <tbody id="TARGET_LIST_BODY"></tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.3/css/bootstrapValidator.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.3/js/bootstrapValidator.js" type="text/javascript"></script>
    <script>
        jQuery(function () {
            $('#TableFoot').append(TableFoot(7));
            $('.footable').footable();
            GET_TARGET_RELATED_DATA();
            if ('<%=Convert.ToInt32(Request.Cookies["UserRole"].Value)%>' == 2) {
                $(".circle").remove();
            }
            $('#AddTargetModal').on('hidden.bs.modal', function () {
                $("#TargetDetailsForm").bootstrapValidator('resetForm', true);
                $("#Active").prop('checked', true);
                $('select').val(0);
                $("#Report").val(1);
            });
            $('input.PasteDisable').on('paste', function () {
                alert("paste not allowed.");
                return false;
            });

            $('#ExportMethod').click(function () {
                var url = window.location + '?ReportType=' + $("#Report").val();
                window.location = url;
            });

            $('#TargetDetailsForm').bootstrapValidator({
                message: 'This value is not valid',
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                excluded: ':disabled',
                fields: {
                    Target: {
                        validators: {
                            notEmpty: {
                                message: 'Please Enter Target'
                            }
                        }
                    },
                    ExecutiveName: {
                        validators: {
                            callback: {
                                message: 'Please Select Executive',
                                callback: function (value, validator) {
                                    var options = validator.getFieldElements('ExecutiveName').val();
                                    return (options != "-1");
                                }
                            }
                        }
                    }
                }
            }).on('success.form.bv', function (e) {
                e.preventDefault();
                var dataCollection = {};
                dataCollection.TargetID = $("#TargetID").val();
                dataCollection.ExecutiveName = $("#ExecutiveName").val();
                dataCollection.Target = $("#Target").val();
                dataCollection.FromDate = $("#FromDate").val();
                dataCollection.ToDate = $("#ToDate").val();
                dataCollection.Active = $("#Active").is(':checked');
                $.ajax({
                    url: "Target.aspx/TARGET_INSERT_UPDATRE",
                    data: JSON.stringify(dataCollection),
                    type: "POST",
                    async: false,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        if (data.d == "") {
                            if ($("#TargetID").val() != "0") {
                                $("#AlertMessage").finish().removeClass().addClass('alert alert-success').slideDown(window.InTimeinMicSec).delay(window.DelayTimeInMicSec).slideUp(window.OutTimeInMicSec).children('strong', this).empty().text('Success!').parent().children('span:first', this).empty().html('Succesfully <a href="#" onclick="EditRecord(' + $("#TargetID").val() + ')">Executive Target</a> Updated.');
                                ListOfRecord($("#ExecutiveName").val());
                                GET_TARGET_RELATED_DATA();
                            }
                            else {
                                $("#AlertMessage").finish().removeClass().addClass('alert alert-success').slideDown(window.InTimeinMicSec).delay(window.DelayTimeInMicSec).slideUp(window.OutTimeInMicSec).children('strong', this).empty().text('Success!').parent().children('span:first', this).empty().html('Succesfully New Executive Target Saved.');
                                ListOfRecord($("#ExecutiveName").val());
                                GET_TARGET_RELATED_DATA();
                            }
                            $('.modal').modal('hide');
                        }
                        else {
                            alert(data.d);
                            $('#TargetDetailsForm').bootstrapValidator('revalidateField', $('#ExecutiveName'));
                        }
                    }
                });
            });
        });
        function NewRecord() {
            $("#modal-header").empty().text("New Target");
            $('#SaveBtn').empty().html('<span class="glyphicon glyphicon-ok"></span>&nbsp;Save');
            $("#FromDate").datepicker({
                
                changeMonth: true,
                changeYear: true,
                onClose: function (selectedDate) {
                    $("#ToDate").datepicker("option", "minDate", selectedDate);
                }
            }).datepicker("setDate", new Date());
            $("#ToDate").datepicker({
                
                changeMonth: true,
                changeYear: true
            }).datepicker("setDate", new Date());
            ExecutiveDropDown(null);
            $("#TargetID").val(0);
            $('#AddTargetModal').modal({ backdrop: 'static', keyboard: false }).on('shown.bs.modal', function () {
                $(this).find('#ExecutiveName').focus();
            });
        }
        function GET_TARGET_RELATED_DATA() {
            $.ajax({
                type: "POST",
                url: "Target.aspx/TARGET_GET",
                data: {},
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var rows = "";
                    $("#TargetData").empty();
                    var xmlDoc = $.parseXML(data.d);
                    var xml = $(xmlDoc);
                    var getEnquiresUserLevel = xml.find("Table");
                    if (getEnquiresUserLevel.length > 0) {
                        $("#TargetCount").empty().text(getEnquiresUserLevel.length);
                        $('#ReportCollasseButton').show();
                        $.each(getEnquiresUserLevel, function () {
                            var listOfRecord = '<a onclick="javascript:ListOfRecord(' + $(this).find("USERID").text() + ')" style="cursor:pointer;"><span class="glyphicon glyphicon-th-list" style="color:black" title="List Of Records"></span></a>';
                            var editRecord = '<a onclick="javascript:EditRecord(' + $(this).find("ID").text() + ')" style="cursor:pointer;"><span class="glyphicon glyphicon glyphicon-edit EDIT-ICON" style="color:black" title="Edit This Record"></span></a>';
                            var deleteRecord = '<a onclick="javascript:InActiveRecord(' + $(this).find("ID").text() + ')" style="cursor:pointer;"><span class="glyphicon glyphicon glyphicon-remove REMOVE-ICON" style="color:red;padding-left:5px" title="Remove This Record"></span></a>';
                            if ('<%=Convert.ToInt32(Request.Cookies["UserRole"].Value)%>' == 2) {
                                editRecord = "";
                                deleteRecord = "";
                            }
                            rows += '<tr>' +
                                    '<td style="text-align:center">' + listOfRecord + '</td>' +
                                    '<td>' + $(this).find("EXECUTIVE_NAME").text() + '</td>' +
                                    '<td>' + $(this).find("TARGET").text() + '</td>' +
                                    '<td>' + $(this).find("FROM_DATE").text() + '</td>' +
                                    '<td>' + $(this).find("TO_DATE").text() + '</td>' +
                                    '<td>' + $(this).find("RECOVERED_AMOUNT").text() + '</td>' +
                                    '<td>' + $(this).find("PERCENTAGE").text() + '</td>' +
                                    '</tr>';
                        });
                        $("#TargetData").append(rows);
                    }
                    else {
                        $("#TargetData").append('<tr><td colspan="7" style="text-align:center"> No Data To Display</td></tr>');
                        $('#ReportCollasseButton').hide();
                        $("#ReportCollassePanel").removeClass("in");
                        $("#TargetCount").empty().text(0);
                    }
                    $('.footable').trigger('footable_initialize');
                }
            });
        }
        function EditRecord(targetId) {
            $.ajax({
                type: "POST",
                url: "Target.aspx/TARGET_GET_EDIT",
                data: '{"TargetID":"' + targetId + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var xmlDoc = $.parseXML(data.d);
                    var xml = $(xmlDoc);
                    var getEnquiresUserLevel = xml.find("Table");
                    $.each(getEnquiresUserLevel, function () {
                        $("#modal-header").empty().text("Edit Target");
                        $('#SaveBtn').empty().html('<span class="glyphicon glyphicon-ok"></span>&nbsp;Update');
                        $("#TargetID").val($(this).find("ID").text());
                        ExecutiveDropDown($(this).find("USERID").text());
                        $("#FromDate").datepicker({
                            
                            changeMonth: true,
                            changeYear: true
                        }).datepicker("setDate", new Date($(this).find("FROM_DATE").text()));
                        $("#ToDate").datepicker({
                            
                            changeMonth: true,
                            changeYear: true
                        }).datepicker("setDate", new Date($(this).find("TO_DATE").text()));
                        $("#Target").val($(this).find("TARGET").text());
                        if ($(this).find("ACTIVE").text().toLowerCase() == "true") {
                            $("#Active").prop('checked', true);
                        }
                        else {
                            $("#Active").prop('checked', false);
                        }
                    });
                    $('.modal').modal('hide');
                    $('#AddTargetModal').modal({ backdrop: 'static', keyboard: false }).on('shown.bs.modal', function () {
                        $(this).find('#ExecutiveName').focus();
                    });
                }
            });
        }
        function InActiveRecord(id) {
            var delStatus = $("." + id + "STA").text();
            if (delStatus == "INACTIVE") {
                delStatus = "delete";
            }
            else {
                delStatus = "inactive";
            }
            if (confirm("Are you sure, do you want to " + delStatus + " this record? ")) {
                $.ajax({
                    type: "POST",
                    url: "Target.aspx/DELETE_TARGET",
                    data: '{"ID":"' + id + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        if (data.d == "") {
                            $("#AlertMessage").finish().removeClass().addClass('alert alert-danger').slideDown(window.OutTimeInMicSec).delay(window.DelayTimeInMicSec).slideUp(window.OutTimeInMicSec).children('strong', this).empty().text('Deleted!').parent().children('span:first', this).empty().html('Record succesfully inactive/deleted.');
                            ListOfRecord($("#EXEID").val());
                            GET_TARGET_RELATED_DATA();
                        }
                        else {
                            alert(data.d);
                        }
                    }
                });
            }
        }
        function ListOfRecord(id) {
            $.ajax({
                type: "POST",
                url: "Target.aspx/TARGET_LIST_GET",
                data: '{"EXID":"' + id + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    $("#EXEID").empty().val(id);
                    $("#TARGET_LIST_BODY").empty();
                    var xmlDoc = $.parseXML(data.d);
                    var xml = $(xmlDoc);
                    var getEnquiresUserLevel = xml.find("Table");
                    if (getEnquiresUserLevel.length > 0) {
                        var rows = "";
                        $.each(getEnquiresUserLevel, function () {
                            var editRecord = '<a onclick="javascript:EditRecord(' + $(this).find("ID").text() + ')" style="cursor:pointer;"><span class="glyphicon glyphicon-edit" style="color:black" title="List Of Records"></span></a>';
                            var deleteRecord = '<a onclick="javascript:InActiveRecord(' + $(this).find("ID").text() + ')" style="cursor:pointer;"><span class="glyphicon glyphicon glyphicon-remove REMOVE-ICON" style="color:red;padding-left:5px" title="Remove This Record"></span></a>';

                            if ('<%=Convert.ToInt32(Request.Cookies["UserRole"].Value)%>' == 2) {
                                editRecord = "";
                                deleteRecord = "";
                            }
                            var rStatus = "";
                            if ($(this).find("ACTIVE").text().toLowerCase() == "true") {
                                rStatus = '<span class="label label-success LBLACTIVE ' + $(this).find("ID").text() + 'STA"">ACTIVE</span>';
                            }
                            else {
                                rStatus = '<span class="label label-warning LBLINACTIVE ' + $(this).find("ID").text() + 'STA"">INACTIVE</span>';
                            }
                                rows += '<tr>' +
                                            '<td style="text-align:left">' + editRecord + deleteRecord + '</td>' +
                                            '<td style="text-align:left">' + $(this).find("LOGIN").text() + '</td>' +
                                            '<td style="text-align:left">' + $(this).find("TARGET").text() + '</td>' +
                                            '<td style="text-align:left">' + $(this).find("FROM_DATE").text() + '</td>' +
                                            '<td style="text-align:left">' + $(this).find("TO_DATE").text() + '</td>' +
                                            '<td style="text-align:left">' + rStatus + '</td>' +
                                            '</tr>';
                        });
                        $("#TARGET_LIST_BODY").append(rows);
                    }
                    else {
                        $("#TARGET_LIST_BODY").append('<tr><td colspan="6" style="text-align:center"> No Data To Display</td></tr>');
                    }
                    $('#TARGET_LIST').trigger('footable_initialize');
                    $('#TARGET_LIST_MODAL').modal();
                }
            });
        }
        function ExecutiveDropDown(id) {
            $.ajax({
                type: "POST",
                url: "Target.aspx/EXECUTIVE_DROPDOEN_GET",
                data: {},
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    $("#ExecutiveName").empty();
                    var xmlDoc = $.parseXML(data.d);
                    var xml = $(xmlDoc);
                    var executiveDropDownT = xml.find("Table");
                    if (executiveDropDownT.length > 0) {
                        $("#ExecutiveName").append('<option value="-1">-- Select --</option>');
                        $.each(executiveDropDownT, function () {
                            $("#ExecutiveName").append('<option value="' + $(this).find("USERID").text() + '">' + $(this).find("LOGIN").text() + '</option>');
                        });
                        if (id != null) {
                            $("#ExecutiveName").val(id);
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
                    $("#Manager").trigger("chosen:updated");
                }
            });
        }
    </script>
</asp:Content>