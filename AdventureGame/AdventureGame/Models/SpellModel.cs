using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AdventureGame.Models
{
    public class SpellModel
    {
        public int SpellKey { get; set; }
        public string SpellName { get; set; }
        public string SpellDescription { get; set; }
        public double SpellDamage { get; set; }
        public double CritChance { get; set; }
        public double Accuracy { get; set; }

    }
}
