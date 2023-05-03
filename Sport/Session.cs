using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sport
{
    public static class Session
    {
        public static User User { get; set; }

        public static bool IsAdmin()
        {
            if (User == null)
            {
                return false;
            }
            return User.Role.RoleName == "Администратор";
        }

        public static bool IsManager()
        {
            if (User == null)
            {
                return false;
            }
            return User.Role.RoleName == "Менеджер";
        }

        public static bool IsClient()
        {
            if (User == null)
            {
                return false;
            }
            return User.Role.RoleName == "Клиент";
        }

        public static void Clear()
        {
            User = null;
        }
    }
}
