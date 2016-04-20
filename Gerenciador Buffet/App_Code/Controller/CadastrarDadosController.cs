using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;


public class CadastrarDadosController : ApiController
{

    private ConnectData banco;

    public CadastrarDadosController()
    {
        banco = new ConnectData();
    }

    public void cadastrar(Usuario cliente)
    {
        banco.cadastrar<Usuario>(cliente);
    }
}
