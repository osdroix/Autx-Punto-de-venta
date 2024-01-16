$(document).ready(function() {

            OpenPay.setId('mzdtln0bmtms6o3kck8f');
            OpenPay.setApiKey('pk_f0660ad5a39f4912872e24a7a660370c');
            OpenPay.setSandboxMode(true);
            //Se genera el id de dispositivo
            var deviceSessionId = OpenPay.deviceData.setup("processCard", "deviceIdHiddenFieldName");
            
            var sucess_callbak = function(response) {
              alert('Operación exitosa');
              //parent.location.href="/aut/Clientes/main.jsp"
              parent.location.href="Controlador?accion=CompraCliente";
              var popUp = window.open("Controlador?accion=ImprimirTicket","Ticket");
                    if (popUp == null || typeof(popUp)=='undefined') {
                    alert('Por favor deshabilita el bloqueo de popUp para imprimir tu ticket'); 
                } else {
                    popUp.focus();
                }
              var token_id = response.data.id;
              $('#token_id').val(token_id);
              $('#processCard').submit();
            };

            var error_callbak = function(response) {
                var desc = response.data.description != undefined ? response.data.description : response.message;
                alert("ERROR [" + response.status + "] " + desc);
                $("#makeRequestCard").prop("disabled", false);
            };
            
            $('#makeRequestCard').on('click', function(event) {
                event.preventDefault();
                $("#makeRequestCard").prop( "disabled", true);
                OpenPay.token.extractFormAndCreate('processCard', sucess_callbak, error_callbak);                
            });


        });