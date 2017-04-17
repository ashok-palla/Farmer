<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Farmer.aspx.cs" MasterPageFile="~/MasterPage/CRMaster.master" Inherits="Masters_Farmer" %>

<asp:Content ContentPlaceHolderID="CRMasterHead" runat="server"></asp:Content>
<asp:Content ContentPlaceHolderID="CRMasterBody" runat="server">
    <script src="../APPRequires/FooTable/js/footable.js"></script>
    <script src="../APPRequires/FooTable/js/footable.filter.js"></script>
    <script src="../APPRequires/FooTable/js/footable.sort.js"></script>
    <script src="../APPRequires/FooTable/js/footable.paginate.js"></script>
    <link href="../APPRequires/FooTable/css/footable.core.css" rel="stylesheet" />
    <link href="../APPRequires/FooTable/css/footable.metro.css" rel="stylesheet" />
    <div class="page-header">
        <h3>Farmer Details <span class="badge" id="UserCount"></span></h3>
    </div>
    <div class="panel-body PagePanelBody">

        <input type="text" class="form-control SEARCH_BOX" placeholder="Search Here" id="Create_Customer_Search" />

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

        <table class="footable table  toggle-arrow-circle-filled" id="CreateCustomerTable" data-filter="#Create_Customer_Search" data-page-size="10" data-limit-navigation="1">
            <thead>
                <tr>
                    <th data-sort-ignore="true" style="text-align: center; color: white; display: table-cell; vertical-align: middle; -moz-min-width: 55px; -ms-min-width: 55px; -o-min-width: 55px; -webkit-min-width: 55px; min-width: 55px">
                        <input type="button" class="button circle" style="height: 30px;" value="+" onclick="NewRecord();" title="Add New Record" /></th>
                    <th style="-moz-min-width: 135px; -ms-min-width: 135px; -o-min-width: 135px; -webkit-min-width: 135px; min-width: 135px">Name</th>
                    <th style="-moz-min-width: 114px; -ms-min-width: 114px; -o-min-width: 114px; -webkit-min-width: 114px; min-width: 114px" data-hide="phone, tablet">Location</th>
                    <th data-hide="phone, tablet" style="-moz-min-width: 113px; -ms-min-width: 113px; -o-min-width: 113px; -webkit-min-width: 113px; min-width: 113px">Contact No</th>
                    <th data-hide="phone, tablet" style="-moz-min-width: 105px; -ms-min-width: 105px; -o-min-width: 105px; -webkit-min-width: 105px; min-width: 105px">PAN No</th>
                    <th data-hide="phone" style="-moz-min-width: 111px; -ms-min-width: 111px; -o-min-width: 111px; -webkit-min-width: 111px; min-width: 111px">Bank Account No</th>
                    <th style="-moz-min-width: 81px; -ms-min-width: 81px; -o-min-width: 81px; -webkit-min-width: 81px; min-width: 81px">Status</th>
                </tr>
            </thead>
            <tbody id="UserData">
            </tbody>
            <tfoot class="hide-if-no-paging" id="TableFoot"></tfoot>
        </table>

        <%--<ul class="pagination pagination-sm">
            <li style="cursor: pointer">
                <span aria-hidden="true" style="border: none">&laquo;</span>
            </li>
            <li><span style="-ms-border-radius: 10px; border-radius: 10px; border: 2px solid #ffffff">1/3</span></li>
            <li style="cursor: pointer">
                <span aria-hidden="true" style="border: none">&raquo;</span>
            </li>
        </ul>--%>

        <form id="UserDetailsForm" class="form-horizontal" method="post">

            <div id="AddUserModal" class="modal fade bs-example-modal-sm" tabindex="-1" style="top: 15%; overflow: hidden; overflow-y: scroll">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content" style="-ms-border-top-left-radius: 10px; border-top-left-radius: 10px; -ms-border-top-right-radius: 10px; border-top-right-radius: 10px">
                        <div class="modal-header" style="padding: 10px; height: 40px; color: white; background-color: #00a0af; -ms-border-top-left-radius: 5px; border-top-left-radius: 5px; -ms-border-top-right-radius: 5px; border-top-right-radius: 5px">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="margin-top: -9px; -ms-opacity: 10; opacity: 10"><span aria-hidden="true" style="color: #D43F3A">&times;</span></button>
                            <h4 class="modal-title" id="modal-header">New User</h4>
                        </div>
                        <div class="modal-body container-fluid">

                            <input id="FarmerID" name="FarmerID" type="hidden" value="0" />

                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right"><span style="color: red">*</span>Name </label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="text" class="form-control form-control col-xs-4 col-md-4 col-lg-2 input-sm PasteDisable" onkeypress="return CharectersAndNumbersOnly(event)" name="Name" id="Name" style="width: 100%; text-transform: uppercase" />
                                </div>
                            </div>

                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right"><span style="color: red">*</span>Location</label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="text" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2 PasteDisable" onkeypress="return CharectersWithSpace(event,this);" name="Location" id="Location" style="width: 100%" />
                                </div>
                            </div>

                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right"><span style="color: red">*</span>Contact NO</label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="text" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2 PasteDisable" onkeypress="return NumberOnly(event,this);" name="ContactNo" id="ContactNo" style="width: 100%" />
                                </div>
                            </div>

                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right"><span style="color: red">*</span>PAN No</label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="tel" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2 PasteDisable" onkeypress="return CharectersWithSpace(event,this);" name="PanNo" id="PanNo" style="width: 100%" />
                                </div>
                            </div>

                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right"><span style="color: red">*</span>Bank Account No </label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="text" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2" onkeypress="return RistrictSpaces(event)" name="BankAccountNo" id="BankAccountNo" style="width: 100%" />
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
        var UserID = null;
        var UserRole = null;
        var Status = new Array();
        jQuery(function () {
            $('#TableFoot').append(TableFoot(7));
            $('.footable').footable();
            GET_USER_RELATED_DATA();
            $('#AddUserModal').on('hidden.bs.modal', function () {
                $("#UserDetailsForm").bootstrapValidator('resetForm', true);
                $("#UserID").val(0);
                $("#Report").val(1);
            });
            if ('<%=Convert.ToInt32(Request.Cookies["UserRole"].Value)%>' != 0 && '<%=Convert.ToInt32(Request.Cookies["UserRole"].Value)%>' != 3) {
                $(".IsAdmin").remove();
            }
            UserExistOrNot();
            //#region User Role Check
            $.ajax({
                type: "POST",
                url: "Farmer.aspx/USERROLECHECK",
                data: {},
                contentType: "application/json; charset=utf-10",
                dataType: "json",
                success: function (data) {
                    if (data.d != null) {
                        if (data.d.length > 0) {
                            UserID = data.d.split('_')[0];
                            UserRole = data.d.split('_')[1];
                            $('#UserDetailsForm').bootstrapValidator('removeField', $('#Manager'));
                            $('#UserDetailsForm').bootstrapValidator('removeField', $('#UserRole'));
                            $("#UserRoleRow").remove();
                            $("#ManagerRow").remove();
                        }
                        else {
                            $('#UserDetailsForm').bootstrapValidator('addField', $('#Manager'));
                            $('#UserDetailsForm').bootstrapValidator('addField', $('#UserRole'));
                            UserID = null;
                            UserRole = null;
                        }
                    }
                }
            });
            //#endregion
            $('#ExportMethod').click(function () {
                var url = window.location + '?ReportType=' + $("#Report").val();
                window.location = url;
            });
            
            $('#UserDetailsForm').bootstrapValidator({
                message: 'This value is not valid',
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                excluded: ':disabled',
                fields: {
                    Name: {
                        validators: {
                            notEmpty: {
                                message: 'Please Enter Name'
                            },
                            stringLength: {
                                message: 'Name Must Contain Minimum 4 Characters and should not Exceed 20 Characters.',
                                max: function (value) {
                                    return 20 - (value.match(/\r/g) || []).length;
                                }
                            }
                        }
                    },
                    Location: {
                        validators: {
                            notEmpty: {
                                message: 'Please Enter Location'
                            },
                            stringLength: {
                                message: 'Name Must Contain Minimum 4 Characters and should not Exceed 150 Characters.',
                                max: function (value) {
                                    return 150 - (value.match(/\r/g) || []).length;
                                }
                            }
                        }
                    },
                    ContactNo: {
                        validators: {
                            notEmpty: {
                                message: 'Please Enter Valid Mobile Number'
                            },
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
                    }
                }
            }).on('success.form.bv', function (e) {
                e.preventDefault();
                var dataCollection = {};
                dataCollection.FarmerID = $("#FarmerID").val();
                dataCollection.Name = $("#Name").val().toUpperCase();
                dataCollection.Location = $("#Location").val();
                dataCollection.ContactNo = $("#ContactNo").val();
                dataCollection.PanNo = $("#PanNo").val();
                dataCollection.BankAccountNo = $("#BankAccountNo").val();
                dataCollection.Active = $("#Active").is(':checked');
                $.ajax({
                    url: "Farmer.aspx/INSERTANDUPDATEFARMERDETAILS",
                    data: JSON.stringify(dataCollection),
                    type: "POST",
                    async: false,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        if ($("#FarmerID").val() != "0") {
                            $("#AlertMessage").finish().removeClass().addClass('alert alert-success').slideDown(window.InTimeinMicSec).delay(window.DelayTimeInMicSec).slideUp(window.OutTimeInMicSec).children('strong', this).empty().text('Success!').parent().children('span:first', this).empty().html('Succesfully <a href="#" onclick="EditRecord(' + $("#FarmerID").val() + ')">' + $("#Name").val() + '</a> Updated.');
                        }
                        else {
                            $("#AlertMessage").finish().removeClass().addClass('alert alert-success').slideDown(window.InTimeinMicSec).delay(window.DelayTimeInMicSec).slideUp(window.OutTimeInMicSec).children('strong', this).empty().text('Success!').parent().children('span:first', this).empty().html('Succesfully New User Saved.');
                        }
                        $('.modal').modal('hide');
                        GET_USER_RELATED_DATA();
                    }
                });
            });
        });
        function UserExistOrNot() {
            //#region User Name checking if it is exist or not
            $.ajax({
                type: "POST",
                url: "Farmer.aspx/GET_USER_NAME_EXIST_OR_NOT",
                data: {},
                contentType: "application/json; charset=utf-10",
                dataType: "json",
                success: function (data) {
                    window.status = null;
                    if (data.d != null) {
                        if (data.d.length > 0) {
                            for (var i in data.d) {
                                if (data.d.hasOwnProperty(i)) {
                                    Status.push(data.d[i].CustomerId);
                                }
                            }
                        }
                    }
                }
            });
            //#endregion
        }

        function NewRecord() {
            $(".IsAdmin").hide();
            UserExistOrNot();
            $("#modal-header").empty().text("New Farmer");
            $('#SaveBtn').empty().html('<span class="glyphicon glyphicon-ok"></span>&nbsp;Save');
            $("#Active").prop('checked', true);
            $("#Report").val(1);
            $("#PanNo,#BankAccountNo").text('');
            $('#AddUserModal').modal({ backdrop: 'static', keyboard: false }).on('shown.bs.modal', function () { $(this).find('#Name').focus(); });
        }
        function GET_USER_RELATED_DATA() {
            $.ajax({
                type: "POST",
                url: "Farmer.aspx/GET_FARMER_RELATED_DATA",
                data: JSON.stringify({ "FarmerID": null }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    $("#UserData").empty();
                    var xmlDoc = $.parseXML(data.d);
                    var xml = $(xmlDoc);
                    var getEnquiresUserLevel = xml.find("Table");
                    if (getEnquiresUserLevel.length > 0) {
                        $("#UserCount").empty().text(getEnquiresUserLevel.length);
                        $("#ReportCollasseButton").show();
                        var rows = "";
                        $.each(getEnquiresUserLevel, function () {
                            var editRecord = '<a onclick="javascript:EditRecord(' + $(this).find("FarmerID").text() + ')" style="cursor:pointer;"><span class="glyphicon glyphicon glyphicon-edit EDIT-ICON" style="color:black" title="Edit This Record"></span></a>';
                            var status = "";
                            if ($(this).find("Active").text().toLowerCase() == "true") {
                                status = '<span class="label label-success LBLACTIVE">Active</span>';
                            }
                            else {
                                status = '<span class="label label-warning LBLINACTIVE">Inactive</span>';
                            }
                            rows += '<tr>' +
                                '<td style="text-align:center">' + editRecord + '</td>' +
                                '<td>' + $(this).find("Name").text() + '</td>' +
                                '<td>' + $(this).find("Location").text() + '</td>' +
                                '<td>' + $(this).find("ContactNo").text() + '</td>' +
                                '<td>' + $(this).find("PanNo").text() + '</td>' +
                                '<td>' + $(this).find("BankAccountNo").text() + '</td>' +
                                '<td style="text-align:center">' + status + '</td>' +
                                '</tr>';
                        });
                        $("#UserData").append(rows);
                    }
                    else {
                        $("#UserData").append('<tr><td colspan="13" style="text-align:center"> No Data To Display</td></tr>');
                        $("#ReportCollasseButton").hide();
                        $("#ReportCollassePanel").removeClass("in");
                        $("#UserCount").empty().text(0);
                    }
                    $('.footable').trigger('footable_initialize');
                }
            });
        }
        function EditRecord(farmerID) {
            $.ajax({
                type: "POST",
                url: "Farmer.aspx/FARMER_GET_EDIT",
                data: '{"EditFarmerID":"' + farmerID + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var xmlDoc = $.parseXML(data.d);
                    var xml = $(xmlDoc);
                    var edituserdata = xml.find("Table");
                    $.each(edituserdata, function () {
                        $("#modal-header").empty().text("Edit Farmer - " + $(this).find("Name").text());
                        $('#SaveBtn').empty().html('<span class="glyphicon glyphicon-ok"></span>&nbsp;Update');
                        $("#FarmerID").val($(this).find("FarmerID").text());
                        $("#Name").val($(this).find("Name").text());
                        $("#Location").val($(this).find("Location").text());
                        $("#ContactNo").val($(this).find("ContactNo").text());
                        $("#PanNo").val($(this).find("PanNo").text());
                        $("#BankAccountNo").val($(this).find("BankAccountNo").text());
                        if ($(this).find("Active").text().toLowerCase() == "true") {
                            $("#Active").prop('checked', true);
                        }
                        else {
                            $("#Active").prop('checked', false);
                        }
                    });

                    $(".page-header").css('left', '0');
                    $("#UserName").focus();
                    $('#AddUserModal').modal({ backdrop: 'static', keyboard: false });
                }
            });

        }
    </script>
</asp:Content>
