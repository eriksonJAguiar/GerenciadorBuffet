    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Alimentos")]
    public partial class Alimento
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Alimento()
        {
            Itens = new HashSet<Iten>();
        }

        [Key]
        public int alimento_id { get; set; }

        [StringLength(50)]
        public string nome { get; set; }

        public string descricao { get; set; }

        [StringLength(50)]
        public string imagemAlimento { get; set; }

        public int? quantidade { get; set; }

        [Column(TypeName = "money")]
        public decimal? valorUnitario { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Iten> Itens { get; set; }
    }

