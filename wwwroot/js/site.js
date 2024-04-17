﻿    
    function validarContraseña() { const campoContraseña = document.getElementById('contraseña').value,
    campoContraseña2 = document.getElementById('contraseña2').value;
    let validar = false
    const incorrecta1 = document.getElementById('incorrecta1')
    incorrecta1.innerHTML = ""
    const incorrecta2 = document.getElementById('incorrecta2')
    incorrecta2.innerHTML = ""
    const email = document.getElementById('email').value;
    if (validar = true) {
        if(campoContraseña != campoContraseña2){
            incorrecta1.innerHTML = "Las contraseñas no coinciden"
            return false;
        }
        else{

            if (campoContraseña.length < 8 || campoContraseña2.length < 8) {
              incorrecta1.innerHTML = 'La contraseña debe tener al menos 8 caracteres.';
              return false;  }  
              else {
                if (email.includes('@')) {
                  return true;
                } else{
                  incorrecta1.innerHTML = 'el correo electronico no es valido.';
                  return false;
                }  
                }
        }
    }
  }

    function cargarIdRestaurante(IdRestaurante){
        $('#IdRestaurante').val(IdRestaurante)
    }
    
    function alertaReserva() {
        Swal.fire({
            title: "Reserva enviada",
            text: "  Reserva enviada con exito!!",
            icon: 'success',
            confirmButtonText: 'Volver',
            footer: '<span class="rojo"> Esta  informacion es importante!</span>',
            timer: 100000,
            timerProgressBar: true,
            allowOutsideClick: false,
            allowEscapeKey: true,
            allowEnterKey: true,
            stopKeydownPropagation: false,
        });
    }
    function alertaCliente() {
      Swal.fire({
          title: "Gracias por contactarte con nosotros!!!",
          text: "En menos  de 24 horas le responderemos!",
          icon: 'success',
          confirmButtonText: 'Volver',
          footer: '<span class="rojo"> Esta  informacion es importante!</span>',
          timer: 10000,
          timerProgressBar: true,
          allowOutsideClick: false,
          allowEscapeKey: true,
          allowEnterKey: true,
          stopKeydownPropagation: false,
      });
  }
    function GuardarReseña(IDCliente, IdRestaurante) {
      let comentario = $('#comentario').val();
      let valoracion = $("input[type=radio][name=Valoracion]:checked").val();

      $.ajax(
        {
            type: 'POST',
            dataType: 'JSON',
            url: '/Dennys/GuardarReseñaAjax',
            data: { IdCliente: IDCliente, IdRestaurante: IdRestaurante, Comentario: comentario, Valoracion: valoracion},
            success:
                function (response) 
                {
                  window.location.reload();
                }
        });
    }


    function GuardarReserva(IDCliente) {
      let IdRes = $('#IdRestaurante').val();
      const fecha = localStorage.getItem("fecha-reserva"),
        personas = localStorage.getItem("personas-reserva"),
        horario = localStorage.getItem("horario-reserva");

      $.ajax(
        {
            type: 'POST',
            dataType: 'JSON',
            url: '/Dennys/GuardarReservaAjax',
            data: { IdRestaurante: IdRes, IdCliente: IDCliente, fechaReserva: fecha, personasReserva: personas, horarioReserva: horario},
            success:
                function (response) 
                {

                }
        });
    }

    function GuardarCliente(IDCliente) {
      
      const nombre = $("#Nombre").val(),
        apellido = $("#Apellido").val(),
        email = $("#Email").val(),
        telefono = $("#Telefono").val(),
        mensaje = $("#Mensaje").val();
      $.ajax(
        {
            type: 'POST',
            dataType: 'JSON',
            url: '/Dennys/GuardarClienteContactado',
            data: {Nombre: nombre, Apellido: apellido, Telefono: telefono, Email:email, Mensaje:mensaje},
            success:
                function (response) 
                {
                  alertaCliente();
                }
        });
    }

    

    function Calendario() {
        (async () => {
            const { value: date } = await Swal.fire({
              title: "Elegi una fecha para la reserva! ",
              input: "date",
              didOpen: () => {
                const today = (new Date()).toISOString();
                Swal.getInput().min = today.split("T")[0];
              }
            });
            if (date) {
              Swal.fire("Fecha de Reserva", date);
            }
            localStorage.setItem("fecha-reserva", date);
          })()
}
   

    function SeleccionarCantidadPersonas() {
        (async () => {
          const { value: personas } = await Swal.fire({
            title: "Seleccione la cantidad de personas para la reserva",
            input: "select",
            inputOptions: {
              1: "1 persona",
              2: "2 personas",
              3: "3 personas",
              4: "4 personas",
              5: "5 personas",
              6: "6 personas",
              7: "7 personas",
              8: "8 personas",
            },
            inputPlaceholder: "Seleccione la cantidad de personas",
            showCancelButton: true,
          });
      
          if (personas) {
            Swal.fire(`Reserva para ${personas}`);
          }
          localStorage.setItem("personas-reserva", personas);
        })();
      }

      function SeleccionarHorario() {
        (async () => {
          const { value: horario } = await Swal.fire({
            title: "Seleccione el horario para la reserva",
            input: "select",
            inputOptions: {
              "12:00 PM": "12:00 PM",
              "1:00 PM": "1:00 PM",
              "2:00 PM": "2:00 PM",
              "6:00 PM": "6:00 PM",
              "7:00 PM": "7:00 PM",
              "8:00 PM": "8:00 PM",
              "9:00 PM": "9:00 PM",
              "10:00 PM": "10:00 PM",
            },
            inputPlaceholder: "Seleccione el horario",
            showCancelButton: true,
          });
      
          if (horario) {
            Swal.fire(`Reserva para las ${horario}`);
          }
          localStorage.setItem("horario-reserva", horario);
        })();
      }


      function validarLongitud(elemento) {
        var maxCaracteres = 500;
        var longitudActual = elemento.value.length;
        var caracteresRestantes = maxCaracteres - longitudActual;
  
        var contador = document.getElementById('contador');
        contador.textContent = caracteresRestantes + '/500';
  
        if (caracteresRestantes < 0) {
          contador.classList.add('excedido');
        } else {
          contador.classList.remove('excedido');
        }
      }

      document.addEventListener('DOMContentLoaded', function() {
        // Agregar un evento 'submit' al formulario de búsqueda
        document.getElementById('formBusqueda').addEventListener('submit', function(event) {
            event.preventDefault(); // Evitar el envío automático del formulario
            filtrarRestaurantes(); // Llamar a la función de filtrado
        });
    });
    
    // Función para filtrar los restaurantes por nombre
    function filtrarRestaurantes() {
        var input = document.querySelector('#inputBusqueda');
        var filtro = input.value.trim().toUpperCase(); // Usar trim() para eliminar espacios en blanco al inicio y al final
    
        var restaurantes = document.querySelectorAll('.padre2');
    
        restaurantes.forEach(function(restaurante) {
            var nombreRestaurante = restaurante.querySelector('.div-p-nombre p').textContent.toUpperCase(); // Obtener el texto del nombre del restaurante
            // Comprobar si el nombre del restaurante contiene el filtro
            if (nombreRestaurante.includes(filtro)) {
                restaurante.style.display = ''; // Mostrar el restaurante si coincide con el filtro
            } else {
                restaurante.style.display = 'none'; // Ocultar el restaurante si no coincide con el filtro
            }
        });
    }

  
