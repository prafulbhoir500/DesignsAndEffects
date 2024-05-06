using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if the user is already logged in, if so, redirect to another page
            if (Session["username"] != null)
            {
                Response.Redirect("Dashboard.aspx");
            }

            if(Request.QueryString["R"]!=null& Request.QueryString["R"]=="1")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "displayalertmessage", "alert('Registration Successfull');", true);
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.ToLower();
            string password = txtPassword.Text;

            // Validate user credentials against your database
            if (ValidateUser(username, password))
            {
                // If credentials are valid, store username in session and redirect to dashboard
                Session["username"] = username;
                Response.Redirect("~/Dashboard/AdminDashboard.aspx");
            }
            else
            {
                // If credentials are invalid, display error message
                Response.Write("<script>alert('Invalid username or password');</script>");
            }
        }

        private bool ValidateUser(string username, string password)
        {
            // Connection string to your database
            string connectionString = ConfigurationManager.ConnectionStrings["SQLCon"].ConnectionString;

            // SQL query to check if username and password match
            string query = "SELECT COUNT(*) FROM UserInfo WHERE UserName = @Username AND Password = @Password";

            // Establish connection and command objects
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Add parameters to the command
                    command.Parameters.AddWithValue("@Username", username);
                    command.Parameters.AddWithValue("@Password", password);

                    // Open the connection and execute the command
                    connection.Open();
                    int count = (int)command.ExecuteScalar();

                    // If count is greater than 0, credentials are valid
                    return count > 0;
                }
            }
        }
    }
}