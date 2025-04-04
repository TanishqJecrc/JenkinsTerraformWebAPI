using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using WebApplication1.Models;

namespace WebApplication1.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EmployeeController : ControllerBase
    {
        private static List<Employee> employees = new List<Employee>() {
            new Employee {Id = 1, Name = "Somay Verma" , Job = "CEO", Salary = 912394
            }
        };

        [HttpGet]
        public IActionResult GetEmployees()
        {
            return Ok(employees);
        }

        [HttpPost]
        public IActionResult AddEmployee([FromBody] Employee employeeobj)
        {
            if(ModelState.IsValid == false)
            {
                return BadRequest(ModelState);
            }

            employees.Add(employeeobj);

            return Ok("New Employee is added to Company Server");
        }

        [HttpPut]
        public IActionResult EditEmployee([FromBody] Employee employeeobj)
        {
            if(ModelState.IsValid == false)
            {
                return BadRequest(ModelState);
            }
            foreach(Employee employee in employees)
            {
                if (employee.Id == employeeobj.Id){
                    employee.Id = employeeobj.Id;
                    employee.Name = employeeobj.Name;
                    employee.Job = employeeobj.Job;
                    employee.Salary = employeeobj.Salary;
                }
            }
            return Ok("Employee  Details Edited");
        }
    }
}
