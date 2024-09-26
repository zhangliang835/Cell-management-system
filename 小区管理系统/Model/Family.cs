using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class Family
    {
        public int Id { get; set; }
        public string Name1 { get; set; }
        public int ResidentId { get; set; }
        public int FamilySex { get; set; }
        public string Relation { get; set; }
        public string FamilyPhoto { get; set; }

        public Family(int id, string name1, int residentId, int familySex, string relation, string familyPhoto)
        {
            Id = id;
            Name1 = name1;
            ResidentId = residentId;
            FamilySex = familySex;
            Relation = relation;
            FamilyPhoto = familyPhoto;
        }

        public Family()
        {
        }
    }
}
