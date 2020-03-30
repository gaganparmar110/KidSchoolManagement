using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace KidManagementSystem.Models
{
    public class FeesStructures
    {
        [Key]
        public int FeeStructureId { get; set; }
        public long FirstInstallment { get; set; }
        public long SecondInstallment { get; set; }
        public long ThirdInstallment { get; set; }
        public int StandardId { get; set; }
    }
}
