using AdventureGame.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace AdventureGame.DAL
{
    public class RoomSqlDAL
    {
        private readonly string connectionString;
        public RoomSqlDAL(string connectionString)
        {
            this.connectionString = connectionString;
        }

        public RoomLocated FindRoom(int id)
        {
            RoomLocated room = new RoomLocated();
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("Select * from Room where room_id= @room_id", conn);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        room = new RoomLocated
                        {
                            RoomId = Convert.ToInt32(reader["room_id"]),
                            RoomName = Convert.ToString(reader["name"]),
                            RoomDescription = Convert.ToString(reader["description"])
                        };
                        return room;
                    }
                   
                }
            }
            catch (Exception)
            {

                throw;
            }
            return room;
        }
    }
}
