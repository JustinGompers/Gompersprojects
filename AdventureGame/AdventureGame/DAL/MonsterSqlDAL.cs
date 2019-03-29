using AdventureGame.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace AdventureGame.DAL
{
    public class MonsterSqlDAL
    {
        private readonly string connectionString;
        public MonsterSqlDAL(string connectionString)
        {
            this.connectionString = connectionString;
        }

        public GroupOfEnemies GetMonster(int monsterId, int numberOfMonsters)
        {
            Monster monsters = new Monster();
            GroupOfEnemies enemyGroup = new GroupOfEnemies();
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("Select * from Monster where monster_id= @monster_id", conn);
                    cmd.Parameters.AddWithValue("monster_id", monsterId);
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        monsters.MonsterType = Convert.ToString(reader["Type"]);
                        monsters.MonsterHealth = Convert.ToInt32(reader["Health"]);
                        monsters.MonsterStrength = Convert.ToInt32(reader["Strength"]);
                        monsters.MonsterIntellect = Convert.ToInt32(reader["Intellect"]);
                        monsters.MonsterAgility = Convert.ToInt32(reader["Agility"]);
                        monsters.MonsterLuck = Convert.ToInt32(reader["Luck"]);
                        monsters.MonsterDescription = Convert.ToString(reader["Description"]);
                    }
                    enemyGroup.MonsterType = monsters;
                    enemyGroup.Quantity = numberOfMonsters;
                }
                return enemyGroup;
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}
