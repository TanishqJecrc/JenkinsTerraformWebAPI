using System.ComponentModel.DataAnnotations;

namespace WebApplication1.Models
{
    public class Employee
    {
        [Required]
        public int Id { get; set; }
        [Required]
        [StringLength(20, MinimumLength = 3, ErrorMessage ="Employee Name Should have 3 to 20 Characters")]
        public string Name { get; set; }
        [Required]
        [StringLength(20, MinimumLength = 3, ErrorMessage = "Employee Job Should have 3 to 20 Characters")]
        public string Job { get; set; }
        [Required]
        [Range(0.01, 99999, ErrorMessage ="Employee Salary must be below 9999 and positive")]
        public double Salary { get; set; }


    }
}
