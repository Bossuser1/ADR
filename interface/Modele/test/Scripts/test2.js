var tabInfo = null;


$(window).on('load', function () {
 
      //TabName = "UsrTable";
    console.log("1");

    SetFormProp("form2", "UsrTable");
});


$(document).ready(function () {

    $('input').on("change paste keyup",function () {

        //console.log("1: " + $(this).val());
        //myFunction($(this));
    });
});


$(document).ready(function () {

    $('button').click(function () {
        console.clear();
        //---------------------------------------------------------------
        if ($(this).attr('id') === "btn_TabInfo") {
            var a;
        }
    });
});




function LoadForm($FormLoad, $FormCondition, $QueryTag) {

    var ListDataCond = [];
            var FormConditionElements = $('#' + $FormCondition).find("select, input");
            FormConditionElements.each(function (index, element)
            {
                var name = element.id;
                var val = "";
                if ($(element).attr('type') === "checkbox"){ val = $(element).prop("checked"); }
                if ($(element).attr('type') === "radio") { val = $(element).prop("checked"); }
                if ($(element).attr('type') === "text") { val = $(element).val(); }
                if ($(element).attr('type') === "select") { val = $(element).val(); }
                var obj = { "_key": name, "_val": val.trim() }
                ListDataCond.push(obj);
            });

    $.ajax({
        url: "DBAWebService.asmx/GetData",
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",       
        data: " { listdata :" + JSON.stringify(ListDataCond ) + ", qryTag:'GetUsrByID'}",
        success: function (response) {
            var datalist = [];
            datalist = response.d;

            if (datalist.length === 0) { console.log("  HUPPS .... à traiter ce cas !!!!datalist.length:" + datalist.length); }
                
            if (datalist.length > 0 && datalist[0].List.length > 0)
            {
                $.each(datalist[0].List, function (index, data) {
                   //console.log("  _key:" + data._key + "  _val:" + data._val);
                   var element = $('#' + $FormLoad).find('#' + data._key);
                   if ($(element).length > 0)
                   {
                       if ($(element).attr('type') === "checkbox") { val = $(element).prop('checked', data._val); }
                       if ($(element).attr('type') === "radio") { val = $(element).prop('checked', data._val); }
                       if ($(element).attr('type') === "text") { $(element).val(data._val); }
                       if ($(element).attr('type') === "select") { $(element).val(data._val ); }
                    }
                });
            }
        },
        error: function (err) { alert(err.statusCode); }
    });
}      



function SetFormProp($FormName, $TabName ) {
    $.ajax({
        url: "DBAWebService.asmx/GetTabInfoByName",
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        data: "{tableName:'" + $TabName + "'}",

        success: function (response) {
            tabInfo = response.d;
            $.each(tabInfo.Columns, function (index, ColInfo) {
                var id = ColInfo.COLUMN_NAME;
                if ($('#' + id).length > 0) {
                    var htmlNode = $("#" + $FormName).find('#' + id);
                    if (ColInfo.IS_NULLABLE === false) { htmlNode.css("background-color", "#FFF9C4"); /*$("#" + $FormName).find('#' + id).css("background-color", "#FFF9C4"); */}     
                }
            });
        },
        error: function (err) {alert(err);}
    });
}      



function myFunction($elmnt) {

    var len = $elmnt.val().trim().length; //ColInfo.CHARACTER_MAXIMUM_LENGTH < $("#form2").find('#' + id).text().length;
    var id = $elmnt.attr("id");

    $.each(tabInfo.Columns, function (index, ColInfo) {

        var colname = ColInfo.COLUMN_NAME;

        if (id === colname)
        {
            var len = $elmnt.val().trim().length; //ColInfo.CHARACTER_MAXIMUM_LENGTH < $("#form2").find('#' + id).text().length;
            var max_len = ColInfo.CHARACTER_MAXIMUM_LENGTH;

            var elmnt = $("#form2").find('#' + id);
            if (ColInfo.IS_NULLABLE === false)
            {
                $elmnt.attr("required");
                $elmnt.css("background-color", "#FFF9C4");
                 
            }



            console.log("id:" + id + "  max_len:" + ColInfo.CHARACTER_MAXIMUM_LENGTH);
             
            $elmnt.next().text("") ;
            $elmnt.css("background-color", "#FFF9C4");


 
            if ((max_len !== -1) && (max_len < len)) {

                if ($elmnt.next().text() !== "longeur max " + max_len + " depassé")
                    $elmnt.after("<label>longeur max " + max_len + " depassé<label>");

                $elmnt.css("background-color", "#FBE9E7");
            }

            if ((ColInfo.IS_NULLABLE === false) && len === 0) {
                if ($elmnt.next().text() !== "vide interdit")
                    $elmnt.after("<label>vide interdit<label>")

                $elmnt.css("background-color", "#FBE9E7");
            }
     // Verification de type à faire
        }
    });
 
}





function TestFunc($FormLoad, $FormCondition, $QueryTag) {

    var ListDataCond = [];
    var FormConditionElements = $('#' + $FormCondition).find("select, input");
    FormConditionElements.each(function (index, element) {
        var name = element.id;
        //var val = "";
        //if ($(element).attr('type') === "checkbox") { val = $(element).prop("checked"); }
        //if ($(element).attr('type') === "radio") { val = $(element).prop("checked"); }
        //if ($(element).attr('type') === "text") { val = $(element).val(); }
        //if ($(element).attr('type') === "select") { val = $(element).val(); }
        //var obj = { "_key": name, "_val": val }
        //ListDataCond.push(obj);
    });

    $.ajax({
        url: "DBAWebService.asmx/GetData",
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        data: " { listdata :" + JSON.stringify(ListDataCond) + ", qryTag:'" + $QueryTag+"'}",
        success: function (response) {
            var datalist = [];
            datalist = response.d;

            if (datalist.length === 0) { console.log("  HUPPS .... à traiter ce cas !!!!datalist.length:" + datalist.length); }

            if (datalist.length > 0 && datalist[0].List.length > 0) {

                $.each(datalist, function (index, dlist) {
                    console.log("----------------------------------");
                    $.each(dlist.List, function (index, data) {
                        console.log("  _key:" + data._key + "  _val:" + data._val);
                        //var element = $('#' + $FormLoad).find('#' + data._key);
                        //if ($(element).length > 0) {
                        //    if ($(element).attr('type') === "checkbox") { val = $(element).prop('checked', data._val); }
                        //    if ($(element).attr('type') === "radio") { val = $(element).prop('checked', data._val); }
                        //    if ($(element).attr('type') === "text") { $(element).val(data._val); }
                        //    if ($(element).attr('type') === "select") { $(element).val(data._val); }
                        //}
                    });
                });
            }
        },
        error: function (err) { alert(err.statusCode); }
    });
}      






function TestFunc1(  $QueryTag) {

    console.log("!!!!!!!!!!!!!!!!!!");
    var ListDataCond = [];
   

    $.ajax({
        url: "DBAWebService.asmx/GetData",
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        data: " { listdata :" + JSON.stringify(ListDataCond) + ", qryTag:'" + $QueryTag + "'}",
        success: function (response) {
            var datalist = [];
            datalist = response.d;

            if (datalist.length === 0) { console.log("  HUPPS .... à traiter ce cas !!!!datalist.length:" + datalist.length); }

            if (datalist.length > 0 && datalist[0].List.length > 0) {

                $.each(datalist, function (index, dlist) {
                    console.log("----------------------------------");
                    $.each(dlist.List, function (index, data) {
                        console.log("  _key:" + data._key + "  _val:" + data._val);
                        //var element = $('#' + $FormLoad).find('#' + data._key);
                        //if ($(element).length > 0) {
                        //    if ($(element).attr('type') === "checkbox") { val = $(element).prop('checked', data._val); }
                        //    if ($(element).attr('type') === "radio") { val = $(element).prop('checked', data._val); }
                        //    if ($(element).attr('type') === "text") { $(element).val(data._val); }
                        //    if ($(element).attr('type') === "select") { $(element).val(data._val); }
                        //}
                    });
                });
            }
        },
        error: function (err) { alert(err.statusCode); }
    });
}      
