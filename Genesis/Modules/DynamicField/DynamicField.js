var to = null;
var id = null;
var val = null;
$(window).on('load', function () {
    $('.FieldInput').each(function () {

        $(this).keyup(function () {

            if (to == undefined) {
                to = setTimeout(null, 300);
            }

                clearTimeout(to);
                id = $(this).attr("data-FieldId");
                val = $(this).val();
            
            to = setTimeout(Guardar, 300);
        });
    });
    $('.FieldInput').each(function () {
        $(this).focusout(function () {

            
            id = $(this).attr("data-FieldId");
            val = $(this).val();

            Guardar();
        });
    });
});

function Guardar()
{
    UpdateField();
}

function DeleteField(idf,button)
{
    
            $.ajax(
                {
                    url: "/Modules/DynamicField/WebServiceDynamicField.aspx",
                    data: { "task": "DeleteField", "id": idf},
                    dataType: 'text',
                    success: function (data) {
                        if (data == "true") {
                            $("#Container" + idf).hide(1000);
                            
                        }
                    }

                });
       
}

function UpdateField()
{
    $.ajax(
        {
            url: "/Modules/DynamicField/WebServiceDynamicField.aspx",
            data: { "task": "Update", "id": id, "val": val },
            dataType: 'text',
            success: function (data)
            {
                if (data == "true")
                {

                }
            }

        });
}

function AddField() {
    var o = $("#prototype").clone();

    

    $.ajax(
        {
            url: "/Modules/DynamicField/WebServiceDynamicField.aspx",
            data: { "task": "NewField" },
            dataType: 'JSON',
            success: function (data) {
                InsertNewDom(data,o);
            },
            error: function () {
                MyData = -1;
            }
        });
   
} 

    function InsertNewDom(MyData,o)
    {
        if (MyData != -1) {
            o.attr("class", "Thanos");
            o.attr("id", "Container" + MyData.ID);
            o.find('.FieldInput').attr("data-FieldId", MyData.ID);
            o.find('.FieldInput').attr("value", MyData.NAME);
            o.find('#DeleteButton').attr("onclick","DeleteField(" + MyData.ID + ",this)")
            o.attr("style", "");
            o.find('.FieldInput').keyup(function () {
                if (to == undefined) {
                    to = setTimeout(null, 10000);
                }

                clearTimeout(to);
                id = $(this).attr("data-FieldId");
                val = $(this).val();

                to = setTimeout(Guardar, 1000);
            });
            o.find('.FieldInput').focusout(function () {
                id = $(this).attr("data-FieldId");
                val = $(this).val();
                Guardar();
            });
            o.appendTo($("#DynamicFieldContainer"));
        }
    }
