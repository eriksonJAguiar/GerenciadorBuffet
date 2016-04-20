using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;


public class GerenciarBebidaController
{
    private ConnectData banco;
    //private ConnectData<Bebida> banco2;

    public GerenciarBebidaController()
	{
        banco = new ConnectData();
        //banco2 = new ConnectData<Bebida>();
    }

    public Usuario pesquisarUsuario(int id)
    {
        return banco.pesquisa<Usuario>(p => p.usuario_id == id);
    }

    public Bebida pesquisarBebida(int id)
    {
        return banco.pesquisa<Bebida>(p => p.bebida_id == id);
    }

    public void cadastrar(Bebida bebida)
    {
        banco.cadastrar<Bebida>(bebida);
    }
    public void deletar(Bebida bebida)
    {
        banco.deletar<Bebida>(bebida);
    }
    public void atualizar(Bebida bebida)
    {
        banco.atualiza<Bebida>(bebida);
    }
}