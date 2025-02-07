# One of:Cheatsheets:Identity and Access Management (IAM)

## KEYCLOAK CHEAT SHEET

### **1. Key Concepts**

| **Concept**           | **Description**                                                                               | **Example**                                        |
| --------------------- | --------------------------------------------------------------------------------------------- | -------------------------------------------------- |
| **Realm**             | Logical container for users, apps, roles, and settings.                                       | `dev-realm`, `prod-realm`.                         |
| **Client**            | Applications/service integrated with Keycloak (OIDC or SAML).                                 | Web App, Mobile App.                               |
| **Users**             | Real people/entities logging in or represented in Keycloak.                                   | Employees, Vendors, API Consumers.                 |
| **Roles**             | A set of defined permissions assigned to users/groups.                                        | Admin, Manager, Viewer.                            |
| **Groups**            | Organized collection of users to apply roles or settings collectively.                        | Admins Group, Employees, Engineers.                |
| **Identity Provider** | External authentication sources integrated with Keycloak.                                     | Google, Microsoft AD, GitHub.                      |
| **Federation**        | Connecting Keycloak to existing external user stores (LDAP, Active Directory).                | Use existing company's Active Directory for login. |
| **Authentication**    | Log-in mechanism defining custom requirements like OTP, password complexity, and multifactor. | OTP-based flows, custom authentication methods.    |

---

### **2. Keycloak Architecture**

Below is an diagram showing how Keycloak interacts with various IAM components:

```
          +---------------------+
          |    External IdPs    |
          | (Google, Facebook)  |
          +---------------------+
                     |
                     v
+--------------------+--------------------+
|                  Keycloak IAM          |
|----------------------------------------|
|  Realms                                 |
|  - Manage: Users, Tokens, Apps         |
|  - Handle: Authentication Flows, Themes|
|                                        |
|  User Federation                       |
|  Identity Providers (SSO, Social Login)|
+----------------------------------------+
                     |
        +------------+------------+
        |                         |
+----------------+         +----------------+
| Front-End App  |         |  Backend/API   |
|  (OIDC Login)  |         |  Secured API   |
+----------------+         +----------------+
```

---

### **3. Keycloak Protocols Overview**

| **Protocol** | **Use Case**            | **Endpoints (Examples)**                                | **Notes**                                                   |
| ------------ | ----------------------- | ------------------------------------------------------- | ----------------------------------------------------------- |
| **OIDC**     | Modern apps, Web APIs   | `/auth/realms/{realm}/protocol/openid-connect/auth`     | Built on OAuth2; popular for interacting with RESTful APIs. |
|              |                         | `/auth/realms/{realm}/protocol/openid-connect/token`    | Supports JWT for secure API communication.                  |
|              |                         | `/auth/realms/{realm}/protocol/openid-connect/userinfo` | Provides user profile/claims.                               |
| **SAML**     | Enterprise, Legacy Apps | `/auth/realms/{realm}/protocol/saml`                    | XML-based auth for apps and SaaS where SAML is preferred.   |

#### Token Lifecycle (OIDC)

```
User Login ->
   -> Access Token [short lifespan]
   -> Refresh Token [medium-lived]
   -> ID Token
```

| Token Type        | Use Case                                         | Validity                       |
| ----------------- | ------------------------------------------------ | ------------------------------ |
| **Access Token**  | Authorizes APIs/resources.                       | Short-lived (e.g., 5-10 mins). |
| **Refresh Token** | Get a new access token when the current expires. | Medium-lived (e.g., 30 mins).  |
| **ID Token**      | Confirms user identity during authentication.    | Same lifespan as Access Token. |

---

### **4. Managing Users, Groups, and Roles**

#### User Management Commands (REST API)

| **Action**       | **Command/Endpoint**                                                             |
| ---------------- | -------------------------------------------------------------------------------- |
| Create User      | `POST /auth/admin/realms/{realm}/users` (`{username, email, enabled}` in body).  |
| List Users       | `GET /auth/admin/realms/{realm}/users`.                                          |
| Update User Info | `PUT /auth/admin/realms/{realm}/users/{id}` (JSON payload to modify attributes). |
| Disable a User   | `PUT /auth/admin/realms/{realm}/users/{id}` (`enabled: false` in JSON payload).  |

#### Group Management Example Commands

| **Action**        | **Command/Endpoint**                                               |
| ----------------- | ------------------------------------------------------------------ |
| List Groups       | `GET /auth/admin/realms/{realm}/groups`.                           |
| Create a Group    | `POST /auth/admin/realms/{realm}/groups` (`name` in request body). |
| Add User to Group | `PUT /auth/admin/realms/{realm}/users/{userId}/groups/{groupId}`.  |
| Delete Group      | `DELETE /auth/admin/realms/{realm}/groups/{groupId}`.              |

#### Role Management

| **Action**          | **Command/Endpoint**                                                                           |
| ------------------- | ---------------------------------------------------------------------------------------------- |
| List All Roles      | `GET /auth/admin/realms/{realm}/roles`.                                                        |
| Assign Role to User | `POST /auth/admin/realms/{realm}/users/{userId}/role-mappings/realm` (JSON body with `roles`). |
| Delete User’s Role  | `DELETE /auth/admin/realms/{realm}/users/{userId}/role-mappings/realm` (Specify `roleName`).   |

---

### **5. Keycloak Admin CLI (`kcadm.sh`)**

#### Authentication

```bash
# Login to Keycloak
./kcadm.sh config credentials --server http://localhost:8080/auth --realm master \
  --user admin --password admin
```

#### Realm Management

| **Command**                  | **Description**            |
| ---------------------------- | -------------------------- |
| `create realms`              | Create a new realm.        |
| `get realms`                 | Get details of all realms. |
| `delete realms/{realm-name}` | Delete a specific realm.   |

Example:

```bash
./kcadm.sh create realms -s realm=my-test-realm -s enabled=true
```

#### User Commands (CLI)

| **Command**                         | **Description**                  |
| ----------------------------------- | -------------------------------- |
| `create users -r {realm}`           | Create a new user in the realm.  |
| `get users -r {realm}`              | Retrieve all users in the realm. |
| `update users/{user-id} -r {realm}` | Modify user details.             |

Example:

```bash
# Create a new user
./kcadm.sh create users -r my-realm -s username=newuser -s email=newuser@example.com -s enabled=true
```

---

### **6. API Endpoints**

#### OpenID Connect Example (Token Exchange)

```bash
# Exchange credentials for tokens
curl -X POST "http://localhost:8080/auth/realms/my-realm/protocol/openid-connect/token" \
  -H "Content-Type: application/x-www-form-urlencoded" \
  -d "client_id=my-client" \
  -d "client_secret=my-secret" \
  -d "username=myuser" \
  -d "password=mypassword" \
  -d "grant_type=password"
```

#### Key Authentication Flows

| **Flow**           | **Purpose**                           | **Applicable APIs**                                                          |
| ------------------ | ------------------------------------- | ---------------------------------------------------------------------------- |
| Password Grant     | Basic username-password logins.       | `/protocol/openid-connect/token` (`grant_type=password`).                    |
| Authorization Code | Interactive browser SSO flows.        | `/protocol/openid-connect/auth` (initiates flow) `/token` (exchanges codes). |
| Logout Flow        | Logs out user and invalidates tokens. | `/protocol/openid-connect/logout`.                                           |

---

### **7. Authentication Customization**

#### Multi-Factor Authentication (MFA)

**Steps to Enable:**

1. Navigate to “Authentication” → Select `Browser` flow under “Flows.”
2. Add "OTP Form" to after “Username/Password.”
3. Configure OTP Type (Time-Based/Counter-Based) under "Authentication Config."

Diagram for Custom Auth Flows:

```
Login →
   → Username Input →
      → Password Verification →
         → OTP Authentication →
            → Successful Login.
```

---

### **8. Security Best Practices**

| **Aspect**                | **Best Practice**                                                                   |
| ------------------------- | ----------------------------------------------------------------------------------- |
| **HTTPS Everywhere**      | Always use SSL/TLS for all Keycloak instances.                                      |
| **Strong Passwords**      | Enforce password policies and use multi-factor authentication (MFA).                |
| **Token Expiry**          | Keep lifecycle of access/refresh tokens short to minimize misuse.                   |
| **Roles and Permissions** | Use fine-grained roles to prevent over-permissioning users.                         |
| **Monitor Events Logs**   | Enable logging (admin log events) to track failed attempts and suspicious activity. |

---

### **9. Themes and Customization**

**Customize Login Pages:**

1. Navigate to **Themes** → Set a custom theme folder for login UI.
2. Implement HTML/CSS changes in the folder specified under the `standalone` theme directory.

| **Resource**     | **Path**                                   |
| ---------------- | ------------------------------------------ |
| Login Page Theme | `/themes/{your-theme}/login/theme.ftl`.    |
| Email Templates  | `/themes/{your-theme}/email/template.ftl`. |
