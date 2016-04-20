using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;



public class CadastrarController
{
    private ConnectData banco;

    public CadastrarController()
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

    public Usuario pesquisarCpf(string cpf)
    {
        return banco.pesquisa<Usuario>(p => p.cpf == cpf);
    }

    public Usuario pesquisarEmail(string email)
    {
        return banco.pesquisa<Usuario>(p => p.email == email);
    }

   
}