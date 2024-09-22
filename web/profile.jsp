<%@page import="model.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit User Information</title>
    <style>
        table {
            width: 50%;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            border: 1px solid black;
        }
    </style>
</head>
<body>
    <h2>Edit User Information</h2>

    <%
        // Retrieve the user object from the session
        User user = (User) session.getAttribute("User");
        if (user == null) {
            out.println("User not found.");
            return;
        }
    %>

    <form action="changeProfile" method="post">
        <table>
            <tr>
                <th>Full Name</th>
                <td><input type="text" name="fullName" value="<%= user.getFullName() %>" required /></td>
            </tr>
            <tr>
                <th>Username</th>
                <td><input type="text" name="username" value="<%= user.getUsername() %>" required /></td>
            </tr>
            <tr>
                <th>Email</th>
                <td><input type="email" name="email" value="<%= user.getEmail() %>" required /></td>
            </tr>
            <tr>
                <th>Role ID</th>
                <td><input type="number" name="roleId" value="<%= user.getRoleId() %>" required /></td>
            </tr>
            <tr>
                <th>Status</th>
                <td>
                    <select name="status">
                        <option value="true" <%= user.getStatus() == 1 ? "selected" : "" %>>Active</option>
                        <option value="false" <%= user.getStatus() == 0 ? "selected" : "" %>>Inactive</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>Phone</th>
                <td><input type="text" name="phone" value="<%= user.getPhone() %>" /></td>
            </tr>
            <tr>
                <th>Address</th>
                <td><input type="text" name="address" value="<%= user.getAddress() %>" /></td>
            </tr>
            <tr>
                <th>Image</th>
                <td><input type="text" name="image" value="<%= user.getImage() %>" /></td>
            </tr>
        </table>
        <input type="submit" value="Update Information" />
    </form>
</body>
</html>
