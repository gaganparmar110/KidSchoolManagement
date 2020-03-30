using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace KidManagementSystem.Models
{
    public class vEnquiryAdmissions
    {
        public string SessionName { get; set; }
        public string StandardName { get; set; }
        public int SeatAvailable { get; set; }
        public long TotalFees { get; set; }
        [Key]
        public int StandardId { get; set; }
        public long FirstInstallment { get; set; }
        public long SecondInstallment { get; set; }
        public long ThirdInstallment { get; set; }
    }
}
