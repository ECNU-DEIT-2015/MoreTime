$(document).ready(function () {
    changepros();
    changepros2();
});

function changepros() {
    $.ajax({
        url: '/getpros',
        type: 'post',
        contentType: 'application/x-www-form-urlencoded',
        data: {},
        dataType: "json",
        success: function (data) {
            var list = data.beanObject;
            for (var i = 1; i <= data.object; i++) {
                $('#qnjpro' + i).html("" + list[i - 1].proname);
                $('#qnjpro' + i).attr("href", "/project/" + list[i - 1].pronumber);

            }

        }
    });
}

function changepros2() {
    $.ajax({
        url: '/getpropes',
        type: 'post',
        contentType: 'application/x-www-form-urlencoded',
        data: {},
        dataType: "json",
        success: function (data) {
            if (data.errorCode == "login")
                window.location.href = "/login";
            else {
                var sizes = data.object.sizes;
                var propes = data.object.propes;
                var colors = data.object.colors;
                var pronames = data.object.pronames;

                for (var i = 0; i < sizes; i++) {
                    $('#barpro' + (i + 1)).removeAttr('hidden');
                    $('#barp' + (i + 1)).html(pronames[i]);
                    $('#barpl' + (i + 1)).attr('class', 'tooltips progress-bar ' + 'progress-bar-' + colors[i]);
                    $('#barpl' + (i + 1)).css('width', propes[i] + '%');
                }
            }
        }
    });
}