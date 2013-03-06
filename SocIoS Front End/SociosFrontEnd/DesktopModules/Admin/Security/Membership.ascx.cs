#region Copyright
// 
// DotNetNuke� - http://www.dotnetnuke.com
// Copyright (c) 2002-2012
// by DotNetNuke Corporation
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated 
// documentation files (the "Software"), to deal in the Software without restriction, including without limitation 
// the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and 
// to permit persons to whom the Software is furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in all copies or substantial portions 
// of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED 
// TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL 
// THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF 
// CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER 
// DEALINGS IN THE SOFTWARE.
#endregion
#region Usings

using System;

using DotNetNuke.Entities.Modules;
using DotNetNuke.Entities.Users;
using DotNetNuke.Security.Roles;
using DotNetNuke.Web.UI.WebControls;

#endregion

namespace DotNetNuke.Modules.Admin.Users
{
    /// -----------------------------------------------------------------------------
    /// Project:    DotNetNuke
    /// Namespace:  DotNetNuke.Modules.Admin.Users
    /// Class:      Membership
    /// -----------------------------------------------------------------------------
    /// <summary>
    /// The Membership UserModuleBase is used to manage the membership aspects of a
    /// User
    /// </summary>
    /// <history>
    /// 	[cnurse]	03/01/2006  Created
    /// </history>
    /// -----------------------------------------------------------------------------
    public partial class Membership : UserModuleBase
    {
		#region "Public Properties"

        /// -----------------------------------------------------------------------------
        /// <summary>
        /// Gets the UserMembership associated with this control
        /// </summary>
        /// <history>
        /// 	[cnurse]	03/01/2006  Created
        /// </history>
        /// -----------------------------------------------------------------------------
        public UserMembership UserMembership
        {
            get
            {
                UserMembership membership = null;
                if (User != null)
                {
                    membership = User.Membership;
                }
                return membership;
            }
        }
		
		#endregion

		#region "Events"

        /// -----------------------------------------------------------------------------
        /// <summary>
        /// Raises the MembershipAuthorized Event
        /// </summary>
        /// <history>
        /// 	[cnurse]	03/01/2006  Created
        /// </history>
        /// -----------------------------------------------------------------------------


        public event EventHandler MembershipAuthorized;
        public event EventHandler MembershipPasswordUpdateChanged;
        public event EventHandler MembershipUnAuthorized;
        public event EventHandler MembershipUnLocked;

		#endregion

		#region "Event Methods"

        /// -----------------------------------------------------------------------------
        /// <summary>
        /// Raises the MembershipAuthorized Event
        /// </summary>
        /// <history>
        /// 	[cnurse]	03/01/2006  Created
        /// </history>
        /// -----------------------------------------------------------------------------
        public void OnMembershipAuthorized(EventArgs e)
        {
            if (IsUserOrAdmin == false)
            {
                return;
            }
            if (MembershipAuthorized != null)
            {
                MembershipAuthorized(this, e);
            }
        }

        /// -----------------------------------------------------------------------------
        /// <summary>
        /// Raises the MembershipPasswordUpdateChanged Event
        /// </summary>
        /// <history>
        /// 	[cnurse]	05/14/2008  Created
        /// </history>
        /// -----------------------------------------------------------------------------
        public void OnMembershipPasswordUpdateChanged(EventArgs e)
        {
            if (IsUserOrAdmin == false)
            {
                return;
            }
            if (MembershipPasswordUpdateChanged != null)
            {
                MembershipPasswordUpdateChanged(this, e);
            }
        }

        /// -----------------------------------------------------------------------------
        /// <summary>
        /// Raises the MembershipUnAuthorized Event
        /// </summary>
        /// <history>
        /// 	[cnurse]	03/01/2006  Created
        /// </history>
        /// -----------------------------------------------------------------------------
        public void OnMembershipUnAuthorized(EventArgs e)
        {
            if (IsUserOrAdmin == false)
            {
                return;
            }
            if (MembershipUnAuthorized != null)
            {
                MembershipUnAuthorized(this, e);
            }
        }

        /// -----------------------------------------------------------------------------
        /// <summary>
        /// Raises the MembershipUnLocked Event
        /// </summary>
        /// <history>
        /// 	[cnurse]	03/01/2006  Created
        /// </history>
        /// -----------------------------------------------------------------------------
        public void OnMembershipUnLocked(EventArgs e)
        {
            if (IsUserOrAdmin == false)
            {
                return;
            }
            if (MembershipUnLocked != null)
            {
                MembershipUnLocked(this, e);
            }
        }

		#endregion

		#region "Public Methods"

        /// -----------------------------------------------------------------------------
        /// <summary>
        /// DataBind binds the data to the controls
        /// </summary>
        /// <history>
        /// 	[cnurse]	03/01/2006  Created
        /// </history>
        /// -----------------------------------------------------------------------------
        public override void DataBind()
        {
			//disable/enable buttons
            if (UserInfo.UserID == User.UserID)
            {
                cmdAuthorize.Visible = false;
                cmdUnAuthorize.Visible = false;
                cmdUnLock.Visible = false;
                cmdPassword.Visible = false;
            }
            else
            {
                cmdUnLock.Visible = UserMembership.LockedOut;
                cmdUnAuthorize.Visible = UserMembership.Approved;
                cmdAuthorize.Visible = !UserMembership.Approved;
                cmdPassword.Visible = !UserMembership.UpdatePassword;
            }

            lastLockoutDate.Value = UserMembership.LastLockoutDate.Year > 2000 
                                        ? (object) UserMembership.LastLockoutDate 
                                        : LocalizeString("Never");

            membershipForm.DataSource = UserMembership;
            membershipForm.DataBind();
        }

		#endregion

		#region "Event Handlers"

        /// -----------------------------------------------------------------------------
        /// <summary>
        /// Page_Load runs when the control is loaded
        /// </summary>
        /// <remarks>
        /// </remarks>
        /// <history>
        /// 	[cnurse]	03/01/2006  Created
        /// </history>
        /// -----------------------------------------------------------------------------
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);

            cmdAuthorize.Click += cmdAuthorize_Click;
            cmdPassword.Click += cmdPassword_Click;
            cmdUnAuthorize.Click += cmdUnAuthorize_Click;
            cmdUnLock.Click += cmdUnLock_Click;
        }

        /// -----------------------------------------------------------------------------
        /// <summary>
        /// cmdAuthorize_Click runs when the Authorize User Button is clicked
        /// </summary>
        /// <history>
        /// 	[cnurse]	03/01/2006  Created
        /// </history>
        /// -----------------------------------------------------------------------------
        private void cmdAuthorize_Click(object sender, EventArgs e)
        {
            if (IsUserOrAdmin == false)
            {
                return;
            }
            if (Request.IsAuthenticated != true) return;

			//Get the Membership Information from the property editors
            User.Membership = (UserMembership)membershipForm.DataSource;

            User.Membership.Approved = true;

            //Update User
            UserController.UpdateUser(PortalId, User);

            //Update User Roles if needed
            if (!User.IsSuperUser && User.IsInRole("Unverified Users") && PortalSettings.UserRegistration == (int)Common.Globals.PortalRegistrationType.VerifiedRegistration)
            {
                UserController.ApproveUser(User);
            }

            OnMembershipAuthorized(EventArgs.Empty);
        }

        /// -----------------------------------------------------------------------------
        /// <summary>
        /// cmdPassword_Click runs when the ChangePassword Button is clicked
        /// </summary>
        /// <history>
        /// 	[cnurse]	03/15/2006  Created
        /// </history>
        /// -----------------------------------------------------------------------------
        private void cmdPassword_Click(object sender, EventArgs e)
        {
            if (IsUserOrAdmin == false)
            {
                return;
            }
            if (Request.IsAuthenticated != true) return;

			//Get the Membership Information from the property editors
            User.Membership = (UserMembership)membershipForm.DataSource;

            User.Membership.UpdatePassword = true;

            //Update User
            UserController.UpdateUser(PortalId, User);

            OnMembershipPasswordUpdateChanged(EventArgs.Empty);
        }

        /// -----------------------------------------------------------------------------
        /// <summary>
        /// cmdUnAuthorize_Click runs when the UnAuthorize User Button is clicked
        /// </summary>
        /// <history>
        /// 	[cnurse]	03/01/2006  Created
        /// </history>
        /// -----------------------------------------------------------------------------
        private void cmdUnAuthorize_Click(object sender, EventArgs e)
        {
            if (IsUserOrAdmin == false)
            {
                return;
            }
            if (Request.IsAuthenticated != true) return;

			//Get the Membership Information from the property editors
            User.Membership = (UserMembership)membershipForm.DataSource;

            User.Membership.Approved = false;

            //Update User
            UserController.UpdateUser(PortalId, User);

            OnMembershipUnAuthorized(EventArgs.Empty);
        }

        /// -----------------------------------------------------------------------------
        /// <summary>
        /// cmdUnlock_Click runs when the Unlock Account Button is clicked
        /// </summary>
        /// <history>
        /// 	[cnurse]	03/01/2006  Created
        /// </history>
        /// -----------------------------------------------------------------------------
        private void cmdUnLock_Click(Object sender, EventArgs e)
        {
            if (IsUserOrAdmin == false)
            {
                return;
            }
            if (Request.IsAuthenticated != true) return;

			//update the user record in the database
            bool isUnLocked = UserController.UnLockUser(User);

            if (isUnLocked)
            {
                User.Membership.LockedOut = false;

                OnMembershipUnLocked(EventArgs.Empty);
            }
        }
		
		#endregion
    }
}