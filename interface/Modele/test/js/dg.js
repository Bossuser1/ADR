
//var Listdatalist = [];
var DG_ContainerID = "DG_CONTAINER";
var DG_PAGE_SIZE = 5;
var DG_CUR_PAGE_NBR = 1;
var DG_TOT_PAGE_NBR = 0;
var DG_TOT_LINE_NBR = 0;
var DG_TABLE_HEIGHT = 200;
var DG_COLUMN_SEARCH = "Tous";


function DG_SetFormProp() {

    var FormName = "ModalWindow";
    var TableName = DG_TABLE_NAME;

    $.ajax({
        url: "../DBAWebService.asmx/GetTabInfoByName",
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        data: "{tableName:'" + TableName + "'}",

        success: function (response) {
            tabInfo = response.d;
            $.each(tabInfo.Columns, function (index, ColInfo) {
                var id = ColInfo.COLUMN_NAME;
                if ($('#' + id).length > 0) {
                    var htmlNode = $("#" + FormName).find('#' + id);
                   
                    if (htmlNode !== undefined) {
                        var info_supp = ColInfo.MS_DESCRIPTION + ".#."
                            + "[" + TableName + "]." + id
                            + "<p>Type: " + ColInfo.DATA_TYPE
                            + " Nullable:" + ColInfo.IS_NULLABLE
                            + " Auto Inc: " + ColInfo.IS_AUTO_INCRIMENT
                            + " Max: " + ColInfo.CHARACTER_MAXIMUM_LENGTH
                            + " Pre Key: " + ColInfo.IS_PRIMARY_KEY;
                        htmlNode.attr('infoSupp', info_supp);

                        if (ColInfo.IS_NULLABLE === false) {
                            //htmlNode.css("background-color", "#FFF9C4"); /*$("#" + $FormName).find('#' + id).css("background-color", "#FFF9C4"); */
                            htmlNode.css("border", "1px solid  rgb(160,160,255)");
                        }

                        if (ColInfo.IS_AUTO_INCRIMENT || ColInfo.IS_PRIMARY_KEY) {
                            htmlNode.prop('readonly', true);
                            htmlNode.css("background-color", "#FFF9C4");
                            htmlNode.css("border", "1px solid   #c3c3c3");
                            htmlNode.css("color", "#938f9c");
                        }
                    }
                }
            });
        },
        error: function (err) { alert(err); }
    });
}      


$(document).ready(function () {
  
    console.clear();
    //alert("01");
    DG_Create();
   // alert("1");
    DG_Load_ColumnList();
   // alert("2");
    $("#DG_CUR_PAGE_NBR").val("1");
    $("#DG_PAGE_SIZE").val("5");



    /*Focused info show*/
    $("input").focus(function () {
        var infoSupp = $(this).attr('infoSupp');
        if (infoSupp !== undefined) $("#infoSupp").html(infoSupp.split('.#.')[0]);
        else $("#infoSupp").html("");
    });

    $("#ModalWindow").on("keyup", "input", function (e) {

        var infoSupp = $(this).attr('infoSupp');
        if (e.which === 112)
            if (infoSupp !== undefined) $("#infoSupp").html(infoSupp.split('.#.')[1]);
            else $("#infoSupp").html("");

    });


  

    $(document).on("click", "button", function () {
       
        var id = $(this).attr('id');
        var qtype = $(this).attr('name');
        $("#DG_COLUMN_SEARCH").val("Tous"); 

        if (qtype === "delete" || qtype === "update") {
            var ListDataCond = [];
            console.clear();
            $(this).closest("tr").find('td').each(function (index, element) {
                var input = $(this);
                var key = input.attr('columnName');
                var val = element.innerText.trim();
                if (key !== undefined && val !== "") { var obj = { "_key": key, "_val": val }; ListDataCond.push(obj);   }
            });
            if (qtype === "delete") { DG_LINE_DELETE(id, ListDataCond);  }
        }
        if (id === "DG_CHANGE_CUR_PAGE_NBR") { DG_PAGE_CHANGE(); }
        if (id === "DG_SEARCH_BTN") { DG_Load(); DG_COUNTERS(); DG_PAGE_CHANGE(); } 

        if (id === "ModalBtnOpen") {
          
            //var ListdataModal = [];
            $("#ModalWindow").css('display', 'block');
            /*$(this).closest("tr").find('td').each(function (index, element) {
                var input = $(this);
                var key = input.attr('columnName');
                var val = element.innerText.trim();
                if (key !== undefined && val !== "") { var obj = { "_key": key, "_val": val }; ListdataModal.push(obj); }
            });*/
            var idTR = $(this).closest("tr").attr('id');

            var tag = $("#ModalQueryTag").attr("QueryTag");
       
 
            LoadForm("ModalWindow", idTR, tag);
            DG_SetFormProp();
        }

        if (id === "ModalBtnOK") {
            var ListdataModalUP = [];
            $("#ModalWindow").find("select, input,textarea").each(function (index, element) {

                var key = element.id;
               
                var val = "";
                if ($(element).attr('type') === "checkbox") { val = $(element).prop("checked"); }
                if ($(element).attr('type') === "radio") { val = $(element).prop("checked"); }
                if ($(element).attr('type') === "text") { val = $(element).val(); }
                if ($(element).attr('type') === "select") { val = $(element).val(); }
                if ($(element).attr('type') === "textarea") { val = $(element).val(); alert("bjr2");}
                var obj = { "_key": key, "_val": val.trim() }
                
                ListdataModalUP.push(obj);
            });
            DG_ExecQuery(DG_TABLE_NAME, "update", ListdataModalUP)

            $("#ModalWindow").css('display', 'none');
        }
         
        if (id === "ModalBtnClose") {
            $("#ModalWindow").css('display', 'none');
        }


        if (id === "ModBtnOpenColOption") {
            DG_Load_ColOptList();
            $("#ModalWin_ColOpt").css('display', 'block');
        }


        if (id === "ModalBtnOK_ColOpt") {
            var ListdataModal_ColOpt = [];

            $("#CheckBox_ColOpt").find("select, input").each(function (index, element) {
                var key = element.id.replace("_ColOpt", "").trim();
                var val = "";
                if ($(element).attr('type') === "checkbox") { val = $(element).prop("checked"); }
                if ($(element).attr('type') === "textarea") { val = $(element).val(); alert("textArea"); }
                var obj = { "_key": key, "_val": val}
                ListdataModal_ColOpt.push(obj);


                var objIndex = DG_Definition.findIndex((obj => obj.ColName === key));
                console.log("objIndex:" + objIndex + " key:" + key + " val:" + val);

                DG_Definition[objIndex].Visible = val

                if (val === true)  $("#Col_" + key).css('visibility', 'visible');
                
                else $("#Col_" + key).css('visibility', 'collapse');
                
            });
            $("#ModalWin_ColOpt").css('display', 'none');

        }

        if (id === "ModalBtnClose_ColOpt") {
            $("#ModalWin_ColOpt").css('display', 'none');
        }


    });

    $(document).on("change", "select", function () {
        var id = $(this).attr('id');

        if (id === "DG_PAGE_SIZE") { DG_PAGE_SIZE_CHANGE($(this).val()); }
        if (id === "DG_COLUMN_SEARCH") { DG_COLUMN_SEARCH = $(this).val(); /*console.log("DG_COLUMN_SEARCH:" + DG_COLUMN_SEARCH);*/ DG_Load(); }
    });  

    $(document).on("keyup", "input", function (e) {
       
        if ($(this).attr('id') === "DG_SEARCH_KEY") { DG_Load(); DG_PAGE_CHANGE();} 
        if ($(this).attr('id') === "DG_CUR_PAGE_NBR") { DG_PAGE_CHANGE(); }  
    }); 


    /*
    recherche par double click
    */
    $(document).on('dblclick', 'td', function (element) {
        if ($(this).closest("table").attr('id') === "DG_TABLE")
        {
            var search_key = $(this).text().trim();
            var col_search = $(this).attr('columnName').trim();
 
            $("#DG_SEARCH_KEY").val(search_key);

            DG_COLUMN_SEARCH = col_search;
            $("select#DG_COLUMN_SEARCH option")
                .each(function () { this.selected = (this.text === col_search); });
 
            DG_Load(); DG_COUNTERS(); DG_PAGE_CHANGE();
        }
    });


    var selectIndex = 0;

    $(document).on('click', 'tr', function (e) {

      

        if ($(this).closest("table").attr('id') === "DG_TABLE") {
            $("#" + selectIndex).css('background-color', 'white');

            $("#DG_TABLE").removeClass("table-striped");
            $("#DG_TABLE").removeClass("table-hover");


            $("#DG_TABLE").addClass("table-striped");
            $("#DG_TABLE").addClass("table-hover");

            selectIndex = $(this).attr('id');
            //console.log("selectIndex: " + selectIndex);

            if (selectIndex != undefined)
            {
                $(this).css('background-color', '#d8d0d0');
            }
            $(this).focus();
        }
    });





    $(document).on("keydown", "", function (e) {


        if ($("#" + selectIndex).length > 0)
        {
            $("#" + selectIndex).css('background-color', 'white');


            if (e.which === 38) {
                // Up Arrow
                if ($("#" + selectIndex).prev().length > 0)
                selectIndex = $("#" + selectIndex).closest('tr').prev().attr('id');

            } else if (e.which === 40) {
                // Down Arrow
                if ($("#" + selectIndex).next().length > 0)
                selectIndex = $("#" + selectIndex).closest('tr').next().attr('id');
            }

            $("#DG_TABLE").removeClass("table-striped");
            $("#DG_TABLE").removeClass("table-hover");


            $("#DG_TABLE").addClass("table-striped");
            $("#DG_TABLE").addClass("table-hover");
            $("#" + selectIndex).css('background-color', '#d8d0d0');
        }
    }); 
  
});
 

function DG_LoadModal($ListdataModal) {
    console.log("DG_LoadModal()");
    console.log("$ListdataModal:" + $ListdataModal.length);
    console.log("key:" + $ListdataModal[0]._key);
    for (var i=0; i < $ListdataModal.length; i++)
    {
        $("#ModalWindow").find("#" + $ListdataModal[i]._key.trim()).val($ListdataModal[i]._val.trim());
        console.log("$ListdataModal:" + $ListdataModal[i]._key + " val:" + $ListdataModal[i]._val);
       // if()
    } 
}

function LoadForm($FormLoad, $FormCondition, $QueryTag) {
    var ListDataCond = [];
    $('#' + $FormCondition).find('td').each(function (index, element) {
        var input = $(this);
        var key = input.attr('columnName');
        var val = element.innerText.trim();

        if (key !== undefined && val !== "") { var obj = { "_key": key, "_val": val }; ListDataCond.push(obj);  }
    });

    $.ajax({
        url: "../DBAWebService.asmx/GetData",
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        data: " { listdata :" + JSON.stringify(ListDataCond) + ", qryTag:'" + $QueryTag+"'}",
        success: function (response) {
            var datalist = [];
            datalist = response.d;
            if (datalist.length === 0) { console.log("  HUPPS .... à traiter ce cas !!!!datalist.length:" + datalist.length); }
            if (datalist[0].List.length === 0) { console.log("  HUPPS .... à traiter ce cas !!!!datalist[0].List.length:"); }
            //console.clear();
            if (datalist.length > 0 && datalist[0].List.length > 0) {
                $.each(datalist[0].List, function (index, data) {
                    //console.log("  _key:" + data._key.trim() + "  _val:" + data._val);
                    var element = $('#' + $FormLoad).find('#' + data._key.trim());
                    if ($(element).length > 0) {
                        if ($(element).attr('type') === "checkbox") { val = $(element).prop('checked', data._val); }
                        if ($(element).attr('type') === "radio") { val = $(element).prop('checked', data._val); }
                        if ($(element).attr('type') === "text") { $(element).val(data._val);  }
                        if ($(element).attr('type') === "select") { $(element).val(data._val); }
                        if ($(element).attr('type') === "textarea") { $(element).val(data._val); alert("bjr1");}
                   
                    }
                });
            }
        },
        error: function (err) { alert(err.statusCode); }
    });
}


function DG_Load_ColOptList() {
    var checkbox1 = "";
    $.each(DG_Definition, function (index, def) {
        if (def.Visible === true)
        { checkbox1 = checkbox1 + '<div><input type="checkbox" id="' + def.ColName + '_ColOpt" checked>  <label>' + def.ColName + '</label></div>'; }
        else
        { checkbox1 = checkbox1 + '<div><input type="checkbox" id="' + def.ColName + '_ColOpt">   <label>' + def.ColName + '</label></div>'; }
    });

  
    //console.log("checkbox1:" + checkbox1);
    $("#CheckBox_ColOpt").html(checkbox1);
}



function DG_Load_ColumnList() {
    var select1 = "";
    $.each(DG_Definition, function (index, def) {
        if (def.Visible === true) { select1 = select1 + '<OPTION value="' + def.ColName + '">' + def.ColumnHeader + '</OPTION>';} 
    });
    select1 = '<SELECT  id="DG_COLUMN_SEARCH"> <OPTION value="Tous">Tous</OPTION>' + select1 + "</SELECT>";
    //console.log("select1:" + select1);
    $("#DG_COLUMN_SEARCH").html(select1); 
}




function DG_PAGE_SIZE_CHANGE($PageSize){
    DG_PAGE_SIZE = $PageSize;
    if (DG_PAGE_SIZE === "5") { DG_TABLE_HEIGHT = 200; }
    else if (DG_PAGE_SIZE === "10") { DG_TABLE_HEIGHT = 300;}
    else if (DG_PAGE_SIZE === "100") { DG_TABLE_HEIGHT = 400; }
    else if (DG_PAGE_SIZE === "1000") { DG_TABLE_HEIGHT = 500; }
    else { DG_PAGE_SIZE === "10000"}
    DG_COUNTERS();
    DG_PAGE_CHANGE();
}

function DG_COUNTERS() {
    DG_TOT_PAGE_NBR = Math.ceil(DG_TOT_LINE_NBR / DG_PAGE_SIZE);
    $("#DG_TOT_PAGE_NBR").text(DG_TOT_PAGE_NBR);
    $("#DG_TOT_LINE_NBR").text(DG_TOT_LINE_NBR);
    //DG_CUR_PAGE_NBR DG_TOT_PAGE_NBR DG_PAGE_SIZE
}

function DG_LINE_DELETE($idTR, $ListDataCond) {
    /*var ind = $(this).attr('id'); delete RowColumn[ind];*/
    console.log("----");
    DG_ExecQuery(DG_TABLE_NAME, "delete", $ListDataCond)
    //$("#" + $idTR).closest("tr").hide(); DG_TOT_LINE_NBR--; DG_COUNTERS();
    //DG_Create();
}

function DG_PAGE_CHANGE() {
    DG_CUR_PAGE_NBR = $("#DG_CUR_PAGE_NBR").val();
    if (DG_CUR_PAGE_NBR === "") { DG_CUR_PAGE_NBR = 1; $("#DG_CUR_PAGE_NBR").html("1"); }

    if (DG_CUR_PAGE_NBR > DG_TOT_PAGE_NBR) { DG_CUR_PAGE_NBR = DG_TOT_PAGE_NBR; $("#DG_CUR_PAGE_NBR").val(DG_CUR_PAGE_NBR); }
    else if (DG_CUR_PAGE_NBR < 1) { DG_CUR_PAGE_NBR = "1"; $("#DG_CUR_PAGE_NBR").val(DG_CUR_PAGE_NBR); }
    
    DG_Load();
    //console.log("DG_CUR_PAGE_NBR: " + DG_CUR_PAGE_NBR);
}


function DG_Create() {
    //console.log("DG_Create:");
    var ListDataCond = [];
    var obj = { "_key": "1", "_val": "2" }
    ListDataCond.push(obj);

    $.ajax({
        url: "../DBAWebService.asmx/GetData",
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        data: " { listdata :" + JSON.stringify(ListDataCond) + ", qryTag:'" + DG_QUERY_TAG + "'}",
        success: function (response) {            
            Listdatalist = response.d;

            if (Listdatalist.length === 0) { console.log("  HUPPS .... à traiter ce cas !!!!datalist.length:" + datalist.length); }
            if (Listdatalist.length > 0)
            {
               
            }
            DG_Load(); 
        },
        error: function (err) { alert(err.statusCode); }
    });
}



function DG_Load() {
    var col1 = " <colgroup>";
    var th1 = "";
    var widthTot = 82;
    var container = $("#" + DG_ContainerID);
   
    table1 = '<table id="DG_TABLE" style="border:2px solid black; width:900px; height:30px; overflow:auto;border-radius:25px;border-left:20px solid #193648;border-right:20px solid #193648;border-top:2px solid #193648;">'; //class="table table-hover table-striped"
    table1 = table1 + "<thead ><tr>";
   // table1 = table1 + '<th width="50px" >index</th>\n' 
    col1 = col1 + '<col  style="width:50px" id="col_index">\n';

        

    $.each(DG_Definition, function (index, def) {
        if (def.Visible === true)
        {
            col1 = col1 + '<col   style="width:"' + def.Width + 'px"  id="Col_' + def.ColName + '"  >\n';
            th1 = th1 + '<th width="' + def.Width + 'px"  >' + def.ColumnHeader + '</th>\n'
        }
        else
        {
            col1 = col1 + '<col style="visibility:collapse"  id ="Col_' + def.ColName + '">\n';
            th1 = th1 + '<th width="' + def.Width + 'px"  >' + def.ColumnHeader + '</th>\n'
        }       
      
    });

    th1 = th1 + '<th width="20px" class="DG_th">#</th>\n'
    th1 = th1 + '<th width="20px"   class="DG_th" >#</th>\n'

    col1 = col1 + '<col  style="width:20px;" id ="col_del">';
    col1 = col1 + '<col  style="width:20px;" id ="col_up">';
    col1 = col1 + '</colgroup>';

    table1 = table1 + th1 + "</tr></thead>";
    table1 = table1 + col1;

    var tr1 = "";
    var td1 = "";
    //console.log("$Listdatalist.length "+ $Listdatalist.length +" /10: "+ Math.ceil($Listdatalist.length / 10) );

    var searchValue = $("#DG_SEARCH_KEY").val().trim();
    //var searchValue = "Usr20";

    var RowColumn = [];

    $.each(Listdatalist, function (index, datalist, def) {
        var Row = [];
        var match = false;
        var key = "";
        var value = "";

        $.each(DG_Definition, function (index, definition) {
            key = "";
            value = "";

            var obj = $.grep(datalist.List, function (element, index) {
                return element._key === definition.ColName;
            });

            if (obj.length > 0) {
                if (DG_COLUMN_SEARCH === "Tous") {
                    if ((searchValue !== "" && String(obj[0]._val).trim().indexOf(searchValue) !== -1) || (searchValue === "")) { match = true; }
                }
                else {
                    if (DG_COLUMN_SEARCH === obj[0]._key && ((searchValue !== "" && String(obj[0]._val).trim().indexOf(searchValue) !== -1) || (searchValue === ""))) { match = true; }
                }
            }

            if (obj.length > 0) {
                key = obj[0]._key; value = obj[0]._val;
                Row.push({ _key: key, _val: value });
            }
            else if (obj.length === 0) { obj._key = definition; obj._val = "NOTFOUND"; Row.push({ _key: key, _val: value }); }
        });

        if (match === true) { RowColumn.push(Row); }
    });
    //console.log("RowColumn[0][0]._key: " + RowColumn[0][0]._key);
 //   delete RowColumn[0]; 

    DG_TOT_LINE_NBR = RowColumn.length;
    DG_COUNTERS();

    //console.log("RowNbr:" + RowColumn.length);
    table1 = table1 + "<tbody class='table table-hover thead-light'  style='border:2px solid black; overflow: auto;' >" ;

    for (RowCounter = 0; RowCounter < RowColumn.length; RowCounter ++)
    {
        if (RowColumn[RowCounter] !== undefined) {
            if (((DG_PAGE_SIZE * (DG_CUR_PAGE_NBR - 1)) - 1 < RowCounter && RowCounter <= (DG_PAGE_SIZE * DG_CUR_PAGE_NBR) - 1)) {
                td1 = "";
                tr1 = tr1 + '<tr  id="TR-' + RowCounter + '" name="tr">\n';
               // td1 = td1 + '<td  width="50px">' + RowCounter + '</td>';

                for (ColCounter = 0; ColCounter < RowColumn[RowCounter].length; ColCounter++) {
 

                    td1 = td1 + "<td columnName='" + RowColumn[RowCounter][ColCounter]._key.trim() + "' style='padding-right:10px; ' >" + String(RowColumn[RowCounter][ColCounter]._val).trim() + "</td>";

                }
                td1 = td1 + '<td  width="20px" name="td"  ' + RowCounter+'>'
                td1 = td1 + '<button name="delete" id="' + RowCounter + '" style="background-color:transparent; border-color:transparent;">'; //style="display:none;"
                td1 = td1 + '<img name="imgDelete" src="img/delete.png" height=16 width=16 />';
                td1 = td1 + '</button>';
                td1 = td1 + '</td> ';
                td1 = td1 + '<td width="20px" ><button name="update" id="ModalBtnOpen" style="background-color:transparent; border-color:transparent;">'
                td1 = td1 + '<img name="imgUpdate" src="img/update.png" height=16 width=16 />';
                td1 = td1 + '</button></td>';
                tr1 = tr1 + td1 + "\n</tr>\n";
            }

        }
    }
   
    table1 = table1 + tr1;
    table1 = table1 + '</tbody>';
    table1 = table1 + '</table>' ;
    //console.log(table1);
    container.html(table1);     
}


function DG_ExecQuery($TableName, $QueryType, $ListDataCond) {
    console.log($TableName + " ----- " + $QueryType + " - " + $ListDataCond.length);
    $.ajax({
        url: "../DBAWebService.asmx/ExecQuery",
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        data: " {tableName :'" + $TableName + "', queryType :'" + $QueryType + "', listparam :" + JSON.stringify($ListDataCond) + "}",
        success: function (response) { var dicos = response.d;console.log("dicos:" + dicos);},
        error: function (err) {alert(err);}
    });
}
