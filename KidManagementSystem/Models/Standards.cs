using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace KidManagementSystem.Models
{
    public class Standards
    {
        [Key]
        public int StandardId { get; set; }
        public string StandardName { get; set; }
        public int SeatAvailable { get; set; }
        public long TotalFees { get; set; }
        public int SessionId { get; set; }

    }
}
