var file
$(document).ready(function() {
    var fileConfig = {
        uploadPanel:$("#picPath"),
        "fileName": "picPath",
        height:"60px;",
        width:"90px;"
    }
    file =   new   fileUpload(fileConfig) ;
    reloadPage();
    $(".form-horizontal").validationEngine({
        validationEventTriggers:"keyup blur"
    });
});