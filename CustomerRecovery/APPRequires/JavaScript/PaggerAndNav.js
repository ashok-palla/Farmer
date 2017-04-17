/*
Sr.No  |       Name       |      Date        |               Purpose                    |       EMP ID         |
................................................................................................................
----------------------------------------------------------------------------------------------------------------
1.     |    Ashok Palla   |   20-Nov-2014    |           Implemented Logic              |                      |
----------------------------------------------------------------------------------------------------------------
2.     |                  |                  |                                          |                      |
----------------------------------------------------------------------------------------------------------------
3.     |                  |                  |                                          |                      |
----------------------------------------------------------------------------------------------------------------
*/

/****************************************PLEASE FOLLOW CODE COMMENTS********************************************/

//To Insert Value To The Page Records Text Box It was Get Call From TableFoot MEthod
function PageRecords(ID) {
    $('#change-page-size').val(ID);
    $('.footable').data('page-size', ID);
    $('.footable').trigger('footable_initialized');
}
//To Insert Value To The Page Navigation Text Box It was Get Call From TableFoot MEthod
function PageNav(ID) {
    $('#change-nav-size').val(ID);
    $('.footable').data('limit-navigation', ID);
    $('.footable').trigger('footable_initialized');
}
//To Insert Table Footer With Pagination 
function TableFoot(ColSpan)
{
    //<td><label class="col-sm-2 control-label" id="RecordsPerPage" style="font-weight: normal; width: auto; padding: 0px; padding-right: 2px">Records:</label><div class="col-sm-1" style="padding: 0px; width: 30px"><div class="input-group"><input class="form-control" type="text" value="10" id="change-page-size" style="height: 24px; padding: 2px 1px; width: 40px; text-align: center;"><div class="input-group-btn"><button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" style="padding: 1px"><span class="caret"></span></button><ul class="dropdown-menu dropdown-menu-right" role="menu" style="min-width: 0px; width: auto"><li><a href="#" onclick="PageRecords(5)">5</a></li><li><a href="#" onclick="PageRecords(10)">10</a></li><li><a href="#" onclick="PageRecords(15)">15</a></li><li><a href="#" onclick="PageRecords(20)">20</a></li></ul></div></div></div></td>
    //<td><div style="padding: 0px; float: right"><div class="input-group"><input class="form-control" type="text" id="change-nav-size" value="10" style="height: 24px; padding: 2px 1px; width: 40px; text-align: center; float: right"><div class="input-group-btn"><button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" style="padding: 1px"><span class="caret"></span></button><ul class="dropdown-menu dropdown-menu-right" role="menu" style="min-width: 0px; width: auto"><li><a href="#" onclick="PageNav(5)">5</a></li><li><a href="#" onclick="PageNav(10)">10</a></li><li><a href="#" onclick="PageNav(15)">15</a></li><li><a href="#" onclick="PageNav(20)">20</a></li></ul></div></div></div><label class="col-sm-2 control-label" id="NavPerPage" style="font-weight: normal; width: auto; padding: 0px; float: right; padding-right: 2px">Navigation:</label></td>
    var Tr = '<tr><td colspan="' + ColSpan + '"><div style="width: 100%"><div class="pagination pagination-centered" style="display: block"></div></div></td></tr>';

    $(document).ready(function () {

        //this script run when page size text box text change
        $('#change-page-size').keyup(function (e) {
            var pageSize = $(this).val();

            //this script run when UP ARROW Key Press
            if (e.keyCode == 38) {
                pageSize = parseInt(pageSize) + 1;
                $('#change-page-size').val(pageSize);
            }

            //this script run when DOWN ARROW Key Press
            if (e.keyCode == 40) {
                pageSize = parseInt(pageSize) - 1;
                $('#change-page-size').val(pageSize);
            }
            e.preventDefault();

            //This Script Run When page Size Text Box Text Zero(0)
            if (pageSize == 0) {
                $('#change-page-size').val("10");
                pageSize = 10;
            }
            $('.footable').data('page-size', pageSize);
            $('.footable').trigger('footable_initialized');
        });

        //this script run when page Nav text box text change
        $('#change-nav-size').keyup(function (e) {
            e.preventDefault();
            var navSize = $(this).val();

            //this script run when UP ARROW Key Press
            if (e.keyCode == 38) {
                navSize = parseInt(navSize) + 1;
                $('#change-nav-size').val(navSize);
            }

            //this script run when DOWN ARROW Key Press
            if (e.keyCode == 40) {
                navSize = parseInt(navSize) - 1;
                $('#change-nav-size').val(navSize);
            }

            //This Script Run When page Nav Text Box Text Zero(0)
            if (navSize == 0) {
                $('#change-nav-size').val("10");
                navSize = 10;
            }
            $('.footable').data('limit-navigation', navSize);
            $('.footable').trigger('footable_initialized');
        });
    });

    return Tr;
}

/****************************************THANKING YOU********************************************/