using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;

public class UsuarioController
{

    private ConnectData banco;

    public UsuarioController()
    {
        banco = new ConnectData();
    }

    public Usuario pesquisar(int id)
    {
        return banco.pesquisa<Usuario>(p => p.usuario_id == id);
    }
    public Festa pesquisaFesta(int id)
    {
        return banco.pesquisa<Festa>(p => p.festa_id == id);
    }
    public void atualizar(Festa festa)
    {
        banco.atualiza<Festa>(festa);
    }

}