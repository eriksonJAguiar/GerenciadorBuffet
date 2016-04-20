using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;

public class DadosFestasController
{
    private ConnectData banco;

	public DadosFestasController()
	{
        banco = new ConnectData();
	}

    public Usuario pesquisarUsuario(int id)
    {
        return banco.pesquisa<Usuario>(p => p.usuario_id == id);
    }

    public Festa pesquisarFestas(int id)
    {
        return banco.pesquisa<Festa>(p => p.festa_id == id);
    }

    public Alimento pesquisarAlimento(int id)
    {
        return banco.pesquisa<Alimento>(p => p.alimento_id == id);
    }

    public Bebida pesquisarBebida(int id)
    {
        return banco.pesquisa<Bebida>(p => p.bebida_id == id);
    }

    
    public void cadastrar(Festa festa)
    {
        banco.cadastrar<Festa>(festa);
    }

    public void cadastrar(Iten item)
    {
        banco.cadastrar<Iten>(item);
    }

    public void alterar(Festa festa)
    {
        banco.atualiza<Festa>(festa);
    }
}