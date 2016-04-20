using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;


public class AdminController
{
    private ConnectData banco;

    public AdminController()
    {
        banco = new ConnectData();
    }

    public Usuario pesquisarLogin(string login) 
    {
        return banco.pesquisa<Usuario>(p => p.login == login);
    }

    public Usuario pesquisarSenha(string senha)
    {
        return banco.pesquisa<Usuario>(p => p.senha == senha);
    }

    public Usuario pesquisarEmail(string email)
    {
        return banco.pesquisa<Usuario>(p => p.email == email);
    }


    public Festa pesquisarFesta(int id)
    {
        return banco.pesquisa<Festa>(p => p.festa_id == id);
    }

    public void atualizar(Festa festa)
    {
        banco.atualiza<Festa>(festa);
    }

    public void atualizar(Usuario admin)
    {
        banco.atualiza<Usuario>(admin);
    }
}