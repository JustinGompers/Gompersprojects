using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AdventureGame.Models
{
    public class RoomDescription
    {
        public Hero ChosenHero {get;set;}
        public RoomLocated Room { get; set; }
        public GroupOfEnemies Monsters { get; set; }
    }
}
