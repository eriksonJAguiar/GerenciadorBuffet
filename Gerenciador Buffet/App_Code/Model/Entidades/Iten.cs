
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Iten
    {
        [Key]
        public int itens_id { get; set; }

        public int? idAlimentos { get; set; }

        public int? idBebidas { get; set; }

        public int? idFesta { get; set; }

        public int? quantidade { get; set; }

        public virtual Alimento Alimento { get; set; }

        public virtual Bebida Bebida { get; set; }

        public virtual Festa Festa { get; set; }
    }

