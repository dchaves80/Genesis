var to = null;

$(window).on('load', function () {
    $('.FieldInput').each(function () {
        $(this).keyup(function () {
            if (to != null) {
                clearTimeout(to);
            }
            to = setTimeout(Guardar, 2000);
        });
    });
});

function Guardar()
{
    UpdateField();
}

function UpdateField()
{
    $.ajax(
        {
            url: "Modules/DynamicField/WebServiceDynamicField.aspx",
            async: false,
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