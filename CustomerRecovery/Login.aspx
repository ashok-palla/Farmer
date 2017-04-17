<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="icon" href="Images/Icon/favicon.ico" type="image/x-icon" />
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="ISPCRM" />
    <meta name="author" content="Atharvana" />
    <!-- Bootstrap core CSS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
    <script src="http://code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
    <script src="APPRequires/Bootstrap/js/bootstrap.min.js"></script>
    <link href="APPRequires/Bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <title>Login</title>
    <style>
        .container {
            -webkit-box-shadow: 0 0 10px 3px rgb(255, 228, 132);
            -moz-box-shadow: 0 0 10px 3px rgb(255, 228, 132);
            -ms-box-shadow: 0 0 10px 3px rgb(255, 228, 132);
            box-shadow: 0 0 10px 3px rgb(255, 228, 132);
        }
    </style>
</head>
<body style="">
    <form id="MainForm" runat="server">
        <div class="container" style="border: 1px solid #ffe484; width: 400px; margin-top: 60px">
            <h2 style="text-align: center; color: #ffe484">Farmer Store</h2>
            <div class="row" style="padding: 5px 10px 5px 10px">
                <asp:TextBox runat="server" ID="txtUserName" class="form-control Login" placeholder="User Name/ Email ID" ValidateRequestMode="Enabled" style="text-transform:uppercase;"></asp:TextBox>
            </div>
            <div class="row" style="padding: 5px 10px 5px 10px">
                <asp:TextBox runat="server" ID="txtPassword" class="form-control" placeholder="Password" type="password"></asp:TextBox>
            </div>
            <div class="row" style="padding: 5px 10px 5px 10px; text-align: center">
                <asp:Label runat="server" ID="LbError" class="label label-danger" Visible="false">Error</asp:Label>
            </div>
            <div class="row" style="padding: 5px 10px 20px 10px">
                <asp:Button runat="server" ID="ButLogin" class="btn btn-md btn-info btn-block" OnClick="ButLogin_Click" Text="LogIn"></asp:Button>
                <a class="pull-right" title="Forgot Password" style="cursor: pointer" id="ForgotPassword">Forgot Password</a>
            </div>
        </div>
    </form>
    <div id="ForgotPasswordDetailsForm" class="form-horizontal">
        <div id="ForgotPasswordModal" class="modal fade bs-example-modal-sm" tabindex="-1" data-backdrop="static" data-keyboard="false">
            <div class="modal-dialog">
                <div class="modal-content" style="-ms-border-top-left-radius: 10px; border-top-left-radius: 10px; -ms-border-top-right-radius: 10px; border-top-right-radius: 10px">
                    <div class="modal-header" style="padding: 10px; height: 40px; color: white; background-color: #00a0af; -ms-border-top-left-radius: 5px; border-top-left-radius: 5px; -ms-border-top-right-radius: 5px; border-top-right-radius: 5px">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="color:red; -ms-opacity:10; opacity:10"><span aria-hidden="true">&times;</span></button>
                        <h4 style="margin: 0;" id="EditHeader">Forgot Password<span class="badge" id="RecourdsCount"></span></h4>
                    </div>
                    <div class="modal-body container-fluid" style="width: 90%">
                        <form id="CheckForm" method="post" class="form-horizontal">

                            <div class="form-group form-group-sm" style="margin-bottom: 5px">
                                <div class="row">
                                    <input type="text" class="form-control form-control" name="UserName" id="UserName" placeholder="USER NAME" style="width: 100%" required="required" />
                                </div>
                            </div>

                            <div class="form-group form-group-sm" style="margin-bottom: 5px">
                                <div class="row">
                                    <input type="text" class="form-control form-control" name="EmailID" id="EmailID" style="width: 100%" placeholder="REGISTERED EMAIL" required="required" />
                                </div>
                            </div>

                            <div class="form-group form-group-sm" style="margin-bottom: 5px; text-align: right">
                                <div class="row">
                                    <button type="submit" class="btn btn-default Save" id="SendCode">Generate OTP</button>
                                </div>
                                <div id="Error"></div>
                            </div>

                        </form>

                        <form id="VerificationForm" method="post" class="form-horizontal">
                            <div class="form-group form-group-sm" style="margin-bottom: 5px">
                                <div class="row">
                                    <input type="text" class="form-control form-control" name="VerificationCode" placeholder="VERIFICATION CODE" id="VerificationCode" style="width: 100%" required="required" />
                                </div>
                            </div>

                            <div class="form-group form-group-sm" style="margin-bottom: 1%; text-align: right">
                                <div class="row">
                                    <button type="submit" class="btn btn-default Save" id="Verify">Verify</button>
                                </div>
                                <div id="Error1"></div>
                            </div>
                        </form>

                        <form id="NewPasswordForm" method="post" class="form-horizontal">
                            <div class="form-group form-group-sm" style="margin-bottom: 5px">
                                <div class="row">
                                    <input type="password" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2" name="Password" id="Password" style="width: 100%" placeholder="New Password" required="required" />
                                </div>
                            </div>

                            <div class="form-group form-group-sm" style="margin-bottom: 5px">
                                <div class="row">
                                    <input type="password" class="form-control input-sm form-control col-xs-4 col-md-4 col-lg-2" name="RetypePassword" id="RetypePassword" style="width: 100%" placeholder="ReType New Password" required="required" />
                                </div>
                            </div>

                            <div class="form-group form-group-sm" style="margin-bottom: 1%; text-align: right">
                                <button type="submit" class="btn btn-default Save">Save</button>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
<link href="https://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.3/css/bootstrapValidator.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.3/js/bootstrapValidator.js" type="text/javascript"></script>
<script src="../JQuery/respond.js"></script>
    <script>
        $(document).ready(function () {
            $("#ForgotPassword").click(function () {
                $("#ForgotPasswordModal").modal({
                    backdrop: 'static',
                    keyboard: false
                });
            });

            $('#ForgotPasswordModal').on('hidden.bs.modal', function () {
                window.location.reload();
            });
            //$(".Login").on('keyup keypress paste change',function () {
            //    $(".Login").val($(".Login").val().toUpperCase());
            //});
            $("#VerificationForm").hide();
            $("#NewPasswordForm").hide();
            $('#CheckForm').bootstrapValidator({
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
                            notEmpty: {
                                message: 'Enter valid User Name'
                            }
                        }
                    },
                    EmailID: {
                        validators: {
                            notEmpty: {
                                message: 'Enter valid Registered Email Id'
                            },
                            regexp: {
                                regexp: '^[^@\\s]+@([^@\\s]+\\.)+[^@\\s]+$',
                                message: 'Please enter valid Email Id'
                            }
                        }
                    }
                }
            }).on('success.form.bv', function (e) {
                e.preventDefault();
                var obj = {};
                obj.UserName = $('#UserName').val();
                obj.EmailID = $('#EmailID').val();
                $.ajax({
                    type: "POST",
                    url: "Login.aspx/CheckUserNameAndEmail",
                    data: JSON.stringify(obj),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        if (data.d == "Please check above Registered Email for verification code") {
                            $('#UserName').attr('disabled', true);
                            $('#EmailID').attr('disabled', true);
                            $("#SendCode").hide();
                            $("#Error").css('color', 'green').text(data.d);
                            $("#VerificationForm").show("slow");
                        }
                        else {
                            $("#Error").css('color', 'red').text(data.d);
                        }
                    }
                });
            });
            $('#VerificationForm').bootstrapValidator({
                message: 'This value is not valid',
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                excluded: ':disabled',
                fields: {
                    VerificationCode: {
                        validators: {
                            notEmpty: {
                                message: 'Please Enter Verification Code'
                            }
                        }
                    }
                }
            }).on('success.form.bv', function (e) {
                e.preventDefault();
                var obj = {};
                obj.VerificationCodeFromHTML = $('#VerificationCode').val();
                $.ajax({
                    type: "POST",
                    url: "Login.aspx/VerificationCodeCheck",
                    data: JSON.stringify(obj),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        if (data.d == "OK") {
                            $("#VerificationCode").attr('disabled', true);
                            $("#Verify").hide();
                            $("#Error").remove();
                            $("#Error1").css('color', 'green').text("Please Enter New Password & Retype New Password");
                            $("#NewPasswordForm").show();
                        }
                        else {
                            $("#Error1").css('color', 'red').text("PLease Enter Correct Verification Code");
                        }
                    }
                });
            });
            $('#NewPasswordForm').bootstrapValidator({
                message: 'This value is not valid',
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                excluded: ':disabled',
                fields: {
                    Password: {
                        validators: {
                            notEmpty: {
                                message: 'Please enter New Password'
                            },
                            identical: {
                                field: 'RetypePassword',
                                message: 'New password and retype new password must be same'
                            },
                            callback: {
                                message: 'The OLD PASSWORD is not equal to NEW PASSWORD',
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
                                message: 'Please enter Retype New Password'
                            },
                            identical: {
                                field: 'Password',
                                message: 'New password and retype new password must be same'
                            },
                            callback: {
                                message: 'The OLD PASSWORD is not equal to NEW PASSWORD',
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
                    }
                }
            }).on('success.form.bv', function (e) {
                var obj = {};
                obj.UserName = $('#UserName').val();
                obj.NewPassword = $('#Password').val();
                $.ajax({
                    type: "POST",
                    url: "Login.aspx/UserChangePassword",
                    data: JSON.stringify(obj),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        e.preventDefault();
                        alert(data.d);
                        if (data.d == "Successfully Saved New Password") {
                            window.location.href = '?userlogout=1';
                        }
                    }
                });
            });

        });

</script>