
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Usuario
    {
        [Key]
        public int usuario_id { get; set; }

        [StringLength(50)]
        public string nome { get; set; }

        [StringLength(50)]
        public string cpf { get; set; }

        [StringLength(50)]
        public string endereco { get; set; }

        [StringLength(50)]
        public string cidade { get; set; }

        [StringLength(50)]
        public string fone { get; set; }

        [StringLength(50)]
        public string login { get; set; }

        [StringLength(50)]
        public string senha { get; set; }

        [StringLength(3)]
        public string aceitoTermos { get; set; }

        [StringLength(50)]
        public string email { get; set; }
    }

