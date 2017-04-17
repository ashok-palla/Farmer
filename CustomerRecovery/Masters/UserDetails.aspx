<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserDetails.aspx.cs" Inherits="Masters.Masters_UserDetails" MasterPageFile="~/MasterPage/CRMaster.master" Title="User Details" %>

<asp:Content ContentPlaceHolderID="CRMasterHead" runat="server"></asp:Content>
<asp:Content ContentPlaceHolderID="CRMasterBody" runat="server">
    <script src="../APPRequires/FooTable/js/footable.js"></script>
    <script src="../APPRequires/FooTable/js/footable.filter.js"></script>
    <script src="../APPRequires/FooTable/js/footable.sort.js"></script>
    <script src="../APPRequires/FooTable/js/footable.paginate.js"></script>
    <link href="../APPRequires/FooTable/css/footable.core.css" rel="stylesheet" />
    <link href="../APPRequires/FooTable/css/footable.metro.css" rel="stylesheet" />
    <div class="page-header">
        <h3>User Details <span class="badge" id="UserCount"></span></h3>
    </div>
    <div class="panel-body PagePanelBody">

        <input type="text" class="form-control SEARCH_BOX" placeholder="Search Here" id="Create_Customer_Search"/>

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
                    <th style="-moz-min-width: 135px; -ms-min-width: 135px; -o-min-width: 135px; -webkit-min-width: 135px; min-width: 135px">User Name</th>
                    <th style="-moz-min-width: 114px; -ms-min-width: 114px; -o-min-width: 114px; -webkit-min-width: 114px; min-width: 114px" data-hide="phone, tablet">First Name</th>
                    <th data-hide="phone, tablet" style="-moz-min-width: 113px; -ms-min-width: 113px; -o-min-width: 113px; -webkit-min-width: 113px; min-width: 113px">Last Name</th>
                    <th data-hide="phone, tablet" style="-moz-min-width: 105px; -ms-min-width: 105px; -o-min-width: 105px; -webkit-min-width: 105px; min-width: 105px">Email ID</th>
                    <th data-hide="phone" style="-moz-min-width: 111px; -ms-min-width: 111px; -o-min-width: 111px; -webkit-min-width: 111px; min-width: 111px">Mobile No.</th>
                    <th data-hide="all" style="-moz-min-width: 94px; -ms-min-width: 94px; -o-min-width: 94px; -webkit-min-width: 94px; min-width: 94px">Address</th>
                    <th data-hide="phone, tablet" style="-moz-min-width: 94px; -ms-min-width: 94px; -o-min-width: 94px; -webkit-min-width: 94px; min-width: 94px">City</th>
                    <th data-hide="phone" style="-moz-min-width: 110px; -ms-min-width: 110px; -o-min-width: 110px; -webkit-min-width: 110px; min-width: 110px">Role</th>
                    <th data-hide="phone" style="-moz-min-width: 110px; -ms-min-width: 110px; -o-min-width: 110px; -webkit-min-width: 110px; min-width: 110px">Manager</th>
                    <%--<th data-hide="phone" style="min-width: 110px">Empanelment date</th>
                    <th data-hide="phone" style="min-width: 110px">Valid upto</th>--%>
                    <th data-hide="phone" style="-moz-min-width: 110px; -ms-min-width: 110px; -o-min-width: 110px; -webkit-min-width: 110px; min-width: 110px">Years of Exp. </th>
                    <th data-hide="phone" style="-moz-min-width: 110px; -ms-min-width: 110px; -o-min-width: 110px; -webkit-min-width: 110px; min-width: 110px">DOJ(MM/DD/YYYY) </th>
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

                            <input id="UserID" name="UserID" type="hidden" value="0" />

                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right"><span style="color: red">*</span>User Name </label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="text" class="form-control form-control col-xs-4 col-md-4 col-lg-2 input-sm PasteDisable" onkeypress="return CharectersAndNumbersOnly(event)" name="UserName" id="UserName" style="width: 100%; text-transform: uppercase" />
                                </div>
                            </div>

                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right"><span style="color: red">*</span>First Name </label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="text" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2 PasteDisable" onkeypress="return CharectersWithSpace(event,this);" name="FirstName" id="FirstName" style="width: 100%" />
                                </div>
                            </div>

                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right"><span style="color: red">*</span>Last Name </label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="text" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2 PasteDisable" onkeypress="return CharectersWithSpace(event,this);" name="LastName" id="LastName" style="width: 100%" />
                                </div>
                            </div>

                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right"><span style="color: red">*</span>Mobile No.</label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="tel" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2 PasteDisable" onkeypress="return NumberOnly(event,this);" name="PHNumber" id="PHNumber" style="width: 100%" />
                                </div>
                            </div>

                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right"><span style="color: red">*</span>Email Address </label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="text" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2" onkeypress="return RistrictSpaces(event)" name="EmailAddress" id="EmailAddress" style="width: 100%" />
                                </div>
                            </div>

                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right"><span id="PassSp" style="color: red">*</span>Password </label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="password" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2" maxlength="30" name="Password" id="Password" style="width: 100%" />
                                </div>
                            </div>

                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right"><span id="RetypeSp" style="color: red">*</span>Confirm Password </label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="password" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2" maxlength="30" name="RetypePassword" id="RetypePassword" style="width: 100%" />
                                    <span hidden="hidden" class="error">Password and Confirm Password does not match</span>
                                </div>
                            </div>



                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right">&nbsp;Address </label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <textarea aria-multiline="true" rows="4" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2" name="Address" id="Address" style="width: 100%"></textarea>
                                </div>
                            </div>

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

                            <div class="form-group form-group-sm" style="margin-bottom: 0" id="UserRoleRow">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right;"><span style="color: red">*</span>User Role </label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <select id="UserRole" name="UserRole" class="form-control">
                                        <option value="0">-- Select --</option>
                                        <option value="1">Manager</option>
                                        <option value="2">Executive</option>
                                    </select>
                                </div>
                            </div>


                            <div class="form-group form-group-sm" style="margin-bottom: 0" id="ManagerRow" hidden>
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right"><span style="color: red">*</span>Manager </label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <select class="chosen-select form-control form-control col-xs-4 col-md-4 col-lg-2 input-sm" name="Manager" id="Manager" style="width: 100%"></select>
                                </div>
                            </div>


                            <%--   <div class="form-group form-group-sm" style="margin-bottom: 0px" id="FileUploadDiv">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right"><span style="color: red"></span>Select User Photo</label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="file" id="UserFileUpload" class="filestyle" name="FileUpload" data-buttontext="Find file" style="width: 100%" title="Select User Photo">
                                </div>
                            </div>--%>

                            <%--       <div class="form-group form-group-sm Expences" style="margin-bottom: 0px">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right"><span style="color: red">*</span>Empanelment date </label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="tel" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2" name="Empanelmentdate" id="Empanelmentdate" style="width: 100%" readonly="true" />
                                </div>
                            </div>
                            
                            <div class="form-group form-group-sm Expences" style="margin-bottom: 0px">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right"><span style="color: red">*</span>Valid upto </label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="tel" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2" name="Validupto" id="Validupto" style="width: 100%" readonly="true" />
                                </div>
                            </div>--%>

                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right"><span style="color: red">*</span>Years of Experience </label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="tel" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2 PasteDisable" onkeypress="return Percentage(event,this);" name="YearsofExperience" id="YearsofExperience" style="width: 100%" />
                                </div>
                            </div>

                            <div class="form-group form-group-sm Expences" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right"><span style="color: red">*</span>Date of Joining(<%=DateFormatForDatePicker.ToUpper()%>) </label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="tel" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2" name="DOJ" id="DOJ" style="width: 100%" readonly="readonly" />
                                </div>
                            </div>

                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right">Active </label>
                                <div class="col-lg-6" style="padding-top: 1%">
                                    <input type="checkbox" id="Active" name="Active" checked="checked" />
                                </div>
                            </div>

                            <div class="form-group form-group-sm IsAdmin" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right">Is Admin </label>
                                <div class="col-lg-6" style="padding-top: 1%">
                                    <input type="checkbox" id="IsAdmin" name="IsAdmin" />
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
            $('#TableFoot').append(TableFoot(13));
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
            $("#RetypePassword, #Password").keyup(function () {
                if (parseInt($("#UserID").val()) != 0) {
                    if (($("#RetypePassword").val().length > 0 || $("#Password").val().length > 0)) {
                        $('#UserDetailsForm').bootstrapValidator('enableFieldValidators', 'Password', true);
                        $('#UserDetailsForm').bootstrapValidator('enableFieldValidators', 'RetypePassword', true);
                        $('#UserDetailsForm').bootstrapValidator('revalidateField', $('#Password'));
                        $('#UserDetailsForm').bootstrapValidator('revalidateField', $('#RetypePassword'));
                    }
                    else {
                        $('#UserDetailsForm').bootstrapValidator('enableFieldValidators', 'Password', false);
                        $('#UserDetailsForm').bootstrapValidator('enableFieldValidators', 'RetypePassword', false);
                        $('#UserDetailsForm').bootstrapValidator('revalidateField', $('#Password'));
                        $('#UserDetailsForm').bootstrapValidator('revalidateField', $('#RetypePassword'));
                    }
                }
            });
            //window.onkeyup = function (e) {
            //    if (e.keyCode == 17) { NewRecord(); };
            //}
            //$('input.PasteDisable').on('paste', function () {
            //    alert("paste not allowed.")
            //    return false;
            //});
            UserExistOrNot();
            //#region User Role Check
            $.ajax({
                type: "POST",
                url: "UserDetails.aspx/USERROLECHECK",
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
            $("#UserRole").change(function () {
                if ($(this).val() == 1) {
                    $("#IsAdmin").prop('checked', false);
                }
            });
            $('#ExportMethod').click(function () {
                var url = window.location + '?ReportType=' + $("#Report").val();
                window.location = url;
            });

            $("#UserName").on('keyup keypress paste change', function () {
                //$("#UserName").val($("#UserName").val().toLocaleUpperCase());
                $('#UserDetailsForm').bootstrapValidator('revalidateField', $("#UserName"));
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
                    UserName: {
                        validators: {
                            callback: {
                                callback: function (value) {
                                    if (value.length == 0) {
                                        return {
                                            valid: false,
                                            message: 'User name is required'
                                        };
                                    }
                                    else if (value.length < 4) {
                                        return {
                                            valid: false,
                                            message: 'User name must be 4 characters'
                                        };
                                    }
                                    else if (value.length > 20) {
                                        return {
                                            valid: false,
                                            message: 'User name must not be excced 20 characters'
                                        };
                                    }
                                    else if (Status.length > 0) {
                                        for (var j in Status)
                                            if (Status.hasOwnProperty(j))
                                                if (Status[j] == value.toUpperCase()) {
                                                    return {
                                                        valid: false,
                                                        message: 'User name is already Exists'
                                                    };
                                                }
                                    }
                                    return true;
                                }
                            },
                            regexp: {
                                regexp: /^[a-z0-9-_@.]+$/i,
                                message: 'please enter charecters and numbers only'
                            }
                        }
                    },
                    FirstName: {
                        validators: {
                            notEmpty: {
                                message: 'Please Enter First Name'
                            },
                            stringLength: {
                                message: 'FIRST Name Must Contain Minimum 4 Characters and should not Exceed 20 Characters.',
                                max: function (value) {
                                    return 20 - (value.match(/\r/g) || []).length;
                                }
                            }
                        }
                    },
                    LastName: {
                        validators: {
                            notEmpty: {
                                message: 'Please Enter Last Name'
                            },
                            stringLength: {
                                message: 'LAST NAME Name Must Contain Minimum atleast 1 Character and should not Exceed 20 Characters',
                                min: 1,
                                max: function (value) {
                                    return 20 - (value.match(/\r/g) || []).length;
                                }
                            }
                        }
                    },
                    YearsofExperience: {
                        validators: {
                            callback: {
                                callback: function (value) {
                                    if (value.length == 0) {
                                        return {
                                            valid: false,
                                            message: 'Years of Experience is required'
                                        };
                                    }
                                    else if (value.length > 5) {
                                        return {
                                            valid: false,
                                            message: 'Years of Experience must be 5 digits'
                                        };
                                    }
                                    return true;
                                }
                            }
                        }
                    },
                    PHNumber: {
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
                    },
                    EmailAddress: {
                        validators: {
                            notEmpty: {
                                message: 'Please Enter Valid Email Address'
                            },
                            regexp: {
                                regexp: /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/,
                                message: 'Please Enter Valid Email Address'
                            }
                        }
                    },
                    Password: {
                        validators: {
                            notEmpty: {
                                message: 'Please enter Password'
                            },
                            identical: {
                                field: 'RetypePassword',
                                message: 'password and confirm password must be same'
                            },
                            callback: {
                                message: 'PASSWORD is not equal to CONFIRM PASSWORD',
                                callback: function (value) {
                                    if (value != $('#OldPassword').val()) {
                                        return true;
                                    }
                                    else {
                                        return false;
                                    }
                                }
                            }
                        }
                    },
                    RetypePassword: {
                        validators: {
                            notEmpty: {
                                message: 'Please enter confirm Password'
                            },
                            identical: {
                                field: 'Password',
                                message: 'password and confirm password must be same'
                            },
                            callback: {
                                message: 'PASSWORD is not equal to CONFIRM PASSWORD',
                                callback: function (value) {
                                    if (value != $('#OldPassword').val()) {
                                        return true;
                                    }
                                    else {
                                        return false;
                                    }
                                }
                            }
                        }
                    },
                    UserRole: {
                        validators: {
                            message: 'Please Select User Role',
                            callback: {
                                callback: function (value, validator) {
                                    var options = validator.getFieldElements('UserRole').val();
                                    if (options == "0") {
                                        $('#UserDetailsForm').bootstrapValidator('enableFieldValidators', 'Manager', false);
                                        $("#ManagerRow").hide();
                                        $(".IsAdmin").hide();
                                        return {
                                            valid: false,
                                            message: 'Please Select User Role'
                                        };
                                    }
                                    else if (options == "1") {
                                        $('#UserDetailsForm').bootstrapValidator('enableFieldValidators', 'Manager', false);
                                        $("#ManagerRow").hide();
                                        $(".IsAdmin").show();
                                        //$("#IsAdmin").prop('checked', false);
                                        return true;
                                    }
                                    else {
                                        ExecutiveDropDown();
                                        $('#UserDetailsForm').bootstrapValidator('enableFieldValidators', 'Manager', true);
                                        $("#ManagerRow").show();
                                        $(".IsAdmin").hide();
                                        return true;
                                    }
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
                    Manager: {
                        validators: {
                            callback: {
                                message: 'Please Select Manager',
                                callback: function (value, validator) {
                                    var options = validator.getFieldElements('Manager').val();
                                    return (options != "-1");
                                }
                            }
                        }
                    }
                }
            }).on('success.form.bv', function (e) {
                e.preventDefault();
                var dataCollection = {};
                dataCollection.UserID = $("#UserID").val();
                dataCollection.UserName = $("#UserName").val().toUpperCase();
                dataCollection.FirstName = $("#FirstName").val();
                dataCollection.LastName = $("#LastName").val();
                dataCollection.PHNumber = $("#PHNumber").val();
                dataCollection.EmailAddress = $("#EmailAddress").val();
                dataCollection.Password = $("#Password").val();
                dataCollection.Address = $("#Address").val();
                dataCollection.City = $("#City").val();
                //DataCollection.Empanelmentdate = $("#Empanelmentdate").val();
                //DataCollection.Validupto = $("#Validupto").val();
                dataCollection.YearsofExperience = $("#YearsofExperience").val();
                dataCollection.DateofJoining = $("#DOJ").val();
                if (UserID == null) {
                    dataCollection.UserRole = $("#UserRole").val();
                    dataCollection.Manager = $("#Manager").val();
                }
                else {
                    dataCollection.UserRole = 2;
                    dataCollection.Manager = UserID;
                }
                dataCollection.Active = $("#Active").is(':checked');
                if ($("#IsAdmin").length) {
                    dataCollection.IsAdmin = $("#IsAdmin").is(':checked');
                }
                else {
                    dataCollection.IsAdmin = "False";
                }
                $.ajax({
                    url: "UserDetails.aspx/INSERTANDUPDATEUSERDETAILS",
                    data: JSON.stringify(dataCollection),
                    type: "POST",
                    async: false,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        if ($("#UserID").val() != "0") {
                            $("#AlertMessage").finish().removeClass().addClass('alert alert-success').slideDown(window.InTimeinMicSec).delay(window.DelayTimeInMicSec).slideUp(window.OutTimeInMicSec).children('strong', this).empty().text('Success!').parent().children('span:first', this).empty().html('Succesfully <a href="#" onclick="EditRecord(' + $("#UserID").val() + ')">' + $("#UserName").val() + '</a> Updated.');
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
                url: "UserDetails.aspx/GET_USER_NAME_EXIST_OR_NOT",
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
            $("#modal-header").empty().text("New User");
            $('#SaveBtn').empty().html('<span class="glyphicon glyphicon-ok"></span>&nbsp;Save');
            $("#ManagerRow").hide();
            $("#UserName").attr('disabled', false);
            $('#UserDetailsForm').bootstrapValidator('enableFieldValidators', 'Password', true);
            $('#UserDetailsForm').bootstrapValidator('enableFieldValidators', 'RetypePassword', true);
            $("#Active").prop('checked', true);
            $('select').val(0);
            $("#Empanelmentdate, #Validupto, #DOJ").datepicker({

                changeMonth: true,
                changeYear: true,
                maxDate: new Date()
            }).datepicker("setDate", new Date());
            $('textarea').val("");
            window.CITY_GET();
            $("#Report").val(1);
            $('#AddUserModal').modal({ backdrop: 'static', keyboard: false }).on('shown.bs.modal', function () {
                $(this).find('#UserName').focus();
            });
        }
        function GET_USER_RELATED_DATA() {
            $.ajax({
                type: "POST",
                url: "UserDetails.aspx/GET_USER_RELATED_DATA",
                data: {},
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
                            var editRecord = '<a onclick="javascript:EditRecord(' + $(this).find("UserID").text() + ')" style="cursor:pointer;"><span class="glyphicon glyphicon glyphicon-edit EDIT-ICON" style="color:black" title="Edit This Record"></span></a>';
                            var status = "";
                            if ($(this).find("Active").text().toLowerCase() == "true") {
                                status = '<span class="label label-success LBLACTIVE">Active</span>';
                            }
                            else {
                                status = '<span class="label label-warning LBLINACTIVE">Inactive</span>';
                            }
                            rows += '<tr>' +
                                                   '<td style="text-align:center">' + editRecord + '</td>' +
                                                   '<td>' + $(this).find("Login").text() + '</td>' +
                                                   '<td>' + $(this).find("FirstName").text() + '</td>' +
                                                   '<td>' + $(this).find("LastName").text() + '</td>' +
                                                   '<td>' + $(this).find("EmailId").text() + '</td>' +
                                                   '<td>' + $(this).find("PhoneNumber").text() + '</td>' +
                                                   '<td>' + $(this).find("Address").text() + '</td>' +
                                                   '<td>' + $(this).find("City_Name").text() + '</td>' +
                                                   '<td>' + $(this).find("ROLE").text() + '</td>' +
                                                   '<td>' + $(this).find("MANAGER").text() + '</td>' +
                                                   //'<td>' + $(this).find("Empanelmentdate").text() + '</td>' +
                                                   //'<td>' + $(this).find("Validupto").text() + '</td>' +
                                                   '<td>' + $(this).find("YearsofExperience").text() + '</td>' +
                                                   '<td>' + $(this).find("DateofJoining").text() + '</td>' +
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
        function EditRecord(userId) {
            $.ajax({
                type: "POST",
                url: "UserDetails.aspx/USER_GET_EDIT",
                data: '{"EditUserID":"' + userId + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var xmlDoc = $.parseXML(data.d);
                    var xml = $(xmlDoc);
                    var edituserdata = xml.find("Table");
                    $.each(edituserdata, function () {
                        $("#modal-header").empty().text("Edit User - " + $(this).find("Login").text());
                        $('#SaveBtn').empty().html('<span class="glyphicon glyphicon-ok"></span>&nbsp;Update');
                        $("#UserID").val($(this).find("UserID").text());
                        $("#UserName").val($(this).find("Login").text()).attr('disabled', true);
                        $("#FirstName").val($(this).find("FirstName").text());
                        $("#LastName").val($(this).find("LastName").text());
                        $("#PHNumber").val($(this).find("PhoneNumber").text());
                        $("#EmailAddress").val($(this).find("EmailId").text());
                        $('#UserDetailsForm').bootstrapValidator('enableFieldValidators', 'Password', false);
                        $('#UserDetailsForm').bootstrapValidator('enableFieldValidators', 'RetypePassword', false);
                        $("#Address").val($(this).find("Address").text());
                        //$("#Empanelmentdate").datepicker({
                        //    dateFormat: 'dd/mm/yy',
                        //    changeMonth: true,
                        //    changeYear: true
                        //}).datepicker("setDate", new Date($(this).find("Empanelmentdate").text()));
                        //$("#Validupto").datepicker({
                        //    dateFormat: 'dd/mm/yy',
                        //    changeMonth: true,
                        //    changeYear: true
                        //}).datepicker("setDate", new Date($(this).find("Validupto").text()));
                        $("#DOJ").datepicker({

                            changeMonth: true,
                            changeYear: true,
                            maxDate: new Date()
                        }).datepicker("setDate", new Date($(this).find("DateofJoining").text()));
                        $("#YearsofExperience").val($(this).find("YearsofExperience").text());
                        window.CITY_GET($(this).find("City").text());
                        if ($(this).find("UserRole").text() == "3") {
                            $("#UserRole").val(1);
                            $(".IsAdmin").show();
                            $("#IsAdmin").prop('checked', true);
                            $('#UserDetailsForm').bootstrapValidator('enableFieldValidators', 'Manager', false);
                            $("#ManagerRow").hide();
                        }
                        else if ($(this).find("UserRole").text() == "2") {
                            $("#UserRole").val(2);
                            $(".IsAdmin").hide();
                            $("#IsAdmin").prop('checked', false);
                            if ($(this).find("CreatedBy").text() != "") {
                                ExecutiveDropDown($(this).find("CreatedBy").text());
                                $('#UserDetailsForm').bootstrapValidator('enableFieldValidators', 'Manager', true);
                                $("#ManagerRow").show();
                            }
                            else {
                                $('#UserDetailsForm').bootstrapValidator('enableFieldValidators', 'Manager', false);
                                $("#ManagerRow").hide();
                            }
                        }
                        else if ($(this).find("UserRole").text() == "1") {
                            $("#UserRole").val($(this).find("UserRole").text());
                            $("#IsAdmin").prop('checked', false);
                            $('#UserDetailsForm').bootstrapValidator('enableFieldValidators', 'Manager', false);
                            $("#ManagerRow").hide();
                        }
                        if ($(this).find("Active").text().toLowerCase() == "true") {
                            $("#Active").prop('checked', true);
                        }
                        else {
                            $("#Active").prop('checked', false);
                        }

                        if ('<%=Convert.ToInt32(Request.Cookies["USERID"].Value)%>' != userId) {
                            $("#City,#CityAddPopOver, #CityEditPopOver, #IsAdmin, #UserRole").prop('disabled', false);
                        }
                        else {
                            $("#City,#CityAddPopOver, #CityEditPopOver, #IsAdmin, #UserRole").prop('disabled', true);
                        }
                    });

                    $(".page-header").css('left', '0');
                    $("#UserName").focus();
                    $('#AddUserModal').modal({ backdrop: 'static', keyboard: false });
                }
            });

        }
        function ExecutiveDropDown(id) {
            $.ajax({
                type: "POST",
                url: "UserDetails.aspx/MANAGER_DROPDOEN_GET",
                data: {},
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var rows = "";
                    $("#Manager").empty();
                    var xmlDoc = $.parseXML(data.d);
                    var xml = $(xmlDoc);
                    var executiveDropDownT = xml.find("Table");
                    if (executiveDropDownT.length > 0) {
                        $.each(executiveDropDownT, function () {
                            if ($(this).find("USERID").text() != $("#UserID").val()) {
                                rows += '<option value="' + $(this).find("USERID").text() + '">' + $(this).find("LOGIN").text() + '</option>';
                            }
                        });
                        if (rows != "") {
                            $("#Manager").append('<option value="-1">-- Select --</option>');
                            $("#Manager").append(rows);
                        }
                        else {
                            $("#Manager").append('<option value="-1">-- No Data --</option>');
                        }
                        if (id != null) {
                            $("#Manager").val(id);
                        }
                    }
                    else {
                        $("#Manager").append('<option value="-1">-- No Data --</option>');
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
