
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Bebida
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Bebida()
        {
            Itens = new HashSet<Iten>();
        }

        [Key]
        public int bebida_id { get; set; }

        [StringLength(50)]
        public string nome { get; set; }

        public string descricao { get; set; }

        [StringLength(50)]
        public string imagemBebida { get; set; }

        public int? quantidade { get; set; }

        [Column(TypeName = "money")]
        public decimal? valorUnitario { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Iten> Itens { get; set; }
    }

