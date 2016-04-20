
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("GarconsContratados")]
    public partial class GarconsContratado
    {
        [Key]
        public int garcon_contratado_id { get; set; }

        public int idGarcon { get; set; }

        public int idFesta { get; set; }

        [StringLength(50)]
        public string fone { get; set; }

        [StringLength(50)]
        public string email { get; set; }

        [Column(TypeName = "date")]
        public DateTime? data { get; set; }

        [Column(TypeName = "money")]
        public decimal? valorPago { get; set; }

        [StringLength(50)]
        public string status { get; set; }

        public virtual Festa Festa { get; set; }

        public virtual Garcon Garcon { get; set; }
    }

