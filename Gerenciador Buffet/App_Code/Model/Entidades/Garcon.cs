
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Garcon
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Garcon()
        {
            GarconsContratados = new HashSet<GarconsContratado>();
        }

        [Key]
        public int garcon_id { get; set; }

        [StringLength(50)]
        public string nome { get; set; }

        [StringLength(50)]
        public string cpf { get; set; }

        public int? idade { get; set; }

        [StringLength(50)]
        public string sexo { get; set; }

        [StringLength(50)]
        public string telefone { get; set; }

        [StringLength(50)]
        public string email { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<GarconsContratado> GarconsContratados { get; set; }
    }

