using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace Web
{
    public partial class Registration : System.Web.UI.Page
    {
        // Connection string to your database
        string connectionString = ConfigurationManager.ConnectionStrings["SQLCon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if the user is already logged in, if so, redirect to another page
            if (Session["username"] != null)
            {
                Response.Redirect("Dashboard.aspx");
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.ToLower();
            string email = txtEmail.Text;
            string password = txtPassword.Text;
            string fullName = txtFullName.Text;
            string gender = ddlGender.SelectedValue;
            string address = txtAddress.Text;

            // Insert user data into the database
            InsertUser(username, email, password, fullName, gender, address);

            // Redirect to a confirmation page or login page
            Response.Redirect("~/Login.aspx?R=1");
        }

        private void InsertUser(string username, string email, string password, string fullName, string gender, string address)
        {
            try
            {
                
                // SQL query to insert user data into UserInfo table
                string query = "INSERT INTO UserInfo (UserName, Email, Password, FullName, Gender, Address, CreatedOn) " +
                               "VALUES (@UserName, @Email, @Password, @FullName, @Gender, @Address,GETDATE())";

                // Establish connection and command objects
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        // Add parameters to the command
                        command.Parameters.AddWithValue("@UserName", username);
                        command.Parameters.AddWithValue("@Email", email);
                        command.Parameters.AddWithValue("@Password", password);
                        command.Parameters.AddWithValue("@FullName", fullName);
                        command.Parameters.AddWithValue("@Gender", gender);
                        command.Parameters.AddWithValue("@Address", address);

                        // Open the connection and execute the command
                        connection.Open();
                        command.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "displayalertmessage", "alert('"+ex.Message+"');", true);
            }
        }

        protected void txtUsername_TextChanged(object sender, EventArgs e)
        {
            bool isAvailable=IsUsernameUnique(txtUsername.Text.Trim().ToLower());

            if(!isAvailable)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "displayalertmessage", "alert('Username already exists');", true);
            }
        }

        private bool IsUsernameUnique(string username)
        {

            // SQL query to check if the username already exists
            string query = "SELECT COUNT(*) FROM UserInfo WHERE UserName = @UserName";

            // Establish connection and command objects
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Add parameter to the command
                    command.Parameters.AddWithValue("@UserName", username);

                    // Open the connection and execute the command
                    connection.Open();
                    int count = (int)command.ExecuteScalar();

                    // If count is 0, username is unique; otherwise, it already exists
                    return count == 0;
                }
            }
        }
    }
}