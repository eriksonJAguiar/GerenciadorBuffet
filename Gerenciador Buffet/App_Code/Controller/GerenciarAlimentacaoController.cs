using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;


public class GerenciarAlimentacaoController
{
    private ConnectData banco;
    

    public GerenciarAlimentacaoController()
	{
        banco = new ConnectData();
        
    }

    public Usuario pesquisarUsuario(int id)
    {
       return banco.pesquisa<Usuario>(p => p.usuario_id == id);
    }

    public Alimento pesquisarAlimento(int id)
    {
        return banco.pesquisa<Alimento>(p => p.alimento_id == id);
    }

    public void cadastrar(Alimento alimento)
    {
        banco.cadastrar<Alimento>(alimento);
    }
    public void deletar(Alimento alimento)
    {
        banco.deletar<Alimento>(alimento);
    }
    public void atualizar(Alimento alimento)
    {
        banco.atualiza<Alimento>(alimento);
    }
}