using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AdventureGame.Models
{
    public class Hero
    {
        public string HeroName { get; set; }
        public int HeroStrength { get; set; }
        public int Herointellect { get; set; }
        public int HeroAgility { get; set; }
        public int HeroLuck { get; set; }
        public int HeroHealth { get; set; }
        public int HeroGold { get; set; }
        public PouchModel InventroyPouch { get; set; }
        public SpellBook HeroSpells { get; set; }

    }
}
