using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace KidManagementSystem.Models
{
    public class vAdmissions
    {
        public string StudentName { get; set; }
        public string StandardName { get; set; }
        public string SessionName { get; set; }
        public int age { get; set; }
        public long TotalFees { get; set; }
        public int FeeInstallmentPending { get; set; }
        [Key]
        public int AdmissionId { get; set; }
    }
}
