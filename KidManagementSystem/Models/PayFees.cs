using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace KidManagementSystem.Models
{
    public class PayFees
    {
        [Key]
        public int PayFeesId { get; set; }
        public int AdmissionId { get; set; }
        public long Fees { get; set; }
        public string StudentName { get; set; }
    }
}
