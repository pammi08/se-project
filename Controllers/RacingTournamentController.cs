using BikeRacingTournamentSystem.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace BikeRacingTournamentSystem.Controllers
{
    [Authorize]
    public class RacingTournamentController : Controller
    {
        string Connection = "server=localhost;uid=root;" + "database=DB_BIKE_RACING; SslMode = none";
        // GET: Login

        [AllowAnonymous]
        public ActionResult Login()
        {
            return View();
        }


        [HttpPost]
        [AllowAnonymous]
        public ActionResult Login(Login obj)
        {
            DataSet ds = new DataSet();
            using (MySql.Data.MySqlClient.MySqlConnection conn = new MySql.Data.MySqlClient.MySqlConnection(Connection))
            {
                MySql.Data.MySqlClient.MySqlDataAdapter da = new MySql.Data.MySqlClient.MySqlDataAdapter("select * from TBL_Racer_Details o where o.UserName= @UserName and o.Password= @Password", conn);
                da.SelectCommand.Parameters.AddWithValue("@UserName", obj.userName);
                da.SelectCommand.Parameters.AddWithValue("@Password", obj.password);
                da.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    FormsAuthentication.SetAuthCookie(ds.Tables[0].Rows[0]["UserRoles"].ToString(), false);
                    Session["UserID"] = ds.Tables[0].Rows[0]["UserID"].ToString();
                    Session["UserRoles"] = ds.Tables[0].Rows[0]["UserRoles"].ToString();
                    return RedirectToAction("Index");
                }

            }
            return View();
        }

        [AllowAnonymous]
        public ActionResult UserRegistration()
        {
            return View();
        }


        [HttpPost]
        [AllowAnonymous]
        public ActionResult UserRegistration(RegistrationDetails obj)
        {
            int count = 0;
            using (MySql.Data.MySqlClient.MySqlConnection conn = new MySql.Data.MySqlClient.MySqlConnection(Connection))
            {
                MySql.Data.MySqlClient.MySqlCommand cmd = new MySql.Data.MySqlClient.MySqlCommand("select Count(*) from TBL_Racer_Details o where o.UserName = @UserName and o.Password = @Password", conn);
                cmd.Parameters.AddWithValue("@UserName", obj.Name);
                cmd.Parameters.AddWithValue("@Password", obj.Password); 
                conn.Open();
                count = Convert.ToInt32(cmd.ExecuteScalar());
                conn.Close();
                if (count > 0)
                {
                    ViewBag.Message = "User Already Exist.";
                }
                else
                {
                    MySql.Data.MySqlClient.MySqlCommand cmd1 = new MySql.Data.MySqlClient.MySqlCommand("insert into TBL_Racer_Details(UserName,FirstName,LastName,Email,PhoneNO,Password,Age,UserRoles) values(@UserName,@FirstName,@LastName,@Email,@PhoneNO,@Password,@Age,@UserRoles)", conn);
                    cmd1.Parameters.AddWithValue("@UserName", obj.Name);
                    cmd1.Parameters.AddWithValue("@FirstName", obj.FirstName);
                    cmd1.Parameters.AddWithValue("@LastName", obj.LastName);
                    cmd1.Parameters.AddWithValue("@Email", obj.Email);
                    cmd1.Parameters.AddWithValue("@PhoneNO", obj.Phone);
                    cmd1.Parameters.AddWithValue("@Password", obj.Password);
                    cmd1.Parameters.AddWithValue("@Age", obj.Age);
                    cmd1.Parameters.AddWithValue("@UserRoles", obj.Roles);
                    conn.Open();
                    count = cmd1.ExecuteNonQuery();
                    conn.Close();
                    if (count == 0)
                    {
                        ViewBag.Message = "Error While inserting Data.";
                    }
                    else
                    {
                        return RedirectToAction("Login", "RacingTournament");
                    }
                }
            }
            return View();
        }

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult RacerDetails()
        {
            List<RegistrationDetails> lstDetails = new List<RegistrationDetails>();
            DataSet ds = new DataSet();
            using (MySql.Data.MySqlClient.MySqlConnection conn = new MySql.Data.MySqlClient.MySqlConnection(Connection))
            {
                MySql.Data.MySqlClient.MySqlDataAdapter da = new MySql.Data.MySqlClient.MySqlDataAdapter("select * from TBL_Racer_Details Where UserRoles='Racers'", conn);
                da.Fill(ds);

                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    RegistrationDetails RegistrationDetails = new RegistrationDetails();
                    RegistrationDetails.UserID = dr["UserID"].ToString();
                    RegistrationDetails.Name = dr["UserName"].ToString();
                    RegistrationDetails.FirstName = dr["FirstName"].ToString();
                    RegistrationDetails.LastName = dr["LastName"].ToString();
                    RegistrationDetails.Email = dr["Email"].ToString();
                    RegistrationDetails.Phone = dr["PhoneNO"].ToString();
                    RegistrationDetails.Age = dr["Age"].ToString(); 
                    lstDetails.Add(RegistrationDetails);
                }
            }
            return View(lstDetails);
        }

        [AllowAnonymous]
        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Login");
        }
    }
}