using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using ProyectoFinal4To.Models;

namespace ProyectoFinal4To.Controllers;

public class DennysController : Controller
{
     private readonly ILogger<DennysController> _logger;

    public DennysController(ILogger<DennysController> logger)
    {
        _logger = logger;
    }
      public IActionResult Login()
    {
        return View("Login");
    }
      public IActionResult Ayuda()
    {
        return View("Ayuda");
    }
     
    public IActionResult Bienvenida()
    {
        ViewBag.ListaRestaurantes = BD.GetListaRestaurantes();
        ViewBag.Cliente = BD.user;
        return View("Bienvenida");
    }
    

    public IActionResult Registrarte(int IdUsuario)
    {
        ViewBag.IdUsuarioo = IdUsuario;
        return View("Registro");
    }

    public bool GuardarReseñaAjax(int IdCliente, int IdRestaurante, string Comentario, int Valoracion)
    {
        BD.AgregarReseña(IdCliente, IdRestaurante, Comentario, Valoracion);
        return true;
    }
    
    public void GuardarReservaAjax(int IdRestaurante, int IdCliente, DateTime fechaReserva, int personasReserva, string horarioReserva,int CantReservas)
    {
        BD.AgregarReserva(IdRestaurante, IdCliente, fechaReserva, horarioReserva, personasReserva,CantReservas );
    }

    public void GuardarClienteContactado(Contacto contacto)
    {
        contacto.IdCliente = BD.user.IdCliente;
        BD.AgregarCliente(contacto);    
    }
    

   public IActionResult IniciarSesion(string Email, string Contraseña)
{
    Cliente cliente = BD.VerificarCredenciales(Email, Contraseña);
        
    if (cliente != null)
    {
        BD.user = cliente;
        ViewBag.ListaRestaurantes = BD.GetListaRestaurantes();
        return RedirectToAction("Bienvenida");
    }
    else
    {
        ViewBag.Error = "Email o contraseña incorrectos.";
        return View("Login");
    }
}

public IActionResult OlvideMiContraseña()
{
    return View("RecuperarContraseña");
}

[HttpPost]
public IActionResult RecuperarContraseña(string email)
{
    Cliente cliente = BD.ObtenerContraseñaPorEmail(email);

    if (cliente != null)
    {
        ViewBag.ContraseñaRecuperada = cliente.Contraseña;
    }
    else
    {
        ViewBag.ErrorRecuperación = "Email no encontrado.";
    }

    return View("RecuperarContraseña");
}
public IActionResult VerMas(int id)
{
    Restaurante restaurante = BD.GetInfoRestaurante(id);
    ViewBag.InfoRes = restaurante;
    ViewBag.ListaReseñas = BD.GetListaReseñasDeUnRestaurante(id);
    ViewBag.InfoReseñas = BD.GetInfoReseña(id);
    ViewBag.ValoracionPromedio = BD.calcularValoracionPromedio(id);
    return View("VerMas");
}
  

public IActionResult AgregarRestaurante()
{
    return View("AgregarRestaurante");
}

public IActionResult GuardarRestaurante(Restaurante resto)
{
    BD.AgregarRestaurante(resto);
    return RedirectToAction("Bienvenida");
}
public IActionResult EliminarRestaurante(int idResto)
{
    BD.EliminarRestaurante(idResto);
    return RedirectToAction("Bienvenida");
}

public IActionResult EliminarReserva(int idReserva, int idCliente)
{
    BD.EliminarReserva(idReserva);
    ViewBag.ListaReservas = BD.GetListaReservaDeUnCliente(idCliente);
    ViewBag.Restaurantes = BD.GetListaRestauranteReservaDeUnCliente(idCliente);
    return View("Reservas");
}

public IActionResult ObtenerReservas(int idCliente)
{
    ViewBag.ListaReservas = BD.GetListaReservaDeUnCliente(idCliente);
    ViewBag.Restaurantes = BD.GetListaRestauranteReservaDeUnCliente(idCliente);
    return View("Reservas");
}

public IActionResult GuardarCliente(Cliente cliente)
{
    BD.Registro(cliente);
    return View("Login");
}




    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}




