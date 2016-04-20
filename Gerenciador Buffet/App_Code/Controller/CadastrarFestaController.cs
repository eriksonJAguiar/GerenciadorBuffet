using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;

public class CadastrarFestaController
{
    private ConnectData banco;
   

    public CadastrarFestaController()
    {
        banco = new ConnectData();
    }
    
    public Usuario pesquisar(int id)
    {
        return banco.pesquisa<Usuario>(p => p.usuario_id == id);
    }

    public void cadastrar(Festa festa)
    {
        banco.cadastrar<Festa>(festa);
    }

    public void cadastrar(Iten item)
    {
        banco.cadastrar<Iten>(item);
    }
}