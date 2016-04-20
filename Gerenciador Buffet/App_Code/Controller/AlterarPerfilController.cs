using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Linq;
using System.Linq;
using System.Web;


public class AlterarPerfilController
{
    private ConnectData banco;

    public AlterarPerfilController()
    {
        banco = new ConnectData();
    }

    public Usuario pesquisar(int id)
    {
        return banco.pesquisa<Usuario>(p => p.usuario_id == id);
    }

    public void alterar(Usuario cliente)
    {
        banco.atualiza<Usuario>(cliente);
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