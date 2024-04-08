using System.Data.SqlClient;
using Dapper;
public static class BD
{
    private static string connectionString = @"Server=localhost;DataBase=ReservaRestaurantes;Trusted_Connection=True;";
    public static Cliente user;

    public static void AgregarRestaurante(Restaurante resto)
    {
        using(SqlConnection db = new SqlConnection(connectionString))
        {
            string sp = "sp_AgregarRestaurante";
            db.Execute(sp, new{@NomRestaurante = resto.Nombre, @Direccionn = resto.Direccion, @HoraApertura = resto.HorarioApertura, @HoraClausura = resto.HorarioClausura, @FechaFunda = resto.FechaFundacion, @Img = resto.Imagen, @Descripcionn = resto.Descripcion}, 
            commandType: System.Data.CommandType.StoredProcedure);
        }
    }
    public static void AgregarReseña(int IdCliente, int IdRestaurante, string Comentario, int Valoracion)
    {
        using(SqlConnection db = new SqlConnection(connectionString))
        {
            string sp = "sp_AgregarReseña";
            db.Execute(sp, new{@IdResto = IdRestaurante, @IdClient = IdCliente, @Comment = Comentario, @Valoracion = Valoracion}, 
            commandType: System.Data.CommandType.StoredProcedure);
        }
    }
    public static List<Restaurante> GetListaRestaurantes()
    {
        List<Restaurante> ListaRestaurantes = null;
        using(SqlConnection db = new SqlConnection(connectionString))
        {
            string sp = "sp_GetListaRestaurantes";
            ListaRestaurantes = db.Query<Restaurante>(sp, commandType: System.Data.CommandType.StoredProcedure).ToList();
        }
        return ListaRestaurantes;
    }
      public static void AgregarReserva(int IdRestaurante, int IdCliente, DateTime FechaReserva, string HoraReserva, int CantidadPersonas)
    {
        using(SqlConnection db = new SqlConnection(connectionString))
        {
            string sp = "sp_AgregarReserva";
            db.Execute(sp, new{@IdRestaurante = IdRestaurante, @IdCliente = IdCliente, @FechaReserva = FechaReserva, @Hora = HoraReserva, @Cantidad = CantidadPersonas}, 
            commandType: System.Data.CommandType.StoredProcedure);
        }
    }

     public static void AgregarCliente(Contacto contacto)
{
    using (SqlConnection db = new SqlConnection(connectionString))
    {
        string sp = "sp_Contacto";
        db.Execute(sp, new
        {
            @Nombre = contacto.Nombre,
            @Apellido = contacto.Apellido,
            @Telefono = contacto.Telefono,
            @Email = contacto.Email,
            @Mensaje = contacto.Mensaje,
            @IdCliente = contacto.IdCliente
        },
        commandType: System.Data.CommandType.StoredProcedure);
    }
}

    public static Restaurante GetInfoRestaurante(int idRestaurante)
{
    Restaurante restaurante = null; 
    using(SqlConnection db = new SqlConnection(connectionString))
    {
        string sp = "sp_GetInfoRestaurante";
        restaurante = db.QueryFirstOrDefault<Restaurante>(sp, new{@IdRestaurante = idRestaurante}, 
        commandType: System.Data.CommandType.StoredProcedure);
    }
    return restaurante;
}
    public static List<Reseña> GetListaReseñasDeUnRestaurante(int idRestaurante)
    {
        List<Reseña> ListaReseñas = new List<Reseña>();
        using(SqlConnection db = new SqlConnection(connectionString))
        {
            string sp = "sp_GetListaReseñasDeUnRestaurante";
            ListaReseñas = db.Query<Reseña>(sp,new{@IdRestaurante = idRestaurante}, 
            commandType: System.Data.CommandType.StoredProcedure).ToList();
        }
        return ListaReseñas;
    }
    public static void Registro(Cliente cliente)
    {
        using(SqlConnection db = new SqlConnection(connectionString))
        {
            string sp = "sp_Registro";
            db.Execute(sp, new{@Nombre = cliente.Nombre, @Apellido = cliente.Apellido,  @Email = cliente.Email, @Contraseña = cliente.Contraseña}, 
            commandType: System.Data.CommandType.StoredProcedure);
        }
    }
    public static void Contactanos(Contacto clienteContactado)
    {
        using(SqlConnection db = new SqlConnection(connectionString))
        {
            string sp = "sp_Contacto";
            db.Execute(sp, new{ @IdCliente = clienteContactado.IdCliente ,@Nombre = clienteContactado.Nombre, @Apellido = clienteContactado.Apellido,@Telefono = clienteContactado.Telefono,  @Email = clienteContactado.Email, @mensaje = clienteContactado.Mensaje}, 
            commandType: System.Data.CommandType.StoredProcedure);
        }
    }

    
    public static Cliente VerificarCredenciales(string Email, string Contraseña)
    {
            string sp = "sp_VerificarCredenciales";
            using (SqlConnection db = new SqlConnection(connectionString))
        {
            Cliente usuario = db.QueryFirstOrDefault<Cliente>(sp, new {@Email = Email}, 
            commandType: System.Data.CommandType.StoredProcedure);

            if (usuario != null && usuario.Contraseña == Contraseña)
            {
                return usuario; 
            }
            else
            {
                return null;
            }
        }
    }
    public static Cliente ObtenerContraseñaPorEmail(string email)
    {
        string sp = "sp_VerificarCredenciales";
        using (SqlConnection db = new SqlConnection(connectionString))
        {
            return db.QueryFirstOrDefault<Cliente>(sp, new {@Email = email},
            commandType: System.Data.CommandType.StoredProcedure);
        }
    }

     public static void EliminarRestaurante(int IdRestaurante)
    {
        using(SqlConnection db = new SqlConnection(connectionString))
        {
            string sp = "sp_EliminarRestaurante";
            db.Execute(sp, new{@IdRestaurante = IdRestaurante}, 
            commandType: System.Data.CommandType.StoredProcedure);
        }
    }
     public static void EliminarReserva(int IdReserva)
    {
        using(SqlConnection db = new SqlConnection(connectionString))
        {
            string sp = "sp_EliminarReserva";
            db.Execute(sp, new{@IdReserva = IdReserva}, 
            commandType: System.Data.CommandType.StoredProcedure);
        }
    }
    public static List<Reserva> GetListaReservaDeUnCliente(int idCliente)
    {
        List<Reserva> ListaReservas = new List<Reserva>();
        using(SqlConnection db = new SqlConnection(connectionString))
        {
            string sp = "sp_GetListaReservaDeUnCliente";
            ListaReservas = db.Query<Reserva>(sp,new{@IdCliente = idCliente}, 
            commandType: System.Data.CommandType.StoredProcedure).ToList();
        }
        return ListaReservas;
    }

    public static List<Restaurante> GetListaRestauranteReservaDeUnCliente(int idCliente)
    {
        using(SqlConnection db = new SqlConnection(connectionString))
        {
            string sp = "sp_GetListaRestauranteReservaDeUnCliente";
            return db.Query<Restaurante>(sp,new{@IdCliente = idCliente}, 
            commandType: System.Data.CommandType.StoredProcedure).ToList();
        }
    }

    public static List<Cliente> GetInfoReseña(int idRestaurante)
{
    List<Cliente> clientes = new List<Cliente>(); 
    using(SqlConnection db = new SqlConnection(connectionString))
    {
        string sp = "sp_GetInfoReseña";
        clientes = db.Query<Cliente>(sp,new{@IdRestaurante = idRestaurante}, 
        commandType: System.Data.CommandType.StoredProcedure).ToList();
    }
    return clientes;
}
    public static float calcularValoracionPromedio(int idRestaurante)
{
     using(SqlConnection db = new SqlConnection(connectionString))
        {
            string sp = "sp_CalcularValoracionPromedio";
            return db.QueryFirstOrDefault<float>(sp, new{@IdRestaurante = idRestaurante}, 
            commandType: System.Data.CommandType.StoredProcedure);
        }
       
}
   
}