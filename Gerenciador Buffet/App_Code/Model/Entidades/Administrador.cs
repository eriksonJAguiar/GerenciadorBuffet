using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;
using System.Web;

/// <summary>
/// Padrão Singleton no ADM
/// </summary>

public class Administrador
{
    private static Administrador instance = null;


    private Administrador() { }


    public static Administrador getInstance()
    {
        if (instance == null)
            instance = new Administrador();   
        return instance;
    }

    public string nome { get; set; }
    public string login { get; set; }
    public string senha { get; set; }
    public string email { get; set; }
   
}