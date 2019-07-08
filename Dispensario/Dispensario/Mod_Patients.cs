using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Connection;

namespace Models
{
    public class Mod_Patients
    {
        int id;
        string firstName;
        string lastName;
        int dni;
        string address;
        string town;
        string dateOfBirth;
        int phone;
        int healthCareId;
        string sex;
        string gender;
        bool validateData;

        public int Id { get => id; set => id = value; }
        public string FirstName { get => firstName; set => firstName = value; }
        public string LastName { get => lastName; set => lastName = value; }
        public int Dni { get => dni; set => dni = value; }
        public string Address { get => address; set => address = value; }
        public string Town { get => town; set => town = value; }
        public string DateOfBirth { get => dateOfBirth; set => dateOfBirth = value; }
        public int Phone { get => phone; set => phone = value; }
        public int HealthCareId { get => healthCareId; set => healthCareId = value; }
        public string Sex { get => sex; set => sex = value; }
        public string Gender { get => gender; set => gender = value; }
        public bool ValidateData { get => validateData; set => validateData = value; }

        public Mod_Patients(int id, string firstName, string lastName, int dni, 
                            string address, string town, string dateOfBirth, int phone, 
                            int healthCareId, string sex, string gender, bool validateData)
        {
            this.id = id;
            this.firstName = firstName;
            this.lastName = lastName;
            this.dni = dni;
            this.address = address;
            this.town = town;
            this.dateOfBirth = dateOfBirth;
            this.phone = phone;
            this.healthCareId = healthCareId;
            this.sex = sex;
            this.gender = gender;
            this.validateData = validateData;
        }


    }
}
