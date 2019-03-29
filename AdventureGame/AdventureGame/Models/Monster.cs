using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AdventureGame.Models
{
    public class Monster
    {
        public string MonsterType { get; set; }
        public int MonsterHealth { get; set; }
        public int MonsterStrength { get; set; }
        public int MonsterIntellect { get; set; }
        public int MonsterAgility { get; set; }
        public int MonsterLuck { get; set; }
        public string MonsterDescription { get; set; }
    }
}
