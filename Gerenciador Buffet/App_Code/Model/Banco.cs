    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class Banco : DbContext
    {
        public Banco()
            : base("BDbuffet")
        {
        }

        public virtual DbSet<Alimento> Alimentos { get; set; }
        public virtual DbSet<Bebida> Bebidas { get; set; }
        public virtual DbSet<Festa> Festas { get; set; }
        public virtual DbSet<Garcon> Garcons { get; set; }
        public virtual DbSet<GarconsContratado> GarconsContratados { get; set; }
        public virtual DbSet<Iten> Itens { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
        public virtual DbSet<Usuario> Usuarios { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Alimento>()
                .Property(e => e.nome)
                .IsUnicode(false);

            modelBuilder.Entity<Alimento>()
                .Property(e => e.descricao)
                .IsUnicode(false);

            modelBuilder.Entity<Alimento>()
                .Property(e => e.imagemAlimento)
                .IsUnicode(false);

            modelBuilder.Entity<Alimento>()
                .Property(e => e.valorUnitario)
                .HasPrecision(19, 4);

            modelBuilder.Entity<Alimento>()
                .HasMany(e => e.Itens)
                .WithOptional(e => e.Alimento)
                .HasForeignKey(e => e.idAlimentos);

            modelBuilder.Entity<Bebida>()
                .Property(e => e.nome)
                .IsUnicode(false);

            modelBuilder.Entity<Bebida>()
                .Property(e => e.descricao)
                .IsUnicode(false);

            modelBuilder.Entity<Bebida>()
                .Property(e => e.imagemBebida)
                .IsUnicode(false);

            modelBuilder.Entity<Bebida>()
                .Property(e => e.valorUnitario)
                .HasPrecision(19, 4);

            modelBuilder.Entity<Bebida>()
                .HasMany(e => e.Itens)
                .WithOptional(e => e.Bebida)
                .HasForeignKey(e => e.idBebidas);

            modelBuilder.Entity<Festa>()
                .Property(e => e.local)
                .IsUnicode(false);

            modelBuilder.Entity<Festa>()
                .Property(e => e.data)
                .IsUnicode(false);

            modelBuilder.Entity<Festa>()
                .Property(e => e.status)
                .IsUnicode(false);

            modelBuilder.Entity<Festa>()
                .Property(e => e.valorTotal)
                .HasPrecision(19, 4);

            modelBuilder.Entity<Festa>()
                .HasMany(e => e.GarconsContratados)
                .WithRequired(e => e.Festa)
                .HasForeignKey(e => e.idFesta)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Festa>()
                .HasMany(e => e.Itens)
                .WithOptional(e => e.Festa)
                .HasForeignKey(e => e.idFesta);

            modelBuilder.Entity<Garcon>()
                .Property(e => e.nome)
                .IsUnicode(false);

            modelBuilder.Entity<Garcon>()
                .Property(e => e.cpf)
                .IsUnicode(false);

            modelBuilder.Entity<Garcon>()
                .Property(e => e.sexo)
                .IsUnicode(false);

            modelBuilder.Entity<Garcon>()
                .Property(e => e.telefone)
                .IsUnicode(false);

            modelBuilder.Entity<Garcon>()
                .Property(e => e.email)
                .IsUnicode(false);

            modelBuilder.Entity<Garcon>()
                .HasMany(e => e.GarconsContratados)
                .WithRequired(e => e.Garcon)
                .HasForeignKey(e => e.idGarcon)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<GarconsContratado>()
                .Property(e => e.fone)
                .IsUnicode(false);

            modelBuilder.Entity<GarconsContratado>()
                .Property(e => e.email)
                .IsUnicode(false);

            modelBuilder.Entity<GarconsContratado>()
                .Property(e => e.valorPago)
                .HasPrecision(19, 4);

            modelBuilder.Entity<GarconsContratado>()
                .Property(e => e.status)
                .IsUnicode(false);

            modelBuilder.Entity<Usuario>()
                .Property(e => e.nome)
                .IsUnicode(false);

            modelBuilder.Entity<Usuario>()
                .Property(e => e.cpf)
                .IsUnicode(false);

            modelBuilder.Entity<Usuario>()
                .Property(e => e.endereco)
                .IsUnicode(false);

            modelBuilder.Entity<Usuario>()
                .Property(e => e.cidade)
                .IsUnicode(false);

            modelBuilder.Entity<Usuario>()
                .Property(e => e.fone)
                .IsUnicode(false);

            modelBuilder.Entity<Usuario>()
                .Property(e => e.login)
                .IsUnicode(false);

            modelBuilder.Entity<Usuario>()
                .Property(e => e.senha)
                .IsUnicode(false);

            modelBuilder.Entity<Usuario>()
                .Property(e => e.aceitoTermos)
                .IsUnicode(false);

            modelBuilder.Entity<Usuario>()
                .Property(e => e.email)
                .IsUnicode(false);
        }
    }

