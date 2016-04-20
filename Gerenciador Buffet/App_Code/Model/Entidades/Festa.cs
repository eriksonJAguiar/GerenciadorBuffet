
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Festa
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Festa()
        {
            GarconsContratados = new HashSet<GarconsContratado>();
            Itens = new HashSet<Iten>();
        }

        [Key]
        public int festa_id { get; set; }

        public int? idCliente { get; set; }

        [StringLength(100)]
        public string tipoFesta { get; set; }

        public int? numeroConvidados { get; set; }

        public int? quantidadeCadeiras { get; set; }

        public int? quantidadeMesas { get; set; }

        [StringLength(100)]
        public string local { get; set; }

        [StringLength(50)]
        public string data { get; set; }

        [StringLength(50)]
        public string status { get; set; }

        [Column(TypeName = "money")]
        public decimal? valorTotal { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<GarconsContratado> GarconsContratados { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Iten> Itens { get; set; }
    }

