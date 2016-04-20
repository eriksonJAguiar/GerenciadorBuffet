using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Data.Linq;
using System.Linq;
using System.Linq.Expressions;
using System.Web;



[NotMapped]
public class ConnectData
{
    private Banco context;



    public ConnectData()
    {
        context = new Banco();
       
    }
    public void atualiza<T>(T item) where T :class
    {
         context.Entry<T>(item).State = EntityState.Modified;
         context.SaveChanges();
    }

    public void deletar<T>(T item) where T :class
    {
        context.Entry<T>(item).State = EntityState.Deleted;
        context.SaveChanges();
    }

    public virtual void cadastrar<T>(T item)where T :class 
    {
        context.Set<T>().Add(item);
        context.SaveChanges();
    }
    
    public T pesquisa<T>(Func<T, bool> where, params Expression<Func<T, object>>[] propriedades)where T :class
    {
        IQueryable<T> query = context.Set<T>();

        foreach (Expression<Func<T, object>> navigationProperty in propriedades)
            query = query.Include<T, object>(navigationProperty);

        T item = null;


        item = query.AsNoTracking().FirstOrDefault(where);


        return item;

    }

    
}