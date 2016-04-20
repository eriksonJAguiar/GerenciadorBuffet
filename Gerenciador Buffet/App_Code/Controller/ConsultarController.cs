using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public class ConsultarController
{
	private ConnectData banco;

    public ConsultarController()
    {
        banco = new ConnectData();
    }

    public object pesquisar(int id)
    {
         return banco.pesquisa<Usuario>(p => p.usuario_id == id);
    }

}