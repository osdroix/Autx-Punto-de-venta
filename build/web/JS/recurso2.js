$(document).ready(function(){
    $("tr #btnDelete").click(function(){
        var idp = $(this).parent().find("#idp").val();
        swal({
            title: "¿Estás seguro de eliminarlo?",
            text: "Puede volver a agregarlo después...",
            icon: "warning",
            buttons: true,
            dangerMode: true,
        }).then((willDelete) => {
                if (willDelete) {
                    eliminar(idp);
                    swal("Producto eliminado con éxito", {
                    icon: "success",
                }).then((willDelete) =>{
                    if (willDelete) {
                        location.href = "Controlador?accion=Carrito";
                    }
                });
                } else {
                    swal("Producto no eliminado");
                }
        });
        
    });
    
    function eliminar(idp){
        var url ="Controlador?accion=Delete";
        $.ajax({
            type: 'POST',
            url : url,
            data : "idp="+idp,
            success: function (data, textStatus, jqXHR){
            }
        });
    }
});



