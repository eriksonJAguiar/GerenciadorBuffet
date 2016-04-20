using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

public class LoginController : ApiController
{

    private ConnectData banco;

    public LoginController()
    {
        banco = new ConnectData();
    }

    public Usuario pesquisar(string login)
    {
        return banco.pesquisa<Usuario>(p => p.login == login);
    }
}
