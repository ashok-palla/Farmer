<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BankDetails.aspx.cs" Inherits="Masters.Masters_BankDetails" MasterPageFile="~/MasterPage/CRMaster.master" Title="Bank Details" %>

<asp:Content ContentPlaceHolderID="CRMasterHead" runat="server"></asp:Content>
<asp:Content ContentPlaceHolderID="CRMasterBody" runat="server">
<script src="../APPRequires/FooTable/js/footable.js"></script>
<script src="../APPRequires/FooTable/js/footable.filter.js"></script>
<script src="../APPRequires/FooTable/js/footable.sort.js"></script>
<script src="../APPRequires/FooTable/js/footable.paginate.js"></script>
<link href="../APPRequires/FooTable/css/footable.core.css" rel="stylesheet" />
<link href="../APPRequires/FooTable/css/footable.metro.css" rel="stylesheet" />
    <div class="page-header">
        <h3>Bank Details <span class="badge" id="BanksCount"></span> </h3>
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
                    <th style="-moz-min-width: 120px; -ms-min-width: 120px; -o-min-width: 120px; -webkit-min-width: 120px; min-width: 120px">Bank Name</th>
                    <th style="-moz-min-width: 121px; -ms-min-width: 121px; -o-min-width: 121px; -webkit-min-width: 121px; min-width: 121px" data-hide="phone, tablet">Zone Name</th>
                    <th data-hide="phone" style="-moz-min-width: 133px; -ms-min-width: 133px; -o-min-width: 133px; -webkit-min-width: 133px; min-width: 133px">Branch Name</th>
                    <th data-hide="phone" style="-moz-min-width: 133px; -ms-min-width: 133px; -o-min-width: 133px; -webkit-min-width: 133px; min-width: 133px">City</th>
                    <th data-hide="phone" style="-moz-min-width: 110px; -ms-min-width: 110px; -o-min-width: 110px; -webkit-min-width: 110px; min-width: 110px">Empanelment date(MM/DD/YYYY)</th>
                    <th data-hide="phone" style="-moz-min-width: 110px; -ms-min-width: 110px; -o-min-width: 110px; -webkit-min-width: 110px; min-width: 110px">Valid upto(MM/DD/YYYY)</th>
                    <th data-hide="all" style="-moz-min-width: 146px; -ms-min-width: 146px; -o-min-width: 146px; -webkit-min-width: 146px; min-width: 146px">Contact Person</th>
                    <th data-hide="all" style="-moz-min-width: 111px; -ms-min-width: 111px; -o-min-width: 111px; -webkit-min-width: 111px; min-width: 111px">Phone No.</th>
                    <th data-hide="all" style="-moz-min-width: 138px; -ms-min-width: 138px; -o-min-width: 138px; -webkit-min-width: 138px; min-width: 138px">Bank Email ID</th>
                    <th data-hide="all" style="-moz-min-width: 152px; -ms-min-width: 152px; -o-min-width: 152px; -webkit-min-width: 152px; min-width: 152px">Bank Phone No.</th>
                    <th data-hide="all" style="-moz-min-width: 94px; -ms-min-width: 94px; -o-min-width: 94px; -webkit-min-width: 94px; min-width: 94px">Address</th>
                    <th data-hide="phone" style="-moz-min-width: 81px; -ms-min-width: 81px; -o-min-width: 81px; -webkit-min-width: 81px; min-width: 81px">Status</th>
                </tr>
            </thead>
            <tbody id="BankData"></tbody>

            <tfoot class="hide-if-no-paging" id="TableFoot"></tfoot>
        </table>
        <form id="BankDetailsForm" class="form-horizontal" method="post">

            <div id="AddBankModal" class="modal fade bs-example-modal-sm" tabindex="-1" style="top: 15%; overflow: hidden; overflow-y: scroll">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content" style="-ms-border-top-left-radius: 10px; border-top-left-radius: 10px; -ms-border-top-right-radius: 10px; border-top-right-radius: 10px">
                        <div class="modal-header" style="padding: 10px; height: 40px; color: white; background-color: #00a0af; -ms-border-top-left-radius: 5px; border-top-left-radius: 5px; -ms-border-top-right-radius: 5px; border-top-right-radius: 5px">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="margin-top: -9px; -ms-opacity: 10; opacity: 10"><span aria-hidden="true" style="color: #D43F3A">&times;</span></button>
                            <h4 class="modal-title" id="modal-header">New Bank</h4>
                        </div>
                        <div class="modal-body container-fluid">

                            <input id="BankID" name="BankID" type="hidden" value="0" />

                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right"><span style="color: red">*</span>Bank Name </label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="text" class="form-control form-control col-xs-4 col-md-4 col-lg-2 input-sm PasteDisable" onkeypress="return CharectersWithSpace(event)" name="BankName" id="BankName" style="width: 100%" />
                                </div>
                            </div>

                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right">Zone Name </label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="text" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2 PasteDisable" onkeypress="return CharectersWithSpace(event,this);" name="ZoneName" id="ZoneName" style="width: 100%" />
                                </div>
                            </div>

                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right"><span style="color: red">*</span>Branch Name </label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="text" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2 PasteDisable" name="BranchName" id="BranchName" style="width: 100%" />
                                </div>
                            </div>

                            <div class="form-group form-group-sm Expences" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right"><span style="color: red">*</span>Normal Range </label>
                                <div class="col-lg-6" style="padding-bottom: 1%" id="RangeAdd"></div>
                            </div>

                             <div class="form-group form-group-sm Expences" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right"><span style="color: red">*</span>OTS Range </label>
                                <div class="col-lg-6" style="padding-bottom: 1%" id="OTSRangeAdd"></div>
                            </div>

                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right"><span style="color: red">*</span>City </label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <div class="input-group input-group-sm">
                                        <select class="form-control" name="City" id="City">
                                            <option value="0">-- Select --</option>
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
                                        <span class="input-group-btn">
                                            <button class="btn btn-success btn-sm" type="button" style="-webkit-box-shadow: none; -ms-box-shadow: none; box-shadow: none" data-container="body" id="CityAddPopOver"><span class="glyphicon glyphicon-plus" title="Add New City"></span></button>
                                            <button class="btn btn-primary btn-sm" type="button" style="-webkit-box-shadow: none; -ms-box-shadow: none; box-shadow: none" data-container="body" id="CityEditPopOver"><span class="glyphicon glyphicon-edit" title="Edit City"></span></button>
                                        </span>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group form-group-sm Expences" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right">Empanelment date(<%=DateFormatForDatePicker.ToUpper()%>) </label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="tel" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2" name="Empanelmentdate" id="Empanelmentdate" style="width: 100%" />
                                </div>
                            </div>

                            <div class="form-group form-group-sm Expences" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right">Valid upto(<%=DateFormatForDatePicker.ToUpper()%>) </label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="tel" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2" name="Validupto" id="Validupto" style="width: 100%" />
                                </div>
                            </div>

                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right">Contact Person</label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="text" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2 PasteDisable" onkeypress="return CharectersWithSpace(event,this);" name="ContactPerson" id="ContactPerson" style="width: 100%" />
                                </div>
                            </div>

                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right">Contact Person Mobile No.</label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="tel" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2 PasteDisable" onkeypress="return NumberOnly(event,this);" name="CPHNumber" id="CPHNumber" style="width: 100%" />
                                </div>
                            </div>

                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right">Bank Email Address </label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="text" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2" onkeypress="return RistrictSpaces(event)" name="BankEmailAddress" id="BankEmailAddress" style="width: 100%" />
                                </div>
                            </div>

                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right">Bank Contact No.</label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <input type="tel" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2 PasteDisable"  onkeypress="return NumberOnly(event,this);" name="BPHNumber" id="BPHNumber" style="width: 100%" />
                                </div>
                            </div>

                            <div class="form-group form-group-sm" style="margin-bottom: 0">
                                <label class="col-lg-4 control-label" style="font-weight: normal; padding-right: 1%; text-align: right">&nbsp;Address </label>
                                <div class="col-lg-6" style="padding-bottom: 1%">
                                    <textarea aria-multiline="true" rows="4" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2" name="Address" id="Address" style="width: 100%"></textarea>
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
            $('#TableFoot').append(TableFoot(13));
            $('.footable').footable();
            GET_BANK_RELATED_DATA();
            //window.onkeyup = function (e) {
            //    if (e.keyCode == 17) {
            //        $('#AddBankModal').modal({ backdrop: 'static', keyboard: false, });
            //    };
            //}
            if ('<%=Convert.ToInt32(Request.Cookies["UserRole"].Value)%>' == 2) {
                $(".circle").remove();
            }
            $('#AddBankModal').on('hidden.bs.modal', function () {
                $("#BankDetailsForm").bootstrapValidator('resetForm', true);
                $("#BankID").val(0);
                $("#ZoneName,#ContactPerson,textarea").val("");
                $("#Active").prop('checked', true);
                $('select').val(0);
                $("#Report").val(1);
            });
            $('input.PasteDisable').on('paste', function () {
                alert("paste not allowed.");
                return false;
            });

            $('#ExportMethod').click(function () {
                var URL = window.location + '?ReportType=' + $("#Report").val();
                window.location = URL;
            });

            $('#BankDetailsForm').bootstrapValidator({
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
                            notEmpty: {
                                message: 'Please Enter Bank Name'
                            },
                            stringLength: {
                                message: 'Bank Name Must Contain Minimum 4 Characters and should not Exceed 20 Characters.',
                                max: function (value) {
                                    return 20 - (value.match(/\r/g) || []).length;
                                }
                            }
                        }
                    },
                    CPHNumber: {
                        validators: {
                            stringLength: {
                                message: 'Please Enter Valid Contact Person Mobile Number',
                                min: 10,
                                max: function (value) {
                                    return 10 - (value.match(/\r/g) || []).length;
                                }
                            }
                        }
                    },
                    BPHNumber: {
                        validators: {
                            stringLength: {
                                message: 'Please Enter Valid Bank Mobile Number',
                                min: 10,
                                max: function (value) {
                                    return 15 - (value.match(/\r/g) || []).length;
                                }
                            }
                        }
                    },
                    BranchName: {
                        validators: {
                            notEmpty: {
                                message: 'Please Enter Branch Name'
                            },
                            stringLength: {
                                message: 'Branch Name Name Must Contain Minimum atleast 1 Character and should not Exceed 20 Characters',
                                min: 1,
                                max: function (value) {
                                    return 20 - (value.match(/\r/g) || []).length;
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
                    BankEmailAddress: {
                        validators: {
                            regexp: {
                                regexp: /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/,
                                message: 'Please Enter Valid Email Address'
                            }
                        }
                    }
                }
            }).on('success.form.bv', function (e) {
                e.preventDefault();
                var DataCollection = {};
                DataCollection.BankID = $("#BankID").val();
                DataCollection.BankName = $("#BankName").val();
                DataCollection.ZoneName = $("#ZoneName").val();
                DataCollection.BranchName = $("#BranchName").val();
                DataCollection.City = $("#City").val();
                DataCollection.Empanelmentdate = $("#Empanelmentdate").val();
                DataCollection.Validupto = $("#Validupto").val();
                DataCollection.ContactPerson = $("#ContactPerson").val();
                DataCollection.CPHNumber = $("#CPHNumber").val();
                DataCollection.BankEmailAddress = $("#BankEmailAddress").val();
                DataCollection.BPHNumber = $("#BPHNumber").val();
                DataCollection.Address = $("#Address").val();
                DataCollection.Active = $("#Active").is(':checked');
                var RightsIDs = $.makeArray($(".NewRangeGroup"));
                var UnRightsIDs = $.makeArray($(".EditRangeGroup"));
                var NutralRanges = new Array();
                var z;
                var Percentage;
                var RangeStartAmount;
                var RangeEndAmount;
                for (z = 0; z < $(".NewRangeGroup").length; z++) {
                    RangeStartAmount = $("#" + RightsIDs[z].id.toString()).children(".RangeStartAmount").val();
                    RangeEndAmount = $("#" + RightsIDs[z].id.toString()).children(".RangeEndAmount").val();
                    Percentage = $("#" + RightsIDs[z].id.toString()).children(".Percentage").val();
                    NutralRanges.push('0,' + RangeStartAmount + ',' + RangeEndAmount + ',' + Percentage);
                }
                for (z = 0; z < $(".EditRangeGroup").length; z++) {
                    var RangeID = $("#" + UnRightsIDs[z].id.toString()).attr("RangeID");
                    RangeStartAmount = $("#" + UnRightsIDs[z].id.toString()).children(".RangeStartAmount").val();
                    RangeEndAmount = $("#" + UnRightsIDs[z].id.toString()).children(".RangeEndAmount").val();
                    Percentage = $("#" + UnRightsIDs[z].id.toString()).children(".Percentage").val();
                    NutralRanges.push(RangeID + ',' + RangeStartAmount + ',' + RangeEndAmount + ',' + Percentage);
                }
                var blkstr = [];
                $.each(NutralRanges, function (idx2, val2) {
                    var str = val2;
                    blkstr.push(str);
                });
                DataCollection.Ranges = blkstr.join(";");


                var OTSRightsIDs = $.makeArray($(".OTSNewRangeGroup"));
                var OTSUnRightsIDs = $.makeArray($(".OTSEditRangeGroup"));
                var OTSNutralRanges = new Array();
                var OTSRangeStartAmount;
                var OTSRangeEndAmount;
                var OTSPercentage;
                for (z = 0; z < $(".OTSNewRangeGroup").length; z++) {
                    OTSRangeStartAmount = $("#" + OTSRightsIDs[z].id.toString()).children(".OTSRangeStartAmount").val();
                    OTSRangeEndAmount = $("#" + OTSRightsIDs[z].id.toString()).children(".OTSRangeEndAmount").val();
                    OTSPercentage = $("#" + OTSRightsIDs[z].id.toString()).children(".OTSPercentage").val();
                    OTSNutralRanges.push('0,' + OTSRangeStartAmount + ',' + OTSRangeEndAmount + ',' + OTSPercentage);
                }
                for (z = 0; z < $(".OTSEditRangeGroup").length; z++) {
                    var OTSRangeID = $("#" + OTSUnRightsIDs[z].id.toString()).attr("OTSRangeID");
                    OTSRangeStartAmount = $("#" + OTSUnRightsIDs[z].id.toString()).children(".OTSRangeStartAmount").val();
                    OTSRangeEndAmount = $("#" + OTSUnRightsIDs[z].id.toString()).children(".OTSRangeEndAmount").val();
                    OTSPercentage = $("#" + OTSUnRightsIDs[z].id.toString()).children(".OTSPercentage").val();
                    OTSNutralRanges.push(OTSRangeID + ',' + OTSRangeStartAmount + ',' + OTSRangeEndAmount + ',' + OTSPercentage);
                }
                var OTSblkstr = [];
                $.each(OTSNutralRanges, function (idx2, val2) {
                    var str = val2;
                    OTSblkstr.push(str);
                });
                DataCollection.OTSRanges = OTSblkstr.join(";");
                $.ajax({
                    url: "BankDetails.aspx/INSERTANDUPDATEBANKDETAILS",
                    data: JSON.stringify(DataCollection),
                    type: "POST",
                    async: false,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        if (data.d == "") {
                            if ($("#BankID").val() != "0") {
                                $("#AlertMessage").finish().removeClass().addClass('alert alert-success').slideDown(window.InTimeinMicSec).delay(window.DelayTimeInMicSec).slideUp(window.OutTimeInMicSec).children('strong', this).empty().text('Success!').parent().children('span:first', this).empty().html('Succesfully <a href="#" onclick="EditRecord(' + $("#BankID").val() + ')">' + $("#BankName").val() + '</a> Updated.');
                            }
                            else {
                                $("#AlertMessage").finish().removeClass().addClass('alert alert-success').slideDown(window.InTimeinMicSec).delay(window.DelayTimeInMicSec).slideUp(window.OutTimeInMicSec).children('strong', this).empty().text('Success!').parent().children('span:first', this).empty().html('Succesfully New Bank Saved.');
                            }
                            $('.modal').modal('hide');
                            GET_BANK_RELATED_DATA();
                        }
                        else {
                            alert(data.d);
                            $('#BankDetailsForm').bootstrapValidator('revalidateField', $('#BranchName'));
                        }
                    }
                });
            });
        });
        function NewRecord() {
            $("#modal-header").empty().text("New Bank");
            $('#SaveBtn').empty().html('<span class="glyphicon glyphicon-ok"></span>&nbsp;Save');
            window.CITY_GET();
            $("#Empanelmentdate, #Validupto").datepicker({
                
                changeMonth: true,
                changeYear: true
            }).datepicker("setDate", new Date());
            $("#Empanelmentdate, #Validupto").val("");
            $("#RangeAdd").empty().append('<div class="input-group NewRangeGroup" id="AddRangeGroup1">' +
                                        '<input type="text" class="form-control col-lg-3 RangeStartAmount" style="width: 38%" onkeypress="return NumberOnly(event,this);" placeholder="Start Amount" id="RangeStartAmount1" name="RangeStartAmount1" required="true">' +
                                        '<input type="text" class="form-control col-lg-3 RangeEndAmount" style="width: 37%" onkeypress="return NumberOnly(event,this);" placeholder="End Amount" id="RangeEndAmount1" name="RangeEndAmount1" required="true">' +
                                        '<input type="text" class="form-control col-lg-3 Percentage" style="width: 16%" onkeypress="return Percentage(event,this);" placeholder="(%)" id="Percentage1" name="Percentage1" required="true">' +
                                        '<button class="btn btn-success btn-sm" type="button" onclick="AddRange();" style="height:30px; border-radius: 0px 3px 3px 0px;  box-shadow:none"><span class="glyphicon glyphicon-plus" title="Add Range"></span></button>' +
                                    '</div>');
            $("#OTSRangeAdd").empty().append('<div class="input-group OTSNewRangeGroup" id="OTSAddRangeGroup1">' +
                                        '<input type="text" class="form-control col-lg-3 OTSRangeStartAmount" style="width: 38%" onkeypress="return NumberOnly(event,this);" placeholder="OTS Start Amount" id="OTSRangeStartAmount1" name="OTSRangeStartAmount1" required="true">' +
                                        '<input type="text" class="form-control col-lg-3 OTSRangeEndAmount" style="width: 37%" onkeypress="return NumberOnly(event,this);" placeholder="OTS End Amount" id="OTSRangeEndAmount1" name="OTSRangeEndAmount1" required="true">' +
                                        '<input type="text" class="form-control col-lg-3 OTSPercentage" style="width: 16%" onkeypress="return Percentage(event,this);" placeholder="(%)" id="OTSPercentage1" name="OTSPercentage1" required="true">' +
                                        '<button class="btn btn-success btn-sm" type="button" onclick="AddOTSRange();" style="height:30px; border-radius: 0px 3px 3px 0px;  box-shadow:none"><span class="glyphicon glyphicon-plus" title="Add OTS Range"></span></button>' +
                                    '</div>');
            $('#AddBankModal').modal({ backdrop: 'static', keyboard: false }).on('shown.bs.modal', function () {
                $(this).find('#BankName').focus();
            });
        }
        function GET_BANK_RELATED_DATA() {
            $.ajax({
                type: "POST",
                url: "BankDetails.aspx/GET_BANK_RELATED_DATA",
                data: {},
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var Rows = "";
                    $("#BankData").empty();
                    var xmlDoc = $.parseXML(data.d);
                    var xml = $(xmlDoc);
                    var GetEnquiresUserLevel = xml.find("Table");
                    if (GetEnquiresUserLevel.length > 0) {
                        $("#BanksCount").empty().text(GetEnquiresUserLevel.length);
                        $('#ReportCollasseButton').show();
                        $.each(GetEnquiresUserLevel, function () {
                            var EditRecord = '<a onclick="javascript:EditRecord(' + $(this).find("ID").text() + ')" style="cursor:pointer;"><span class="glyphicon glyphicon glyphicon-edit EDIT-ICON" style="color:black" title="Edit This Record"></span></a>';
                            var DeleteRecord = '<a onclick="javascript:InActiveRecord(' + $(this).find("ID").text() + ')" style="cursor:pointer;"><span class="glyphicon glyphicon glyphicon-remove REMOVE-ICON" style="color:red;padding-left:5px" title="Remove This Record"></span></a>';
                            if ('<%=Convert.ToInt32(Request.Cookies["UserRole"].Value)%>' == 2) {
                                EditRecord = "";
                                DeleteRecord = "";
                            }
                            var Status = "";
                            if ($(this).find("Active").text().toLowerCase() == "true") {
                                Status = '<span class="label label-success LBLACTIVE ' + $(this).find("ID").text() + 'STA">Active</span>';
                            }
                            else {
                                Status = '<span class="label label-warning LBLINACTIVE ' + $(this).find("ID").text() + 'STA">Inactive</span>';
                            }
                            Rows += '<tr>' +
                                    '<td style="text-align:center">' + EditRecord + DeleteRecord + '</td>' +
                                    '<td>' + $(this).find("Name").text() + '</td>' +
                                    '<td>' + $(this).find("Zone").text() + '</td>' +
                                    '<td>' + $(this).find("Branch").text() + '</td>' +
                                    '<td>' + $(this).find("City_Name").text() + '</td>' +
                                    '<td>' + $(this).find("Empanelmentdate").text() + '</td>' +
                                    '<td>' + $(this).find("Validupto").text() + '</td>' +
                                    '<td>' + $(this).find("ContactPerson1").text() + '</td>' +
                                    '<td>' + $(this).find("ContactNo").text() + '</td>' +
                                    '<td>' + $(this).find("BankMailID").text() + '</td>' +
                                    '<td>' + $(this).find("BankContactNo").text() + '</td>' +
                                    '<td>' + $(this).find("Address").text() + '</td>' +
                                    '<td style="text-align:center">' + Status + '</td>' +
                                    '</tr>';
                        });
                        $("#BankData").append(Rows);
                    }
                    else {
                        $("#BankData").append('<tr><td colspan="13" style="text-align:center"> No Data To Display</td></tr>');
                        $('#ReportCollasseButton').hide();
                        $("#ReportCollassePanel").removeClass("in");
                        $("#BanksCount").empty().text(0);
                    }
                    $('.footable').trigger('footable_initialize');
                }
            });
        }
        function EditRecord(BankID) {
            $.ajax({
                type: "POST",
                url: "BankDetails.aspx/BANK_GET_EDIT",
                data: '{"BankID":"' + BankID + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var xmlDoc = $.parseXML(data.d);
                    var xml = $(xmlDoc);
                    var GetEnquiresUserLevel = xml.find("Table");
                    $.each(GetEnquiresUserLevel, function () {
                        $("#modal-header").empty().text("Edit Bank - " + $(this).find("Name").text());
                        $('#SaveBtn').empty().html('<span class="glyphicon glyphicon-ok"></span>&nbsp;Update');
                        $("#BankID").val($(this).find("ID").text());
                        BANK_COMISSION_RANGES_GET($(this).find("ID").text());
                        BANK_OTS_COMISSION_RANGES_GET($(this).find("ID").text());
                        $("#BankName").val($(this).find("Name").text());
                        $("#ZoneName").val($(this).find("Zone").text());
                        $("#BranchName").val($(this).find("Branch").text());
                        window.CITY_GET($(this).find("City").text());
                        $("#Empanelmentdate").datepicker({
                            
                            changeMonth: true,
                            changeYear: true
                        }).datepicker("setDate", new Date($(this).find("Empanelmentdate").text()));
                        $("#Validupto").datepicker({
                            
                            changeMonth: true,
                            changeYear: true
                        }).datepicker("setDate", new Date($(this).find("Validupto").text()));
                        if ($(this).find("Validupto").text() == "") {
                            $("#Validupto").val("");
                        }
                        if ($(this).find("Empanelmentdate").text() == "") {
                            $("#Empanelmentdate").val("");
                        }
                        $("#ContactPerson").val($(this).find("ContactPerson1").text());
                        $("#CPHNumber").val($(this).find("ContactNo").text());
                        $("#BankEmailAddress").val($(this).find("BankMailID").text());
                        $("#BPHNumber").val($(this).find("BankContactNo").text());
                        $("#Address").val($(this).find("Address").text());
                        if ($(this).find("Active").text().toLowerCase() == "true") {
                            $("#Active").prop('checked', true);
                        }
                        else {
                            $("#Active").prop('checked', false);
                        }
                    });
                    $('#AddBankModal').modal({ backdrop: 'static', keyboard: false }).on('shown.bs.modal', function () {
                        $(this).find('#BankName').focus();
                    });;
                }
            });
        }
        function InActiveRecord(BankID) {
            var DELStatus = $("." + BankID + "STA").text();
            if (DELStatus == "Inactive") {
                DELStatus = "delete";
            }
            else {
                DELStatus = "inactive";
            }
            if (confirm("Are you sure, do you want to " + DELStatus + " this record? ")) {
                $.ajax({
                    type: "POST",
                    url: "BankDetails.aspx/DELETE_BANK",
                    data: '{"BankID":"' + BankID + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        if (data.d == "") {
                            $("#AlertMessage").finish().removeClass().addClass('alert alert-danger').slideDown(window.OutTimeInMicSec).delay(window.DelayTimeInMicSec).slideUp(window.OutTimeInMicSec).children('strong', this).empty().text('Deleted!').parent().children('span:first', this).empty().html('Record succesfully inactive/deleted.');
                            GET_BANK_RELATED_DATA();
                        }
                        else {
                            alert(data.d);
                        }
                    }
                });
            }
        }

        //NORMAL RANGES START
        var i = 2;
        function AddRange() {
            $("#RangeAdd").append('<div class="input-group NewRangeGroup" id="AddRangeGroup' + i + '">' +
                                        '<input type="text" class="form-control col-lg-3 RangeStartAmount" style="width: 38%" onkeypress="return NumberOnly(event,this);" placeholder="Start Amount" id="RangeStartAmount' + i + '" name="RangeStartAmount' + i + '">' +
                                        '<input type="text" class="form-control col-lg-3 RangeEndAmount" style="width: 37%" onkeypress="return NumberOnly(event,this);" placeholder="End Amount" id="RangeEndAmount' + i + '" name="RangeEndAmount' + i + '">' +
                                        '<input type="text" class="form-control col-lg-3 Percentage" style="width: 16%" onkeypress="return Percentage(event,this);" placeholder="(%)" id="Percentage' + i + '" name="Percentage' + i + '">' +
                                        '<button class="btn btn-danger btn-sm" type="button" onclick="RemoveRange(' + i + ');" style="height:30px; border-radius: 0px 3px 3px 0px;  box-shadow:none"><span class="glyphicon glyphicon-minus" title="Remove Range"></span></button>' +
                                    '</div>');
            i++;
        }
        function RemoveRange(ID) {
            if (isNaN(ID)) {
                $.ajax({
                    type: "POST",
                    url: "BankDetails.aspx/RANGE_DELETE",
                    data: '{"RID":"' + ID.split("_")[1] + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        $('#' + ID).parent().remove();
                        $("#AlertMessage").finish().removeClass().addClass('alert alert-danger').slideDown(window.OutTimeInMicSec).delay(window.DelayTimeInMicSec).slideUp(window.OutTimeInMicSec).children('strong', this).empty().text('Deleted!').parent().children('span:first', this).empty().html('succesfully range deleted.');
                    }
                });
            }
            else {
                $("#AddRangeGroup" + ID).remove();
            }
        }
        function BANK_COMISSION_RANGES_GET(BankID) {
            $.ajax({
                type: "POST",
                url: "BankDetails.aspx/BANK_COMISSION_RANGES_GET",
                data: '{"BankID":"' + BankID + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    $("#RangeAdd").empty();
                    var xmlDoc = $.parseXML(data.d);
                    var xml = $(xmlDoc);
                    var GetEnquiresUserLevel = xml.find("Table");
                    if (GetEnquiresUserLevel.length > 0) {
                        $.each(GetEnquiresUserLevel, function (i) {
                            if (i == 0) {
                                $("#RangeAdd").append('<div class="input-group EditRangeGroup" id="AddRangeGroup' + i + '" RangeID="' + $(this).find("ID").text() + '">' +
                                                            '<input type="text" class="form-control col-lg-3 RangeStartAmount" style="width: 38%" onkeypress="return NumberOnly(event,this);" placeholder="Start Amount" id="RangeStartAmount' + i + '" name="RangeStartAmount' + i + '" value="' + $(this).find("RANGE_START").text() + '">' +
                                                            '<input type="text" class="form-control col-lg-3 RangeEndAmount" style="width: 37%" onkeypress="return NumberOnly(event,this);" placeholder="End Amount" id="RangeEndAmount' + i + '" name="RangeEndAmount' + i + '" value="' + $(this).find("RANGE_END").text() + '">' +
                                                            '<input type="text" class="form-control col-lg-3 Percentage" style="width: 16%" onkeypress="return Percentage(event,this);" placeholder="(%)" id="Percentage' + i + '" name="Percentage' + i + '" value="' + $(this).find("PERCENTAGE").text() + '">' +
                                                            '<button class="btn btn-success btn-sm" type="button" onclick="AddRange();" style="height:30px; border-radius: 0px 3px 3px 0px;  box-shadow:none"><span class="glyphicon glyphicon-plus" title="Add Range"></span></button>' +
                                                        '</div>');
                            }
                            else {
                                $("#RangeAdd").append('<div class="input-group EditRangeGroup" id="AddRangeGroup' + i + '" RangeID="' + $(this).find("ID").text() + '">' +
                                                            '<input type="text" class="form-control col-lg-3 RangeStartAmount" style="width: 38%" onkeypress="return NumberOnly(event,this);" placeholder="Start Amount" id="RangeStartAmount' + i + '" name="RangeStartAmount' + i + '" value="' + $(this).find("RANGE_START").text() + '">' +
                                                            '<input type="text" class="form-control col-lg-3 RangeEndAmount" style="width: 37%" onkeypress="return NumberOnly(event,this);" placeholder="End Amount" id="RangeEndAmount' + i + '" name="RangeEndAmount' + i + '" value="' + $(this).find("RANGE_END").text() + '">' +
                                                            '<input type="text" class="form-control col-lg-3 Percentage" style="width: 16%" onkeypress="return Percentage(event,this);" placeholder="(%)" id="Percentage' + i + '" name="Percentage' + i + '" value="' + $(this).find("PERCENTAGE").text() + '">' +
                                                            '<button class="btn btn-danger btn-sm" type="button" id="B_' + $(this).find("ID").text() + '" onclick="RemoveRange(this.id);" style="height:30px; border-radius: 0px 3px 3px 0px;  box-shadow:none"><span class="glyphicon glyphicon-minus" title="Remove Range"></span></button>' +
                                                        '</div>');
                            }
                        });
                    }
                    else {
                        $("#RangeAdd").empty().append('<div class="input-group NewRangeGroup" id="AddRangeGroup1">' +
                                                    '<input type="text" class="form-control col-lg-3 RangeStartAmount" style="width: 38%" onkeypress="return NumberOnly(event,this);" placeholder="Start Amount" id="RangeStartAmount1" name="RangeStartAmount1">' +
                                                    '<input type="text" class="form-control col-lg-3 RangeEndAmount" style="width: 37%" onkeypress="return NumberOnly(event,this);" placeholder="End Amount" id="RangeEndAmount1" name="RangeEndAmount1">' +
                                                    '<input type="text" class="form-control col-lg-3 Percentage" style="width: 16%" onkeypress="return Percentage(event,this);" placeholder="(%)" id="Percentage1" name="Percentage1">' +
                                                    '<button class="btn btn-success btn-sm" type="button" onclick="AddRange();" style="height:30px; border-radius: 0px 3px 3px 0px;  box-shadow:none"><span class="glyphicon glyphicon-plus" title="Add Range"></span></button>' +
                                                '</div>');
                    }
                }
            });
        }
        //NORMAL RANGES END

        //OTS RANGE START
        var j = 2;
        function AddOTSRange() {
            $("#OTSRangeAdd").append('<div class="input-group OTSNewRangeGroup" id="OTSAddRangeGroup' + j + '">' +
                                        '<input type="text" class="form-control col-lg-3 OTSRangeStartAmount" style="width: 38%" onkeypress="return NumberOnly(event,this);" placeholder="Start Amount" id="OTSRangeStartAmount' + j + '" name="OTSRangeStartAmount' + j + '">' +
                                        '<input type="text" class="form-control col-lg-3 OTSRangeEndAmount" style="width: 37%" onkeypress="return NumberOnly(event,this);" placeholder="End Amount" id="OTSRangeEndAmount' + j + '" name="OTSRangeEndAmount' + j + '">' +
                                        '<input type="text" class="form-control col-lg-3 OTSPercentage" style="width: 16%" onkeypress="return Percentage(event,this);" placeholder="(%)" id="OTSPercentage' + j + '" name="OTSPercentage' + j + '">' +
                                        '<button class="btn btn-danger btn-sm" type="button" onclick="OTSRemoveRange(' + j + ');" style="height:30px; border-radius: 0px 3px 3px 0px;  box-shadow:none"><span class="glyphicon glyphicon-minus" title="Remove OTS Range"></span></button>' +
                                    '</div>');
            j++;
        }
        function OTSRemoveRange(ID) {
            if (isNaN(ID)) {
                $.ajax({
                    type: "POST",
                    url: "BankDetails.aspx/OTS_RANGE_DELETE",
                    data: '{"OTSRID":"' + ID.split("_")[1] + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {
                        $('#' + ID).parent().remove();
                        $("#AlertMessage").finish().removeClass().addClass('alert alert-danger').slideDown(window.OutTimeInMicSec).delay(window.DelayTimeInMicSec).slideUp(window.OutTimeInMicSec).children('strong', this).empty().text('Deleted!').parent().children('span:first', this).empty().html('succesfully OTS range deleted.');
                    }
                });
            }
            else {
                $("#OTSAddRangeGroup" + ID).remove();
            }
        }
        function BANK_OTS_COMISSION_RANGES_GET(BankID) {
            $.ajax({
                type: "POST",
                url: "BankDetails.aspx/BANK_OTS_COMISSION_RANGES_GET",
                data: '{"BankID":"' + BankID + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    $("#OTSRangeAdd").empty();
                    var xmlDoc = $.parseXML(data.d);
                    var xml = $(xmlDoc);
                    var GetEnquiresUserLevel = xml.find("Table");
                    if (GetEnquiresUserLevel.length > 0) {
                        $.each(GetEnquiresUserLevel, function (i) {
                            if (i == 0) {
                                $("#OTSRangeAdd").append('<div class="input-group OTSEditRangeGroup" id="OTSAddRangeGroup' + i + '" OTSRangeID="' + $(this).find("ID").text() + '">' +
                                                            '<input type="text" class="form-control col-lg-3 OTSRangeStartAmount" style="width: 38%" onkeypress="return NumberOnly(event,this);" placeholder="OTS Start Amount" id="OTSRangeStartAmount' + i + '" name="OTSRangeStartAmount' + i + '" value="' + $(this).find("RANGE_START").text() + '">' +
                                                            '<input type="text" class="form-control col-lg-3 OTSRangeEndAmount" style="width: 37%" onkeypress="return NumberOnly(event,this);" placeholder="OTS End Amount" id="OTSRangeEndAmount' + i + '" name="OTSRangeEndAmount' + i + '" value="' + $(this).find("RANGE_END").text() + '">' +
                                                            '<input type="text" class="form-control col-lg-3 OTSPercentage" style="width: 16%" onkeypress="return Percentage(event,this);" placeholder="(%)" id="OTSPercentage' + i + '" name="OTSPercentage' + i + '" value="' + $(this).find("PERCENTAGE").text() + '">' +
                                                            '<button class="btn btn-success btn-sm" type="button" onclick="AddOTSRange();" style="height:30px; border-radius: 0px 3px 3px 0px;  box-shadow:none"><span class="glyphicon glyphicon-plus" title="Add OTS Range"></span></button>' +
                                                        '</div>');
                            }
                            else {
                                $("#OTSRangeAdd").append('<div class="input-group OTSEditRangeGroup" id="OTSAddRangeGroup' + i + '" OTSRangeID="' + $(this).find("ID").text() + '">' +
                                                            '<input type="text" class="form-control col-lg-3 OTSRangeStartAmount" style="width: 38%" onkeypress="return NumberOnly(event,this);" placeholder="OTS Start Amount" id="OTSRangeStartAmount' + i + '" name="OTSRangeStartAmount' + i + '" value="' + $(this).find("RANGE_START").text() + '">' +
                                                            '<input type="text" class="form-control col-lg-3 OTSRangeEndAmount" style="width: 37%" onkeypress="return NumberOnly(event,this);" placeholder="OTS End Amount" id="OTSRangeEndAmount' + i + '" name="OTSRangeEndAmount' + i + '" value="' + $(this).find("RANGE_END").text() + '">' +
                                                            '<input type="text" class="form-control col-lg-3 OTSPercentage" style="width: 16%" onkeypress="return Percentage(event,this);" placeholder="(%)" id="OTSPercentage' + i + '" name="OTSPercentage' + i + '" value="' + $(this).find("PERCENTAGE").text() + '">' +
                                                            '<button class="btn btn-danger btn-sm" type="button" id="OTSB_' + $(this).find("ID").text() + '" onclick="OTSRemoveRange(this.id);" style="height:30px; border-radius: 0px 3px 3px 0px;  box-shadow:none"><span class="glyphicon glyphicon-minus" title="Remove OTS Range"></span></button>' +
                                                        '</div>');
                            }
                        });
                    }
                    else {
                        $("#OTSRangeAdd").empty().append('<div class="input-group OTSNewRangeGroup" id="OTSAddRangeGroup1">' +
                                                    '<input type="text" class="form-control col-lg-3 OTSRangeStartAmount" style="width: 38%" onkeypress="return NumberOnly(event,this);" placeholder="OTS Start Amount" id="OTSRangeStartAmount1" name="OTSRangeStartAmount1">' +
                                                    '<input type="text" class="form-control col-lg-3 OTSRangeEndAmount" style="width: 37%" onkeypress="return NumberOnly(event,this);" placeholder="OTS End Amount" id="OTSRangeEndAmount1" name="OTSRangeEndAmount1">' +
                                                    '<input type="text" class="form-control col-lg-3 OTSPercentage" style="width: 16%" onkeypress="return Percentage(event,this);" placeholder="(%)" id="OTSPercentage1" name="OTSPercentage1">' +
                                                    '<button class="btn btn-success btn-sm" type="button" onclick="AddOTSRange();" style="height:30px; border-radius: 0px 3px 3px 0px;  box-shadow:none"><span class="glyphicon glyphicon-plus" title="Add OTS Range"></span></button>' +
                                                '</div>');
                    }
                }
            });
        }
        //OTS RANGE END

        Array.prototype.remove = function () {
            var what, a = arguments, L = a.length, ax;
            while (L && this.length) {
                what = a[--L];
                while ((ax = this.indexOf(what)) != -1) {
                    this.splice(ax, 1);
                }
            }
            return this;
        };
    </script>
</asp:Content>
